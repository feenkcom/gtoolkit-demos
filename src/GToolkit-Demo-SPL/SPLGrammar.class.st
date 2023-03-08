"
SPL is the toy language for the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.

I demonstrate a PetitParser implementation of the grammar.
My subclasses implement actions.

See {{gtClass:name=SPLGrammarExamples}} for examples of all the parser rules.
"
Class {
	#name : #SPLGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'keyword',
		'identifier',
		'boolean',
		'integer',
		'float',
		'number',
		'string',
		'varDecl',
		'primary',
		'unary',
		'factor',
		'term',
		'comparison',
		'equality',
		'logicAnd',
		'logicOr',
		'assignment',
		'expression',
		'exprStmt',
		'printStmt',
		'ifStmt',
		'whileStmt',
		'block',
		'statement',
		'declaration',
		'program',
		'parenthesizedExpression',
		'negatedUnary',
		'assignmentExpression',
		'comment',
		'ignorable'
	],
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #grammar }
SPLGrammar >> assignment [
	^ assignmentExpression / logicOr
]

{ #category : #grammar }
SPLGrammar >> assignmentExpression [
	^ (identifier trim: ignorable) , ($= asPParser trim: ignorable) , assignment
]

{ #category : #grammar }
SPLGrammar >> block [
	^ ('{' asPParser trim: ignorable) , declaration star
		, ($} asPParser trim: ignorable)
]

{ #category : #grammar }
SPLGrammar >> boolean [
	^ ('true' asPParser trim: ignorable) / ('false' asPParser trim: ignorable)
]

{ #category : #grammar }
SPLGrammar >> comment [
	^ '//' asPParser , #newline asPParser negate star
]

{ #category : #grammar }
SPLGrammar >> comparison [
	^ term
		, (('>=' asPParser trim: ignorable) / ('>' asPParser trim: ignorable)
				/ ('<=' asPParser trim: ignorable) / ('<' asPParser trim: ignorable) , term)
				star
]

{ #category : #grammar }
SPLGrammar >> declaration [
	^ varDecl / statement
]

{ #category : #grammar }
SPLGrammar >> equality [
	^ comparison
		, (('!=' asPParser trim: ignorable) / ('==' asPParser trim: ignorable)
				, comparison) star
]

{ #category : #grammar }
SPLGrammar >> exprStmt [
	^ expression , ($; asPParser trim: ignorable)
]

{ #category : #grammar }
SPLGrammar >> expression [
	^ assignment
]

{ #category : #grammar }
SPLGrammar >> factor [
	^ unary
		, (($/ asPParser trim: ignorable) / ($* asPParser trim: ignorable) , unary) star
]

{ #category : #grammar }
SPLGrammar >> float [
	^ $- asPParser optional , #digit asPParser plus , $. asPParser
		, #digit asPParser plus trim: ignorable
]

{ #category : #grammar }
SPLGrammar >> identifier [
	^ keyword not , #letter asPParser , #word asPParser star
]

{ #category : #grammar }
SPLGrammar >> ifStmt [
	^ ('if' asPParser trim: ignorable) , ($( asPParser trim: ignorable)
		, expression , ($) asPParser trim: ignorable) , statement
		, (('else' asPParser trim: ignorable) , statement) optional
]

{ #category : #grammar }
SPLGrammar >> ignorable [
	^ (comment / #space asPParser) star
]

{ #category : #grammar }
SPLGrammar >> integer [
	^ #digit asPParser plus , $. asPParser not trim: ignorable
]

{ #category : #grammar }
SPLGrammar >> keyword [
	^ ('var' asPParser , #letter asPParser not)
		/ ('if' asPParser , #letter asPParser not)
		/ ('else' asPParser , #letter asPParser not)
		/ ('while' asPParser , #letter asPParser not)
		/ ('true' asPParser , #letter asPParser not)
		/ ('false' asPParser , #letter asPParser not)
		/ ('and' asPParser , #letter asPParser not)
		/ ('or' asPParser , #letter asPParser not)
]

{ #category : #grammar }
SPLGrammar >> logicAnd [
	^ equality , (('and' asPParser trim: ignorable) , equality) star
]

{ #category : #grammar }
SPLGrammar >> logicOr [
	^ logicAnd , (('or' asPParser trim: ignorable) , logicAnd) star
]

{ #category : #grammar }
SPLGrammar >> negatedUnary [
	^ ($! asPParser trim: ignorable) / ($- asPParser trim: ignorable) , unary
]

{ #category : #grammar }
SPLGrammar >> number [
	^ integer / float
]

{ #category : #grammar }
SPLGrammar >> parenthesizedExpression [
	"Introduced to have finer control over actions."

	^ ($( asPParser trim: ignorable) , expression , ($) asPParser trim: ignorable)
]

{ #category : #grammar }
SPLGrammar >> primary [
	^ parenthesizedExpression / boolean / number / string / identifier
]

{ #category : #grammar }
SPLGrammar >> printStmt [
	^ ('print' asPParser trim: ignorable) , expression
		, ($; asPParser trim: ignorable)
]

{ #category : #grammar }
SPLGrammar >> program [
	^ declaration star end
]

{ #category : #accessing }
SPLGrammar >> start [
	^ program
]

{ #category : #grammar }
SPLGrammar >> statement [
	^ ifStmt / printStmt / whileStmt / exprStmt / block
]

{ #category : #grammar }
SPLGrammar >> string [
	^ $" asPParser , $" asPParser negate plus , $" asPParser
]

{ #category : #grammar }
SPLGrammar >> term [
	^ factor
		, (('-' asPParser trim: ignorable) / ('+' asPParser trim: ignorable) , factor)
				star
]

{ #category : #grammar }
SPLGrammar >> unary [
	^ negatedUnary / primary
]

{ #category : #grammar }
SPLGrammar >> varDecl [
	^ (('var' asPParser trim: ignorable) , identifier
		, (($= asPParser trim: ignorable) , expression) optional
		, ($; asPParser trim: ignorable))
		==> [ :node | 
			node third
				ifNil: [ SPLDeclaration for: node second ]
				ifNotNil: [ SPLInitializedDeclaration for: node second with: node third second ] ]
]

{ #category : #grammar }
SPLGrammar >> whileStmt [
	^ ('while' asPParser trim: ignorable) , ($( asPParser trim: ignorable)
		, expression , ($) asPParser trim: ignorable) , statement
]
