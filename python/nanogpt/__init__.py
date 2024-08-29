from dataclasses import dataclass

import torch
import torch.nn as nn
from torch.nn import functional as F

from gtoolkit_bridge import gtView
import torch.nn as nn
import torch


# hyperparameters
batch_size = 16 # how many independent sequences will we process in parallel?
block_size = 32 # what is the maximum context length for predictions?
max_iters = 5000
eval_interval = 100
learning_rate = 1e-3
device = 'cuda' if torch.cuda.is_available() else 'cpu'
eval_iters = 200
n_embd = 64
n_head = 4
n_layer = 4
dropout = 0.0
# ------------

torch.manual_seed(1337)

# data loading
def get_batch(data):
	ix = torch.randint(len(data) - block_size, (batch_size,))
	x = torch.stack([data[i:i+block_size] for i in ix])
	y = torch.stack([data[i+1:i+block_size+1] for i in ix])
	x, y = x.to(device), y.to(device)
	return x, y


class Head(nn.Module):
	""" one head of self-attention """

	def __init__(self, head_size):
		super().__init__()
		self.key = nn.Linear(n_embd, head_size, bias=False)
		self.query = nn.Linear(n_embd, head_size, bias=False)
		self.value = nn.Linear(n_embd, head_size, bias=False)
		self.register_buffer('tril', torch.tril(torch.ones(block_size, block_size)))

		self.dropout = nn.Dropout(dropout)

	def forward(self, x):
		B,T,C = x.shape
		k = self.key(x)   # (B,T,C)
		q = self.query(x) # (B,T,C)
		# compute attention scores ("affinities")
		wei = q @ k.transpose(-2,-1) * C**-0.5 # (B, T, C) @ (B, C, T) -> (B, T, T)
		wei = wei.masked_fill(self.tril[:T, :T] == 0, float('-inf')) # (B, T, T)
		wei = F.softmax(wei, dim=-1) # (B, T, T)
		wei = self.dropout(wei)
		# perform the weighted aggregation of the values
		v = self.value(x) # (B,T,C)
		out = wei @ v # (B, T, T) @ (B, T, C) -> (B, T, C)
		return out

class MultiHeadAttention(nn.Module):
	""" multiple heads of self-attention in parallel """

	def __init__(self, num_heads, head_size):
		super().__init__()
		self.heads = nn.ModuleList([Head(head_size) for _ in range(num_heads)])
		self.proj = nn.Linear(n_embd, n_embd)
		self.dropout = nn.Dropout(dropout)

	def forward(self, x):
		out = torch.cat([h(x) for h in self.heads], dim=-1)
		out = self.dropout(self.proj(out))
		return out

class FeedFoward(nn.Module):
	""" a simple linear layer followed by a non-linearity """

	def __init__(self, n_embd):
		super().__init__()
		self.net = nn.Sequential(
			nn.Linear(n_embd, 4 * n_embd),
			nn.ReLU(),
			nn.Linear(4 * n_embd, n_embd),
			nn.Dropout(dropout),
		)

	def forward(self, x):
		return self.net(x)

class Block(nn.Module):
	""" Transformer block: communication followed by computation """

	def __init__(self, n_embd, n_head):
		# n_embd: embedding dimension, n_head: the number of heads we'd like
		super().__init__()
		head_size = n_embd // n_head
		self.sa = MultiHeadAttention(n_head, head_size)
		self.ffwd = FeedFoward(n_embd)
		self.ln1 = nn.LayerNorm(n_embd)
		self.ln2 = nn.LayerNorm(n_embd)

	def forward(self, x):
		x = x + self.sa(self.ln1(x))
		x = x + self.ffwd(self.ln2(x))
		return x

# super simple bigram model
class BigramLanguageModel(nn.Module):

	def __init__(self, vocab_size):
		super().__init__()
		# each token directly reads off the logits for the next token from a lookup table
		self.token_embedding_table = nn.Embedding(vocab_size, n_embd)
		self.position_embedding_table = nn.Embedding(block_size, n_embd)
		self.blocks = nn.Sequential(*[Block(n_embd, n_head=n_head) for _ in range(n_layer)])
		self.ln_f = nn.LayerNorm(n_embd) # final layer norm
		self.lm_head = nn.Linear(n_embd, vocab_size)

	def forward(self, idx, targets=None):
		B, T = idx.shape

		# idx and targets are both (B,T) tensor of integers
		tok_emb = self.token_embedding_table(idx) # (B,T,C)
		pos_emb = self.position_embedding_table(torch.arange(T, device=device)) # (T,C)
		x = tok_emb + pos_emb # (B,T,C)
		x = self.blocks(x) # (B,T,C)
		x = self.ln_f(x) # (B,T,C)
		logits = self.lm_head(x) # (B,T,vocab_size)

		if targets is None:
			loss = None
		else:
			B, T, C = logits.shape
			logits = logits.view(B*T, C)
			targets = targets.view(B*T)
			loss = F.cross_entropy(logits, targets)

		return logits, loss

	def generate(self, idx, max_new_tokens):
		# idx is (B, T) array of indices in the current context
		for _ in range(max_new_tokens):
			# crop idx to the last block_size tokens
			idx_cond = idx[:, -block_size:]
			# get the predictions
			logits, loss = self(idx_cond)
			# focus only on the last time step
			logits = logits[:, -1, :] # becomes (B, C)
			# apply softmax to get probabilities
			probs = F.softmax(logits, dim=-1) # (B, C)
			# sample from the distribution
			idx_next = torch.multinomial(probs, num_samples=1) # (B, 1)
			# append sampled index to the running sequence
			idx = torch.cat((idx, idx_next), dim=1) # (B, T+1)
		return idx

@dataclass
class TrainingContext:
	model: nn.Module

	@gtView
	def gt_view_children(self, builder):
		fwd = builder.forward()
		fwd.title('Architecture')
		fwd.priority(10)
		fwd.object(lambda: self.model)
		fwd.view('gt_view_children')
		return fwd


def train(data, vocab_size):
	m = BigramLanguageModel(vocab_size)
	model = m.to(device)

	# create a PyTorch optimizer
	optimizer = torch.optim.AdamW(model.parameters(), lr=learning_rate)

	# Train and test splits
	data = torch.tensor(data, dtype=torch.long)

	for iter in range(max_iters):
		# sample a batch of data
		xb, yb = get_batch(data)

		# evaluate the loss
		logits, loss = m(xb, yb)
		optimizer.zero_grad(set_to_none=True)
		loss.backward()
		optimizer.step()

	return TrainingContext(model=model)


def generate_tokens(training_context, max_tokens, context=None):
	if context is None:
		context = torch.zeros((1, 1), dtype=torch.long, device=device)
	else:
		context = torch.tensor(data, dtype=torch.long, device=device)

	return training_context.model.generate(context, max_new_tokens=max_tokens)[0].tolist()


@gtView
def nn_gt_view_children(self, builder):
	tree = builder.columnedTree()
	tree.title('Children')
	tree.priority(10)
	tree.items(lambda: self.named_children())
	tree.children(lambda item: item[1].named_children())
	tree.column('Name', lambda each: each[0])
	tree.column('Parameters', lambda each: [e[0] for e in each[1].named_parameters()])
	tree.set_accessor(lambda each: each[1])
	return tree

setattr(nn.Module, 'gt_view_children', nn_gt_view_children)

@gtView
def nn_gt_view_parameters(self, builder):
	lst = builder.columnedList()
	lst.title('Parameters')
	lst.priority(15)
	lst.items(lambda: self.named_parameters())
	lst.column('Name', lambda each: each[0])
	lst.column('Value', lambda each: each[1])
	lst.set_accessor(lambda idx: list(self.named_parameters())[idx][1])
	return lst

setattr(nn.Module, 'gt_view_parameters', nn_gt_view_parameters)


@gtView
def tensor_gt_view_matrix(self, builder):
	if self.ndim == 0:
		return builder.empty()
		
	lst = builder.list()
	lst.title('Data')
	lst.priority(5)
	lst.items(lambda: self)
	return lst

setattr(torch.Tensor, 'gt_view_matrix',tensor_gt_view_matrix)


def tensor_flattened_list(self):
	return [e.item() for e in torch.flatten(self)]

setattr(torch.Tensor, 'flattened_list', tensor_flattened_list)
