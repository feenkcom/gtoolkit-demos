"
Slideshow for the P2 Smalltalk lecture planned for 2022-05-20.

```
SmalltalkIntroSlideshow show
```

"
Class {
	#name : #SmalltalkIntroSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #utility }
SmalltalkIntroSlideshow class >> show [
	"Implement this here just so we can run it directly from the Coder."
	super show
]

{ #category : #slides }
SmalltalkIntroSlideshow >> addingAutoPlay: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Changing a running system')
]

{ #category : #page }
SmalltalkIntroSlideshow >> addingAutoPlayPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Changing a running system')
		addSnippet: (LeTextSnippet new
				string: '#Introducing an autoplay feature to a running game';
				addSnippet: (LeTextSnippet new
						string: 'Since games may last a long time, an autoplay feature would be useful to exercise the game.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We start by inspecting a live instance.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game := GtLudoGame new';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We can interact with it programatically. *(NB: Just evaluate the snippet instead of inspecting the result, to see the effect on the game.)* ';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game roll: 6.
game moveTokenNamed: ''a''';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Automating one move.';
				addSnippet: (LeTextSnippet new
						string: 'By exploring the code, we see that the methods {{gtMethod:name=GtLudoGame>>playerToRoll}} and {{gtMethod:name=GtLudoGame>>playerToMove}} tell us what should happen next.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Also {{gtMethod:name=GtLudoGame>>tokensToMove}} computes the set of tokens that can possibly move next. ';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We roll the die or move as required: *(again, just evaluate the snippets)* ';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game playerToRoll ifTrue: [ game die roll ]';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game playerToMove ifTrue: [ game moveTokenNamed: game tokensToMove atRandom name ]';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Let''s combine them. We can just repeatedly perform this snippet to play the game.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game playerToRoll ifTrue: [ game die roll ].
game playerToMove ifTrue: [ 
	game moveTokenNamed: game tokensToMove atRandom name ]';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Introducing an autoPlay:method';
				addSnippet: (LeTextSnippet new
						string: 'Let''s turn this into a method that repeatedly plays a number of moves.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Normally we would program this directly in the Coder (i.e., use the + button to add a method), but we can also do it programmatically.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'GtLudoGame compile: ''autoPlay: numberOfMoves
	(1 to: numberOfMoves) do: [ :n | 
		self playerToRoll ifTrue: [ self die roll ].
		self playerToMove ifTrue: [ 
			self moveTokenNamed: self tokensToMove atRandom name ] ]''';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Now we can use it to play. Inspect this, and then evaluate the autoplay snippet:';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game := GtLudoGame new';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game autoPlay: 1000';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Note that we get an exception at the end, as we try to continue to play after the game is over.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We can fix the autoPlay: method to immediately return if the game is over.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: '(We add `self isOver ifTrue: [ ^ self ].` at the start of the loop.)';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'GtLudoGame compile: ''autoPlay: numberOfMoves
	(1 to: numberOfMoves) do: [ :n | 
		self isOver ifTrue: [ ^ self ].
		self playerToRoll ifTrue: [ self die roll ].
		self playerToMove ifTrue: [ 
			self moveTokenNamed: self tokensToMove atRandom name ] ]''';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Now we can safely play without an exception.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '';
				yourself);
		yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> bouncingAtoms: aSlide [
	"<gtSlide>"

	^ aSlide lepiterPage
		setPriority;
		startPage: self bouncingAtomsPage
]

{ #category : #page }
SmalltalkIntroSlideshow >> bouncingAtomsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Changing a running system on the fly')
		addSnippet: (LeTextSnippet new
				string: '#Bouncing atoms simulation';
				addSnippet: (LeTextSnippet new
						string: 'This demo shows a simple simulation of atoms bouncing against four walls.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'BlBouncingAtomsElement demo';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'However these are not just animated pixels but live objects that we can interact with.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Inspecting live objects';
				addSnippet: (LeTextSnippet new
						string: 'Try to find an atom that is not moving. Click on it and drag it.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Double-click on it to open a new Inspector tab on it';
						addSnippet: (LeTextSnippet new
								string: '*Tip: to see three columns instead of two, grab the right edge of each column and drag them to make them skinnier.*';
								yourself);
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Objects have (moldable) views';
				addSnippet: (LeTextSnippet new
						string: 'Have a look at the various tabs. Each shows a different view.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Children and Parents show us how the graphicalelements are composed.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'The Raw view shows us the object state. The Meta view shows us the code.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Note that the velocity (Raw view) is `0@0` — 0 in both x and y directions.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Interacting with live objects';
				addSnippet: (LeTextSnippet new
						string: 'Pull up the bottom edge of the Inspector on the AtomElement to show a Playground. ';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Update the velocity by sending this message:';
						addSnippet: (LeTextSnippet new
								string: '```language=text
self velocity: 3@4
```';
								yourself);
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Maybe we can''t see anymore where it is, so let''s change the color:';
						addSnippet: (LeTextSnippet new
								string: '```language=text
self background: Color blue
```';
								yourself);
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We can also make it bigger:';
						addSnippet: (LeTextSnippet new
								string: '```language=text
self size: 10@10
```';
								yourself);
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Make live changes to the code';
				addSnippet: (LeTextSnippet new
						string: 'We would like the atoms to change color when they bounce against the walls.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'When they bounce, the atoms change their velocity, so let''s find the *senders* (methods which send) the message `velocity:`. Click on the `velocity:` message and type Cmd-n.';
						addSnippet: (LeTextSnippet new
								string: '*Tip:* Some useful keyboard shortcuts: Cmd-n (find seNders), Cmd-m (find iMplementors, Cmd-b (Browse code), Cmd-d (Do it), Cmd-p (Print it), Cmd-g (inspect it)';
								yourself);
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We discover that the {{gtMethod:name=BlAtomElement>>bounceIn:}} is the one we want.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We find this line:';
						addSnippet: (LeTextSnippet new
								string: '```language=text
bounced ifTrue: [self velocity: vx @ vy].
```';
								yourself);
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'and modify it to add this code:';
						addSnippet: (LeTextSnippet new
								string: '```language=text
		vx < 0
			ifTrue: [ self background: Color orange ]
			ifFalse: [ self background: Color green ]
```';
								yourself);
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We commit (save) the method, and it is immediately compiled and affects the running system.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Exercise';
				addSnippet: (LeTextSnippet new
						string: 'From the `BouncingAtomElement` itself, find all the stationary atoms, make them bigger, and make them move.';
						yourself);
				yourself);
		yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> composingExamples: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Composing (Test) Examples')
]

{ #category : #page }
SmalltalkIntroSlideshow >> composingExamplesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Composing (Test) Examples')
		addSnippet: (LeTextSnippet new
				string: '#What are example methods?';
				addSnippet: (LeTextSnippet new
						string: 'In GT, unit tests are written as *example methods*.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'An example method is just like an ordinary test method that we know from the Xunit frameworks, except that an example method *returns an instance of the tested object*.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'This is useful for many reasons, but mainly these two:';
						yourself);
				addSnippet: (LeTextSnippet new
						string: '**1.** Instead of just ending with a passed (or failed) test, ***you have an object that you can inspect and explore.***';
						yourself);
				addSnippet: (LeTextSnippet new
						string: '**2.** ***The resulting example can be used as a starting point for composing further tests.***';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Here''s a simple example method for the Ludo Game: {{gtMethod:name=GtLudoGameExamples>>emptyGame|expanded}}';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'It''s an ordinary method, except that it uses the `gtExample` pragma (annotation), it has assertions, and *it returns an example*.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'If you `Play and inspect` the method, you will obtain the example to explore.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: '(Change some assertions to see what happens if they fail.)';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Composing examples';
				addSnippet: (LeTextSnippet new
						string: 'If we browse the *senders* of the `emptyGame` method, we see it is used to  build another example.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: '#emptyGame gtSenders';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'The {{gtMethod:name=GtLudoGameExamples>>playerArolls6}}method builds on the emptyGame example and exercises the scenario where player A rolls a 6.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Before and After examples';
				addSnippet: (LeTextSnippet new
						string: 'The tests cover all the special corner cases of the game. For example, what happens if a players rolls a 6 twice, and the second token lands on the square where there is already the first token?';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We split this into two examples. The first sets up the situation where there is already a token for player A on the initial square.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'GtLudoGameExamples new playerAentersTokenA';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'The next example starts from this one, and check what happens when the next token enters play.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'GtLudoGameExamples new playerAentersAndLandsOnTokenA';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Running and exploring the examples';
				addSnippet: (LeTextSnippet new
						string: 'From the `Examples` tab of the {{gtClass:name=GtLudoGameExamples}} class we can both run all the tests, and explore individual examples.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'If we select the `Examples map` view, we see that the test examples form a tree built up from the emptyGame example.';
						yourself);
				yourself);
		yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> database [
	"All the pages"

	<gtExample>
	<noTest>
	^ self db
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> dbName [
	self deprecated: 'Don''t use this database anymore'.
	^ 'feenkcom/gtoolkit-demos/lepiter'
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessages: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Everything happens by sending messages')
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessagesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything happens by sending messages')
	addSnippet: (LeTextSnippet new
			string: 'Smalltalk introduced the metaphor of “methods” — you do not “invoke a method” (which makes no sense linguistically), but rather you *“send a message to an object”*, and it determines whether it *“understands the message”* and has a “method” for responding to it.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#A message is a request for a service. ';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#A “method” is code to fulfil that request.';
			addSnippet: (LeTextSnippet new
					string: 'The expression `3+4` is a *message* “`+4`” with the *selector* “`+`” and argument `4` sent to the *receiver* `3`:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '3 + 4';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'The receiver `3` has a *method* (a chunk of code) to compute the result.';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessagesPage2 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything happens by sending messages (2)')
	addSnippet: (LeTextSnippet new
			string: '#All computations are message sends';
			addSnippet: (LeTextSnippet new
					string: 'There are no built-in operators. These are all just message sends:';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Sending `/` to a number will invoke a factory method to create an instance of {{gtClass:name=Fraction}}. ';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '3 / 4';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'As in other OO languages, `=` tests object equality while `==` tests for identity. (If a class does not implement a method for `=`, then by default they are the same.)';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '(3 = 4) not';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'You can evaluate a block by sending it a `value` message.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '[ 3 +  4 ] value ';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessagesPage3 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything happens by sending messages (3)')
	addSnippet: (LeTextSnippet new
			string: '#Objects are created by sending messages to classes';
			addSnippet: (LePharoSnippet new
					code: 'OrderedCollection new ';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'Fraction numerator: 3 denominator: 4';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'Set with: 3 with: 4';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessagesPage4 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything happens by sending messages (4)')
	addSnippet: (LeTextSnippet new
			string: '#Changes to the system are message sends';
			addSnippet: (LeTextSnippet new
					string: '... although it is more convenient to use the dedicated tools.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'You create a class by sending a message to its superclass:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'Object subclass: #MyClass';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'You can ask a class to compile a method:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'MyClass compile: ''foo ^ 42''';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'MyClass new foo ';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'We can remove the class by asking the `Smalltalk` object to do it:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'Smalltalk removeClassNamed: ''MyClass''';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingHappensBySendingMessagesPage5 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything happens by sending messages (5)')
	addSnippet: (LeTextSnippet new
			string: '#You can change anything!';
			addSnippet: (LeTextSnippet new
					string: '*Caveat:* you are allowed to shoot yourself in the foot!';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'Smalltalk removeClassNamed: ''Object''.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Luckily Smalltalk prevents you from doing this, but you can shoot yourself in the foot in many other ways!';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingIsAnObject2: aSlide [
	<gtSlide>
<text: 
'## Everything is an object (2)

Classes are objects too. A class is a global name that starts with an upper case letter, such as `SmallInteger`. We can browse the source code of a class by opening the code bubble, by using the context menu, or using a keyboard shortcut.

We can send messages to classes, such as `SmallInteger maxVal`. What do you suppose will be the result of sending `+ 1` to this maximum value?'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Everything is an object (2)')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingIsAnObject3: aSlide [
	<gtSlide>
<text: 
'## Everything is an object (3)

A method is also an object. You can retrieve it by sending the message `>>` to the class with the method''s selector as an argument.

If you inspect a method, you can see not just its source code, but also its bytecode and even the abstract syntax tree.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Everything is an object (3)')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingIsAnObject4: aSlide [
	<gtSlide>
<text: 
'## Everything is an object (4)

A method is also an object. You can retrieve it by sending the message `>>` to the class with the method''s selector as an argument.

If you inspect a method, you can see not just its source code, but also its bytecode and even the abstract syntax tree.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Everything is an object (4)')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingIsAnObject: aSlide [
	<gtSlide>
<text: 
'# Everything is an object

Here we see a Notebook page containing both text and code snippets.

We can evaluate and inspect the results of the code snippets.

Numbers are objects, not just primitive data types. We see that the number `1` is an instance of the `SmallInteger` class. Strings are delimited by single quotation marks. If we inspect a string, we see it is made of of characters, such as `$h`. The dollar sign preceeds a printable character.

Even booleans are objects. `true` is an instance of the class `True`, which is a subclass of `Boolean`.

Blocks, or anonymous functions, are delimited by square brackets. This one takes no arguments, so we can evaluate it by sending it the message `value`.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Everything is an object')
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingIsAnObjectPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything is an object')
	addSnippet: (LeTextSnippet new
			string: 'Every object is an instance of a class.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Numbers, strings, booleans and blocks are objects';
			addSnippet: (LeTextSnippet new
					string: 'We can evaluate, inspect and interact with live objects.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '1';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '''hello''';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'true';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '[ 3 + 4 ]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Note that the object Inspector offers us multiple views of each object, including a `Meta` (code) view.';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingIsAnObjectPage2 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything is an object (2)')
	addSnippet: (LeTextSnippet new
			string: '#Classes are objects';
			addSnippet: (LeTextSnippet new
					string: 'Since classes are objects, we can inspect them and interact with them too.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'We can also browse them in the Coder. (Select the class name and type Cmd-B.)';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'SmallInteger';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'We can send messages to classes.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'SmallInteger maxVal';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'What do you  get if you add 1 to the biggest `SmallInteger`?';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '(Lift up the Playground at the bottom of the inspect to evaluate `self+1`.)';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingIsAnObjectPage3 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything is an object (3)')
	addSnippet: (LeTextSnippet new
			string: '#Methods are objects';
			addSnippet: (LeTextSnippet new
					string: 'We can ask a class to give us the compiled code of a method, which we can inspect and interact with.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'In particular, we can explore its source code, bytecode and even its abstract syntax tree.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '4 even';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'SmallInteger>>#even';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> everythingIsAnObjectPage4 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Everything is an object (4)')
	addSnippet: (LeTextSnippet new
			string: '#This page is an object';
			addSnippet: (LePharoSnippet new
					code: 'thisSnippet page ';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#The Ludo game is an object';
			addSnippet: (LePharoSnippet new
					code: 'GtLudoGame new';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Tools are objects';
			addSnippet: (LePharoSnippet new
					code: 'GtCoder forClass: SmallInteger';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#This slideshow is an object';
			addSnippet: (LePharoSnippet new
					code: 'GtPresenterSlideShow create: SmalltalkIntroSlideshow new';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#The GT World is an object';
			addSnippet: (LePharoSnippet new
					code: 'GtWorldElement new ';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> exploringLudo: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Exploring a live system')
]

{ #category : #page }
SmalltalkIntroSlideshow >> exploringLudoPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Exploring a live system')
		addSnippet: (LeTextSnippet new
				string: '#Exploring the Ludo Game';
				addSnippet: (LeTextSnippet new
						string: 'Let''s inspect a running instance of a Ludo game.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'GtLudoGame new';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Have a look at the various views (tabs).';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'The `Raw` view is the one most IDEs will show you. The others are specialized views. The Board, Players and Squares views are custom-made for the Ludo game.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Note how you can more easily navigate through the game entites (Players, Tokens, Squares) using the dedicated views than with the Raw view.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Exploring the view code';
				addSnippet: (LeTextSnippet new
						string: 'You can OPT-click on the tabs to see the code creating each view.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Most of these are quite simple. The Board view is the most complex one.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Finding examples';
				addSnippet: (LeTextSnippet new
						string: 'From the Meta tab you can explore not only the class definition and the source code of methods, but also find references. This leads us to the classes that define test examples.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Let''s explore {{gtClass:name=GtLudoGameExamples}}.  From the Examples view we can run all the tests.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Let''s have a closer look at {{gtMethod:name=GtLudoGameExamples>>playerAentersTokenA}}. ';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'It''s a simple scenario of a token entering the game after a 6 is rolled.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Note that we can inspect and interact with the example that results from the test, and we can use the example to build further tests.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Interacting with Objects';
				addSnippet: (LeTextSnippet new
						string: 'Let''s open two (identical) views of the same example.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game := GtLudoGameExamples new playerAentersTokenA';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Just click on the `(i)` (Inspect Object) button at the top right.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'You can interact both through the GUI or programatically and the views will stay in sync.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game die roll: 5.
game moveTokenNamed: ''A''';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '';
				yourself);
		yourself
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> findTargetWithText: aText in: expandedMethodElement [
	^ expandedMethodElement
		  allChildrenBreadthFirstDetect: [ :aChild | 
			  (aChild isKindOf: BrTextElementWithCursors) and: [ 
				  aChild text asString = aText asString ] ]
		  ifFound: [ :aChild | aChild ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> gtWorld: aSlide [
	<gtSlide>
	<text: '## Glamorous Toolkit

GT is a moldable development environment, in which the development tools can be easily extended with application-specific behavior. We''ll see examples of this with the Ludo game implementation.

GT is built on top of Pharo, a modern, open-source Smalltalk system.'>
	^ aSlide textAndElement
		elementWeight: 0.6;
		setPriority;
		newTextWithFormat: (self asText: 'Glamorous Toolkit is a ') , (self asText: 'moldable') italic
				, (self
						asText: ' development environment with native windows, software analysis tools, and a visualization engine. 
Gt is built on top of Pharo, a modern, open-source Smalltalk.');
		element: [ aSlide world ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> imageChanges: aSlide [
	<gtSlide>
<text: 
'## Smalltalk is a live programming system

There are four parts to a running Smalltalk system.
(1) The *image* is a snapshot of all the live objects in the system. When you start Smalltalk, all the objects are loaded from the saved snapshot into the live image.
(2) The *changes* file logs all changes to the source code, namely classes and methods. This means that your source changes cannot be lost, and can be replayed in case of a system crash.
(3) The *virtual machine* executes the bytecode of compiled methods.
(4) The *sources* store the source code of the system itself, so you can access, and potentially change anything.'>
	^ aSlide textAndElement
		elementWeight: 0.50;
		setPriority;
		newTextWithFormat: (self asText: 'Smalltalk is a ') , (self asText: 'live') italic
				, (self
						asText: ' programming system.
Objects live inside an image running on a VM. 
Changes to classes and methods are logged as you program.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'image+changes.png') ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> liveDocumentationLogic: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Live documentation of the game logic')
]

{ #category : #page }
SmalltalkIntroSlideshow >> liveDocumentationLogicPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Live documentation of the game logic')
		addSnippet: (LeTextSnippet new
				string: 'Notebooks (such as this one) can serve as live documentation for the logic of the game (i.e., the *business domain*) as well s for the technical solution.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: 'Consider the example game {{gtMethod:name=GtLudoRecordingGameExamples >> #gameShowingAllMoves6}}, which shows a short, complete game.';
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Viewing the history';
				addSnippet: (LeTextSnippet new
						string: 'We can visualize the complete history:';
						yourself);
				addSnippet: (LeExampleSnippet new
						exampleBehaviorName: 'GtLudoRecordingGameExamples';
						exampleSelector: 'gameShowingAllMoves6';
						noCode: true;
						previewShowSelector: 'gtHistoryFor:';
						previewHeight: 500);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#The different cases of moves';
				addSnippet: (LeTextSnippet new
						string: 'We can use this example to illustrate the scenarios that the game must support';
						yourself);
				addSnippet: (LeTextSnippet new
						string: '##The initial move';
						addSnippet: (LeExampleSnippet new
								exampleBehaviorName: 'GtLudoRecordingGameExamples';
								exampleSelector: 'moveInitial';
								noCode: true;
								previewShowSelector: 'moveOnBoardFor:');
						yourself);
				addSnippet: (LeTextSnippet new
						string: '##A regular move';
						addSnippet: (LeExampleSnippet new
								exampleBehaviorName: 'GtLudoRecordingGameExamples';
								exampleSelector: 'moveSimple';
								noCode: true;
								previewShowSelector: 'moveOnBoardFor:');
						yourself);
				addSnippet: (LeTextSnippet new
						string: '##A move to the end';
						addSnippet: (LeExampleSnippet new
								exampleBehaviorName: 'GtLudoRecordingGameExamples';
								exampleSelector: 'moveToTheEnd';
								noCode: true;
								previewShowSelector: 'moveOnBoardFor:');
						yourself);
				addSnippet: (LeTextSnippet new
						string: '##An impossible move';
						addSnippet: (LeExampleSnippet new
								exampleBehaviorName: 'GtLudoRecordingGameExamples';
								exampleSelector: 'moveImpossible';
								noCode: true;
								previewShowSelector: 'moveOnBoardFor:');
						yourself);
				addSnippet: (LeTextSnippet new
						string: '##Jumping over one''s own token';
						addSnippet: (LeExampleSnippet new
								exampleBehaviorName: 'GtLudoRecordingGameExamples';
								exampleSelector: 'moveJumping';
								noCode: true;
								previewShowSelector: 'moveOnBoardFor:');
						yourself);
				addSnippet: (LeTextSnippet new
						string: '##Capturing another player''s token';
						addSnippet: (LeExampleSnippet new
								exampleBehaviorName: 'GtLudoRecordingGameExamples';
								exampleSelector: 'moveInitialJumpingAndCapturing';
								noCode: true;
								previewShowSelector: 'moveOnBoardFor:');
						addSnippet: (LeTextSnippet new
								string: 'This case is interesting because it consists of three steps, as token A first jumps over token a, then lands on and captures token D, sending it to the start.';
								yourself);
						addSnippet: (LeExampleSnippet new
								exampleBehaviorName: 'GtLudoRecordingGameExamples';
								exampleSelector: 'moveInitialJumpingAndCapturing';
								noCode: true;
								previewShowSelector: 'gtTokenMovesFor:';
								previewHeight: 150);
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '';
				yourself);
		yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> liveDocumentationUML: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Live documentation of the technical solution')
]

{ #category : #page }
SmalltalkIntroSlideshow >> liveDocumentationUMLPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Live documentation of the technical solution')
		addSnippet: (LeTextSnippet new
				string: '#UML class diagrams';
				addSnippet: (LeTextSnippet new
						string: 'We can easily obtain a UML diagram for the whole implementation, but it is a bit cluttered:';
						yourself);
				yourself);
		addSnippet: (LeExampleSnippet new
				exampleBehaviorName: 'GtLudoCodeDocumentationExamples';
				exampleSelector: 'classHierarchy';
				noCode: true;
				previewShowSelector: 'gtLiveFor:';
				previewHeight: 400);
		addSnippet: (LeTextSnippet new
				string: '#Model classes';
				addSnippet: (LeTextSnippet new
						string: 'It can be more useful to focus just on a subset of the implementation, such as just the model classes.';
						yourself);
				addSnippet: (LeExampleSnippet new
						exampleBehaviorName: 'GtLudoCodeDocumentationExamples';
						exampleSelector: 'modelClassHierarchy';
						noCode: true;
						previewShowSelector: 'gtLiveFor:';
						previewHeight: 900);
				addSnippet: (LeTextSnippet new
						string: 'We can also visualize the relationships between classes.';
						yourself);
				addSnippet: (LeExampleSnippet new
						exampleBehaviorName: 'GtLudoCodeDocumentationExamples';
						exampleSelector: 'modelClassExplicitLabeledReferences';
						noCode: true;
						previewShowSelector: 'gtLiveFor:';
						previewHeight: 600);
				yourself);
		yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> ludoAppetizer: aSlide [
	<gtSlide>
	<text: '## Appetizer

As an appetizer, here we see an instance of the Ludo game running in GT. We can play the game by clicking on the die and moving the pieces, but how is the game composed of objects? How can we understand how it works?'>
	^ aSlide textAndElement
		elementWeight: 0.5;
		setPriority;
		newTextWithFormat: (self asHeader: 'Appetizer') bold
				, (self
						asText: '
Ludo as a running example of a live system');
		element: [ GtLudoGame new asElement asScalableElement ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> methodSyntax: aSlide [
	"Methods start with a declaration of the message selector and arguments. Temporaries must be declared. Statements are separate by periods. The caret (^) is special syntax for returning a result."

	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide textAndElement
		setPriority;
		newTextWithFormat: (self
				asHeader: 'Method syntax
')
				, (self
						asText: 'Note the special syntax for variable declarations (|...|), statement separators (period) and returns (^).');
		element: [ GtPharoSyntaxExplainer new forMethod: GtLudoGame >> #computeTargetFor: ];
		elementWeight: 0.6
]

{ #category : #slides }
SmalltalkIntroSlideshow >> outline: aSlide [
	<gtSlide>
	<text: '# Outline

• First we''ll have a quick look at what Smalltalk is, and how it differs from other object-oriented programming languages and systems.
• Next we''ll have a quick look at the basics. Smalltalk is a tiny language, and you can learn the syntax in a few minutes, but it does take a bit of getting used to.
• Then we''ll proceed with the development of the Ludo game. The key idea is to make the domain concepts visible as we program, so instead of just seeing source code, we see a live system that we can explore.
• Testing is similar to classical Xunit testing, with the small difference that every test returns an example object.
• This turns out to be very powerful, not just for building new tests, but also for exploring the system and building live documentation.
• We''ll wrap up with some take home messages.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Outline');
		paragraphWithFormat: (self
				asText: '
• What is Smalltalk?
• Smalltalk basics — syntax, sending messages
• Live programming with interactive views
• Testing with composable examples
• Live documentation with Lepiter notebooks
• Take home messages
')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> recordingMoves: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Recording and visualizing token moves')
]

{ #category : #page }
SmalltalkIntroSlideshow >> recordingMovesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Recording and visualizing token moves')
		addSnippet: (LeTextSnippet new
				string: '#How to visualize the movement of the tokens?';
				addSnippet: (LeTextSnippet new
						string: 'A shortcoming of the game is that there is no history of the movement of the tokens.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We only see snapshots of the board. If we could keep a history of the moves, then we could also visualize the actual transitions.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#A Recording Ludo Game';
				addSnippet: (LeTextSnippet new
						string: 'We design {{gtClass:name=GtLudoRecordingGame}} as a subclass of {{gtClass:name=GtLudoGame}} that keeps a history of the moves.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'This compels us to turn the concept of a **Move** into a first-class object, an instance of {{gtClass:name=GtLudoMove}}. This class has the responsibility to track the actual move data (the die roll value, the token moved, and the list of tokens moved as a result).';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Tracking the moves';
				addSnippet: (LeTextSnippet new
						string: 'We subclass our examples, so we now have recording versions of them all.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Let''s look at this one.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'GtLudoRecordingGameExamples new playerAovershootsGoal';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Inspecting this still just shows a snapshot, but if we look at the `Moves` tab, have the history of the moves.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'More interesting, we can now visualize which tokens moved where by inspecting the individual Moves.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Note in particular the second move, which required two hops.';
						yourself);
				addSnippet: (LeExampleSnippet new
						exampleBehaviorName: 'GtLudoRecordingGameExamples';
						exampleSelector: 'landingOnOwnPlayerToken';
						noCode: true;
						previewShowSelector: 'moveOnBoardFor:';
						previewHeight: 410);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Autoplaying a game with history';
				addSnippet: (LeTextSnippet new
						string: 'We can now track all the moves that are played with the autoplay feature.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Let''s open up two side-side views of a new game, with the second one showing the list of moves.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game := GtLudoRecordingGame new';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'As we play moves, we see the history update.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'game autoPlay: 1';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Going back in time in the game';
				addSnippet: (LeTextSnippet new
						string: 'Now that we have first-class Move objects, we have a complete history of a game.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We can also *replay* all the moves up to a certain point, and go back in time to see the state of the game at any point.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Have look at the `Replay` and `Highlight` views of any move.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'From the Replay view you can also explore alternative execution paths (also using the autoplay feature). ';
						yourself);
				addSnippet: (LePharoSnippet new
						code: '(game moves at: 50) replayGameToHere autoPlay: 1000';
						yourself);
				yourself);
		yourself
]

{ #category : #accessing }
SmalltalkIntroSlideshow >> slidePriorities [
	"Instead of manually setting priorities, just list the slides in order here."
	<gtExample>
	<noTest>
	^ #( 
		#title:
			ludoAppetizer:
		outline:
		
		smalltalk80:
			gtWorld:
			imageChanges:
		
		twoRules:
		
		everythingIsAnObject:
			everythingIsAnObject2:
			everythingIsAnObject3:
			everythingIsAnObject4:

		everythingHappensBySendingMessages:
		
		threeKindsOfMessages:
			syntax:
			methodSyntax:
	
		exploringLudo:
		addingAutoPlay:
		composingExamples:
		recordingMoves:
		liveDocumentationLogic:
		liveDocumentationUML:
	
		takeHome:
		whatsNext:
		)
]

{ #category : #slides }
SmalltalkIntroSlideshow >> smalltalk80: aSlide [
	<gtSlide>
	<text: '# Smalltalk''s origins

In the late 60s, Alan Kay predicted that in the foreseeable future handheld multimedia computers would become affordable. He called this a “Dynabook”. (The photo shows a mockup, not a real computer.)

He reasoned that such systems would need to be based on objects from the ground up, so he founded a lab at the Xerox Palo Alto Research Center (PARC) to develop such a fully object-oriented system, including both software and hardware. They developed the first graphical workstations with a windowing system and mouse.'>
	^ aSlide textAndElement
		elementWeight: 0.60;
		setPriority;
		newTextWithFormat: (self
				asText: 'Smalltalk was the first purely object-oriented language and environment, with the first interactive, graphical IDE.');
		element: [ GtFilePictureLiveSlide new
				fileReference: (GtResourcesUtility
						resourceAtPath: self picturesDirectoryPath / 'smalltalk-80.png') ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntax: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Smalltalk Syntax (the funny bits)')
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Smalltalk Syntax (the funny bits)')
	addSnippet: (LeTextSnippet new
			string: 'Smalltalk has a tiny syntax, but there are some interesting differences with other languages.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Numbers';
			addSnippet: (LeTextSnippet new
					string: 'In addition to the usual integer and floating point numbers, there are also radix numbers, for example this is a binary representation:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '2r101010';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'and this is hex:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '16r2A';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxPage2 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Smalltalk Syntax (2)')
	addSnippet: (LeTextSnippet new
			string: '#Characters, strings and symbols';
			addSnippet: (LeTextSnippet new
					string: 'Printable characters start with a `$`.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '$a';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Strings use *single quotes*.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '''hello world''';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '''hello world'' first = $h';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'This is a comment, not a string!';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '"Ceci n''est pas un string"';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '**NB:** a comment is not an object, but you *can* ask a class for its comment and get a string back ...';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'GtLudoGame comment ';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'A *symbol* starts with a hash (`#`). It is like a string, but has a unique instance.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '#ThereIsOnlyOneOfMe';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'A symbol is not identical to a string with the same characters';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '#ThereIsOnlyOneOfMe == ''ThereIsOnlyOneOfMe''';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'but they are considered equal as values.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '#ThereIsOnlyOneOfMe = ''ThereIsOnlyOneOfMe''';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxPage3 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Smalltalk Syntax (3)')
	addSnippet: (LeTextSnippet new
			string: '#Constants';
			addSnippet: (LeTextSnippet new
					string: '`true`, `false` and `nil` are built-in constants.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '(nil = '''') == false | true';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxPage4 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Smalltalk Syntax (4)')
	addSnippet: (LeTextSnippet new
			string: '#Arrays';
			addSnippet: (LeTextSnippet new
					string: 'A literal array is a compile-time sequence of literal values';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '#( 1 $a #foo #( I am ''nested'' ) )';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxPage5 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Smalltalk Syntax (5)')
	addSnippet: (LeTextSnippet new
			string: '#Blocks';
			addSnippet: (LeTextSnippet new
					string: 'A *block* is an anonymous function, that can take arguments:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '[ 3 + 4 ] value';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '[ :x | x + 1 ] value: 10';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '[ :x :y | x ** y ] value: 3 value: 2';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Blocks are first class values, so you can pass them around like any other object.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '[ :aBlock :anArg | aBlock value: anArg ]
	value: [ :aNumber | aNumber + 1 ]
	value: 1';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxPage6 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Smalltalk Syntax (6)')
	addSnippet: (LeTextSnippet new
			string: '#Pseudo variables';
			addSnippet: (LeTextSnippet new
					string: '`self` and `super` both refer to the receiver of a message, but with different method lookup, as usual.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'self == super';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> takeHome: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Take home messages');
		paragraphWithFormat: (self
				asText: '

• Smalltalk enables ') , (self asText: 'live programming') italic
				, (self
						asText: '

• Example methods enable ') , (self asText: 'composable tests') italic
				, (self
						asText: ' and live interaction with test results

• ') , (self asText: 'Moldable development') italic
				, (self
						asText: ' brings together coding and exploration of live systems 
')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> threeKindsOfMessages: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Three kinds of messages')
]

{ #category : #page }
SmalltalkIntroSlideshow >> threeKindsOfMessagesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Three kinds of messages')
	addSnippet: (LeTextSnippet new
			string: 'There are three kinds of messages you can send to a Smalltalk object, each taking a different number of arguments.';
			addSnippet: (LeTextSnippet new
					string: 'The *receiver* is the object to which the message is sent.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'The *sender* is the method sending the message (if the code is in a method somewhere).';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'The *selector* is the name of the message (without the arguments).';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Unary messages';
			addSnippet: (LeTextSnippet new
					string: 'Unary messages have no argument.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '5 factorial';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Note that you don''t need to include dot or any parentheses.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'You can also send unary messages to classes, as they are objects too.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'Float pi ';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'GtLudoGame new';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> threeKindsOfMessagesPage2 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Three kinds of messages (2)')
	addSnippet: (LeTextSnippet new
			string: '#Binary messages';
			addSnippet: (LeTextSnippet new
					string: 'Binary messages are made up of operator symbols like `+` `-` `*` `/` `>` `<` `=` and others.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'They take exactly one argument.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '3 + 4';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '''hello'', '' '', ''there''';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '1 << 10 ';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> threeKindsOfMessagesPage3 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Three kinds of messages (3)')
	addSnippet: (LeTextSnippet new
			string: '#Keyword messages';
			addSnippet: (LeTextSnippet new
					string: 'If you have one or more arguments you can use a keyword message. Each argument is preceded by a keyword, which ends with a colon (`:`).';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Here the receiver is `3`, the message is `raisedTo: 10 modulo: 5`, and the selector is `#raisedTo:modulo:`';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '3 raisedTo: 10 modulo: 5';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'The Ludo game also accepts various keyword messages.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'GtLudoGame new roll: 5.';
					yourself);
			yourself);
	yourself
]

{ #category : #page }
SmalltalkIntroSlideshow >> threeKindsOfMessagesPage4 [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Three kinds of messages (4)')
	addSnippet: (LeTextSnippet new
			string: '#Precedence: first unary, then binary, then keyword';
			addSnippet: (LeTextSnippet new
					string: 'In expressions that mix different kinds of message sends, first unary, then binary, and finally keyword messages are evaluated.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Otherwise evaluation is strictly from left to right.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '2 raisedTo: 1 + 3 factorial';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'is the same as:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '2 raisedTo:( 1 + (3 factorial))';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Warning! The left-to-right rule applies also to binary messages:';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '1 + 2 * 3';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'The result is `9` and not `7`.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'In practice this is not an issue. Use parentheses to get the order you want.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '1 + (2 * 3)';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> title: aSlide [
	<gtSlide>
	<text: '# A bit of Smalltalk

Smalltalk is a fully object-oriented language and environment in which everything is an object. The system is live, which means that you are always developing a running system. Programming means making small incremental changes, by adding classes or methods to the live system.

Today we''ll see how this impacts the sofware develpment process. As a running example, we''ll take the Ludo game that the students developed in P2, and as a platform, we''ll use GT, the Glamorous Toolkit, a moldable development environment built on top of Pharo Smalltalk.'>
	^ aSlide title
		setPriority;
		titleBottomPadding: 30;
		titleWithFormat: (self asTitle: 'A bit of Smalltalk');
		subtitleWithFormat: (self asBigText: 'oscar.nierstrasz@feenk.com')
]

{ #category : #page }
SmalltalkIntroSlideshow >> tocPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'ToC')
	addSnippet: (LeTextSnippet new
			string: '[[Everything is an object]]';
			addSnippet: (LeTextSnippet new
					string: '[[Everything is an object (2)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Everything is an object (3)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Everything is an object (4)]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Everything happens by sending messages]]';
			addSnippet: (LeTextSnippet new
					string: '[[Everything happens by sending messages (2)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Everything happens by sending messages (3)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Everything happens by sending messages (4)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Everything happens by sending messages (5)]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Three kinds of messages]]';
			addSnippet: (LeTextSnippet new
					string: '[[Three kinds of messages (2)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Three kinds of messages (3)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Three kinds of messages (4)]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Smalltalk Syntax (the funny bits)]]';
			addSnippet: (LeTextSnippet new
					string: '[[Smalltalk Syntax (2)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Smalltalk Syntax (3)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Smalltalk Syntax (4)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Smalltalk Syntax (5)]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Smalltalk Syntax (6)]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Exploring a live system]]';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Changing a running system]]';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Composing (Test) Examples]]';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Recording and visualizing token moves]]';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Live documentation of the game logic]]';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Live documentation of the technical solution]]';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> twoRules: aSlide [
	<gtSlide>
	<text: '# Two rules

To really understand Smalltalk, there are two important rules to remember.

First, pretty much everything in the system is an object. There is no distinction between objects and primitive data types. Also everything in the environment is an object. This means that you can work with the system in a very consistent and uniform way.

Second, everything happens by sending messages to objects. If you want an object to do something, you send it a message. The object then sees whether it has a *method* for handling that message, possibly inherited from a superclass.'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'Two rules');
		paragraphWithFormat: (self
				asBigText: '

1. Everything is an object

2. Everything happens by sending messages
')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> whatsNext: aSlide [
	<gtSlide>
<text: 
'# TODO
'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asSubtitle: 'What''s next?');
		paragraphWithFormat: (self
				asText: '

• Download GT from gtoolkit.com

• Explore the Glamorous Toolkit Book

• Learn about Pharo — go to books.pharo.org

• Have fun!
')
]

{ #category : #slides }
SmalltalkIntroSlideshow >> worldExampleSlideFor: aSlide [
	"<gtSlide>"

	^ aSlide world setPriority
]
