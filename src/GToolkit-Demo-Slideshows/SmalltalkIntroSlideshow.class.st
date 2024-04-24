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
SmalltalkIntroSlideshow >> changingARunningSystem: aSlide [
	<gtSlide>
<text: 
'## Changing a running system

Since games may last a long time, an autoplay feature would be useful to exercise the game.
We start by inspecting a live instance.

We can interact with it programatically.
*(NB: Just evaluate the snippet instead of inspecting the result, to see the effect on the game.)*

By exploring the *testing* protocol, we see that the methods {{gtMethod:name=GtLudoGame>>playerToRoll}} and {{gtMethod:name=GtLudoGame>>playerToMove}} tell us what should happen next.

Also {{gtMethod:name=GtLudoGame>>tokensToMove}} computes the set of tokens that can possibly move next. 

We roll the die or move as required.
We can extract this as an `autoplay` method.

If we run the `autoPlay` method to the end, we get an error.
We add a test to do nothing if the game is over.
'>
<demo:
'
- Inspect the instance.
- Introduce and execute the snippets.
- Extract the autoplay method.
- See that an error is raised at the end.
- Add the line: `self isOver ifTrue: [ ^ self ].`

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Changing a running system')
]

{ #category : #page }
SmalltalkIntroSlideshow >> changingARunningSystemPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Changing a running system')
	addSnippet: (LeTextSnippet new
			string: 'We would like to add an *autoplay* feature to a running game.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'game := GtLudoGame new.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'We can control the game programmatically.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'game roll: 6.
game moveTokenNamed: ''a''.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'We can automate a single move:';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'game playerToRoll ifTrue: [ game die roll ].';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'game playerToMove
	ifTrue: [ game moveTokenNamed: 
				game tokensToMove atRandom name ].';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'And we can combine the actions.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'game playerToRoll ifTrue: [ game die roll ].
game playerToMove
	ifTrue: [ game moveTokenNamed: game tokensToMove atRandom name ].';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'We can extract this now as a method.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '1 to: 100 do: [ :n | game autoPlay ].';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> classesAreObjects: aSlide [
	<gtSlide>
<text: 
'## Classes are objects

Classes are objects too. A class is a global name that starts with an upper case letter, such as `SmallInteger`. We can browse the source code of a class by opening the code bubble, by using the context menu, or using a keyboard shortcut.

We can send messages to classes, such as `SmallInteger maxVal`. What do you suppose will be the result of sending `+ 1` to this maximum value?'>
<demo:
'- Inspect the snippet
- Send `self + 1` in the integer''s playground
- Note the result type
- Send `self - 1` in the playground'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Classes are objects')
]

{ #category : #page }
SmalltalkIntroSlideshow >> classesAreObjectsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Classes are objects')
	addSnippet: (LeTextSnippet new
			string: 'We can send messages to classes:';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'SmallInteger maxVal';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> composingExamples: aSlide [
	<gtSlide>
<text: 
'## Composing (Test) Examples

In GT, unit tests are written as *example methods*.

An example method is just like an ordinary test method that we know from the Xunit frameworks, except that an example method *returns an instance of the tested object*.

This is useful for many reasons, but mainly these two:

1. Instead of just ending with a passed (or failed) test, *you have an object that you can inspect and explore.*

2. *The resulting example can be used as a starting point for composing further tests.*

We see here a simple example method for the Ludo Game.

It''s an ordinary method, except that it uses the `gtExample` pragma (annotation), it has assertions, and *it returns an example*.
If you `Play and inspect` the method, you will obtain the example to explore.

If we browse the *senders* of the `emptyGame` method, we see it is used to  build another example.
The `GtLudoGameExamples>>playerArolls6` method builds on the emptyGame example and exercises the scenario where player A rolls a 6.

The tests cover all the special corner cases of the game. 
For example, what happens if a players rolls a 6 twice, and the second token lands on the square where there is already the first token?

We split this into two examples. The first sets up the situation where there is already a token for player A on the initial square.

The next example starts from this one, and check what happens when the next token enters play.

From the *Examples* tab of the `GtLudoGameExamples` class we can both run all the tests, and explore individual examples.

If we select the *Examples map* view, we see that the test examples form a hierarchy built up from the emptyGame example.'>
<demo:
'- Change some assertions to see what happens if they fail.
- Browse the senders and explore `playerArolls6`
- Browse senders of `playerArolls6` to find `playerAentersTokenA`
- Again browse senders to find `playerAentersAndLandsOnTokenA`
- Navigate to the class of the last method, and maximize the view to show the class coder
- Show the `Examples` view to run the examples, and the `Examples map` to show the hierarchy'>

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
			string: 'An *example* is a test method that returns the object under test:';
			yourself);
	addSnippet: (LeElementSnippet new
			code: 'GtPharoMethodCoder forMethod:GtLudoGameExamples>>#emptyGame';
			codeVisible: false;
			elementHeight: 286;
			codeHeight: 50;
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> computationsAreMessageSends: aSlide [
	<gtSlide>
<text: 
'## All computations are message sends

There are no built-in operators. These are all just message sends:

Sending `/` to a number will invoke a factory method to create an instance of {{gtClass:name=Fraction}}. 

As in other OO languages, `=` tests object equality while `==` tests for identity. (If a class does not implement a method for `=`, then by default they are the same.)

You can evaluate a block by sending it a `value` message.
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'All computations are message sends')
]

{ #category : #page }
SmalltalkIntroSlideshow >> computationsAreMessageSendsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'All computations are message sends')
	addSnippet: (LeTextSnippet new
			string: 'Arithmetic operations, comparisons, and evaluating blocks are just message sends.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '3 / 4';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '(3 = 4) not';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '[ 3 +  4 ] value ';
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
'# Everything happens by sending messages

Smalltalk introduced the metaphor of “methods” — you do not “invoke a method” (which makes no sense linguistically), but rather you *“send a message to an object”*, and it determines whether it *“understands the message”* and has a “method” for responding to it.

The expression `3+4` is a *message* “`+4`” with the *selector* “`+`” and argument `4` sent to the *receiver* `3`:

The receiver `3` has a *method* (a chunk of code) to compute the result.'>
<demo:
'- Inspect the result
- Open the code bubble for the `+` method'>
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
			string: 'A *message* is a request for a service. ';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'A *method* is code to fulfil that request.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '3 + 4';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> everythingIsAnObject: aSlide [
	<gtSlide>
<text: 
'## Everything is an object

A method is also an object. You can retrieve it by sending the message `>>` to the class with the method''s selector as an argument.

If you inspect a method, you can see not just its source code, but also its bytecode and even the abstract syntax tree.'>
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
			string: '';
			yourself);
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
SmalltalkIntroSlideshow >> exploringALiveSystem: aSlide [
	<gtSlide>
<text: 
'# Exploring a live system

Let''s inspect a running instance of a Ludo game.

## Views

Have a look at the various views (tabs).

The `Raw` view is the one most IDEs will show you.

The others are specialized views.
The Board, Players and Squares views are custom-made for the Ludo game.

Note how you can more easily navigate through the game entites (Players, Tokens, Squares) using the dedicated views than with the Raw view.

You can OPT-click on the tabs to see the code creating each view.
Most of these are quite simple. The Board view is the most complex one.

## Exploring examples

From the Meta tab you can explore not only the class definition and the source code of methods, but also find references. 
This leads us to the classes that define test examples.

Let''s explore {{gtClass:name=GtLudoGameExamples}}.
From the Examples view we can run all the tests.

Let''s have a closer look at {{gtMethod:name=GtLudoGameExamples>>playerAentersTokenA}}.
It''s a simple scenario of a token entering the game after a 6 is rolled.

Note that we can inspect and interact with the example that results from the test, and we can use the example to build further tests.
(We''ll look more into this in a moment.)

If we open a second view of the same object — just click on the `(i)` (Inspect Object) button at the top right — we see that they stay in sync.
You can interact both through the GUI or programatically and the views will stay in sync.

'>
<demo:
'
- Inspect the game.
- Show the Raw view, then the others.
- OPT-click tio show the code.
- From the Meta tab find the refences to `GtLudoGameExamples`
- Explore `playerAentersAndLandsOnA` -- show how it composed.
- Inspect the example and a second copy.
- Evaluate the code: `game die roll: 5.` and `game moveTokenNamed: ''A''.`
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Exploring a live system')
]

{ #category : #page }
SmalltalkIntroSlideshow >> exploringALiveSystemPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Exploring a live system')
	addSnippet: (LeTextSnippet new
			string: 'Let''s inspect a running instance of a Ludo game.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'GtLudoGame new.';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'From the instance we can see various *views*, navigate to the *source code*, and explore *examples*.';
			yourself);
	addSnippet: (LeElementSnippet new
			code: 'GtLudoGame new.';
			codeVisible: false;
			elementHeight: 460;
			codeHeight: 50;
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
		elementWeight: 0.40;
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
'## Live documentation of the game logic

Notebooks (such as this one) can serve as live documentation for the logic of the game (i.e., the *business domain*) as well as for the technical solution.

Consider the example game {{gtMethod:name=GtLudoRecordingGameExamples >> #gameShowingAllMoves6}}, which shows a short, complete game.
The examples can then be embedded into the notebook to form live documentation of the different cases of moves.'>
<demo:
'Show and explore the impossible move.'>
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
			string: 'We can use live examples to document the logic of an application.';
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
'## Live documentation of the technical solution

We can generate live diagrams from the source code.
A UML diagram showing all the details is rather cluttered and nit so useful.'>
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
			string: 'We can easily obtain a UML diagram for the whole implementation, but it is a bit cluttered:';
			yourself);
	addSnippet: (LeElementSnippet new
			code: 'GtLudoCodeDocumentationExamples new classHierarchy';
			codeVisible: false;
			elementHeight: 385;
			codeHeight: 50;
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
	<gtSlide>
	<text: '# Method syntax

Note the special syntax for variable declarations (|...|), statement separators (period) and returns (^).

Methods start with a declaration of the message selector and arguments.
Temporaries must be declared. Statements are separated by periods. 

The caret (^) is special syntax for returning a result.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Method Syntax';
		element: [ GtPharoSyntaxExplainer new forMethod: GtLudoGame >> #computeTargetFor: ]
]

{ #category : #slides }
SmalltalkIntroSlideshow >> methodsAreObjects: aSlide [
	<gtSlide>
<text: 
'## Methods are objects

A method is also an object. You can retrieve it by sending the message `>>` to the class with the method''s selector as an argument.

If you inspect a method, you can see not just its source code, but also its bytecode and even the abstract syntax tree.'>
<demo: 
'- Inspect the snippets
- Explore the views of a method'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Methods are objects')
]

{ #category : #page }
SmalltalkIntroSlideshow >> methodsAreObjectsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Methods are objects')
	addSnippet: (LeTextSnippet new
			string: 'We can inspect methods and send them messages.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '4 even';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'SmallInteger>>#even';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '(SmallInteger>>#even) sourceCode';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> modelClasses: aSlide [
	<gtSlide>
<text: 
'### Model classes

If we just focus on the model classes, we get a better view, but it still contains more details than are useful.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Model classes')
]

{ #category : #page }
SmalltalkIntroSlideshow >> modelClassesPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Model classes')
	addSnippet: (LeTextSnippet new
			string: 'It can be more useful to focus just on a subset of the implementation, such as just the model classes.';
			yourself);
	addSnippet: (LeElementSnippet new
			code: 'GtLudoCodeDocumentationExamples new modelClassHierarchy';
			codeVisible: false;
			elementHeight: 914;
			codeHeight: 50;
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> numbersAreObjects: aSlide [
	<gtSlide>
<text: 
'# Numbers, strings, booleans and blocks are objects

Here we see a Notebook page containing both text and code snippets.

We can evaluate and inspect the results of the code snippets.

Numbers are objects, not just primitive data types. We see that the number `1` is an instance of the `SmallInteger` class. Strings are delimited by single quotation marks. If we inspect a string, we see it is made of of characters, such as `$h`. The dollar sign preceeds a printable character.

Even booleans are objects. `true` is an instance of the class `True`, which is a subclass of `Boolean`.

Blocks, or anonymous functions, are delimited by square brackets. This one takes no arguments, so we can evaluate it by sending it the message `value`.'>
<demo:
'- Inspect the snippets.
- Change the last snippet to send `value` to the block.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Numbers, strings, booleans and blocks are objects')
]

{ #category : #page }
SmalltalkIntroSlideshow >> numbersAreObjectsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Numbers, strings, booleans and blocks are objects')
	addSnippet: (LeTextSnippet new
			string: 'Primitive data types are full-fledged objects.';
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
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> objectCreationIsAMessageSend: aSlide [
	<gtSlide>
<text: 
'## Object creation is a message send

You can send the message `new` to create a new instance of a class.

Many classes have constructors that take arguments to initialize instances.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Object creation is a message send')
]

{ #category : #page }
SmalltalkIntroSlideshow >> objectCreationIsAMessageSendPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Object creation is a message send')
	addSnippet: (LeTextSnippet new
			string: 'You create an object by sending a message to a class.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'OrderedCollection new ';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'Fraction numerator: 3 denominator: 4';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'Set with: 3 with: 4';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> outline: aSlide [
	<gtSlide>
	<text: '# Outline

First we''ll have a quick look at what Smalltalk is, and how it differs from other object-oriented programming languages and systems.

Next we''ll have a quick look at the basics. Smalltalk is a tiny language, and you can learn the syntax in a few minutes, but it does take a bit of getting used to.

Then we''ll proceed with the development of the Ludo game. The key idea is to make the domain concepts visible as we program, so instead of just seeing source code, we see a live system that we can explore.

Testing is similar to classical Xunit testing, with the small difference that every test returns an example object.

This turns out to be very powerful, not just for building new tests, but also for exploring the system and building live documentation.

We''ll wrap up with some take home messages.'>
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
SmalltalkIntroSlideshow >> precedence: aSlide [
	<gtSlide>
<text: 
'## Precedence

In expressions that mix different kinds of message sends, first unary, then binary, and finally keyword messages are evaluated.
Otherwise evaluation is strictly from left to right.

The left-to-right rule applies also to binary messages, so  `1+2*3` is `9` and not `7`.
In practice this is rarely an issue. Just use parentheses to get the order you want.
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Precedence')
]

{ #category : #page }
SmalltalkIntroSlideshow >> precedencePage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Precedence')
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#First unary, then binary, then keyword';
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
			string: 'Warning! ';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '1 + 2 * 3';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'is the same as:';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '(1 + 2) * 3';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'Use parentheses to get the order you want.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '1 + (2 * 3)';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> recordingMoves: aSlide [
	<gtSlide>
<text: 
'## Recording and visualizing token moves

A shortcoming of the game is that there is no history of the movement of the tokens.
We only see snapshots of the board. If we could keep a history of the moves, then we could also visualize the actual transitions.

We design {{gtClass:name=GtLudoRecordingGame}} as a subclass of {{gtClass:name=GtLudoGame}} that keeps a history of the moves.
This compels us to turn the concept of a *Move* into a first-class object, an instance of {{gtClass:name=GtLudoMove}}. This class has the responsibility to track the actual move data (the die roll value, the token moved, and the list of tokens moved as a result).

We subclass our examples, so we now have recording versions of them all.

Let''s inspect the {{gtMethod:name=GtLudoGameExamples>>#playerAovershootsGoal}} example.
Inspecting this still just shows a snapshot, but if we look at the *Moves* tab, have the history of the moves.
More interesting, we can now visualize which tokens moved where by inspecting the individual Moves.

Note in particular the second move, which required two hops.

We can now track all the moves that are played with the autoplay feature.
Let''s open up two side-side views of a new game, with the second one showing the list of moves.

Now that we have first-class Move objects, we have a complete history of a game.
We can also *replay* all the moves up to a certain point, and go back in time to see the state of the game at any point.'>
<demo:
'- Inspect the snippet
- Go to the *Moves* view, and inspect individual moves
- Inspect a new recording game, and open a second inspector to the *Moves* view
- Evaluate `self autoPlay: 1.` in the playground to see the updates
- Select a move and play the *Replay to here* action'>
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
			string: '';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Tracking the moves';
			addSnippet: (LePharoSnippet new
					code: 'GtLudoRecordingGameExamples new playerAovershootsGoal.';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Autoplaying a game with history';
			addSnippet: (LePharoSnippet new
					code: 'game := GtLudoRecordingGame new.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'As we play moves, we see the history update.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'game autoPlay: 1.';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> relationships: aSlide [
	<gtSlide>
<text: 
'### Relationships between classes

Instead a class diagram just showing the key inheritance and usage relationships gives us more insight into the design.

A particular advantage is that such generated diagrams are live and integrated with the other tools.'>
<demo:
'Show that the diagram is live, and that we can navigate to the code and examples.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Relationships between classes')
]

{ #category : #page }
SmalltalkIntroSlideshow >> relationshipsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Relationships between classes')
	addSnippet: (LeTextSnippet new
			string: 'We can also visualize the relationships between classes.';
			yourself);
	addSnippet: (LeElementSnippet new
			code: 'GtLudoCodeDocumentationExamples  new modelClassExplicitLabeledReferences ';
			codeVisible: false;
			elementHeight: 599;
			codeHeight: 50;
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
			#ludoAppetizer:
		#outline:
		
		#smalltalk80:
			#gtWorld:
			#imageChanges:
		
		#twoRules:
		
		#numbersAreObjects:
			#classesAreObjects:
			#methodsAreObjects:
			#everythingIsAnObject:

		#everythingHappensBySendingMessages:
			#computationsAreMessageSends:
			#objectCreationIsAMessageSend:
			#systemChangesAreMessageSends:
			#youCanChangeAnything:
		
		#threeKindsOfMessages:
			#precedence:
		
		#syntaxNumbers:
			#syntaxStrings:
			#syntaxConstants:
			#syntaxArrays:
			#syntaxBlocks:
			#syntaxSelfSuper:
		
		#methodSyntax:
	
		#exploringALiveSystem:
			#changingARunningSystem:
			#composingExamples:
			#recordingMoves:
			#liveDocumentationLogic:
			#liveDocumentationUML:
				#modelClasses:
				#relationships:
	
		#takeHome:
	#whatsNext:
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
SmalltalkIntroSlideshow >> syntaxArrays: aSlide [
	<gtSlide>
<text: 
'## Syntax — arrays

A literal array is a compile-time sequence of literal values.
It is specified by a hash followed by possibly nested literal values in parentheses.

A dynamic array is specified by curly braces around a series of expressions separated by periods.

You can embed literal arrays within dynamic arrays, but not the other way around.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Syntax — Arrays')
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxArraysPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Syntax — Arrays')
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Literal arrays';
			addSnippet: (LePharoSnippet new
					code: '#( 1 $a #foo #( I am ''nested'' ) )';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Dynamic arrays';
			addSnippet: (LePharoSnippet new
					code: '{ 6 * 7 . #( ''hello'' ''there'' )}';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntaxBlocks: aSlide [
	<gtSlide>
<text: 
'## Syntax — Blocks

A *block* is an anonymous function, that can take arguments.
You evaluate a block by sending it the unary message `value`, or a keyword message `value:` for as many arguments as you need.

Blocks are first class values, so you can pass them around like any other object.
In this example we send a block that increments its argument in as an argument to another block.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Syntax — Blocks')
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxBlocksPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Syntax — Blocks')
	addSnippet: (LeTextSnippet new
			string: 'Blocks can take any number of arguments.';
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
			string: 'Blocks are first class values.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '[ :aBlock :anArg | aBlock value: anArg ]
	value: [ :aNumber | aNumber + 1 ]
	value: 1';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntaxConstants: aSlide [
	<gtSlide>
<text: 
'## Syntax — constants

There are only 6 keywords in Smalltalk, and three of them are the constants `nil`, `true` and `false`.
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Syntax — Constants')
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxConstantsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Syntax — Constants')
	addSnippet: (LeTextSnippet new
			string: ' `true`, `false` and `nil` are built-in constants.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '(nil = '''') == false | true';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntaxNumbers: aSlide [
	<gtSlide>
<text: 
'# Syntax — Numbers

Smalltalk has a tiny syntax, but there are some interesting differences with other languages.

In addition to the usual integer and floating point numbers, there are also radix numbers, for example this is a binary representation: `2r101010`

And this is hex: `16r2A`
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Syntax — Numbers')
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxNumbersPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Syntax — Numbers')
	addSnippet: (LeTextSnippet new
			string: 'Radix numbers (binary):';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '2r101010';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'Hex:';
			yourself);
	addSnippet: (LePharoSnippet new
			code: '16r2A';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntaxSelfSuper: aSlide [
	<gtSlide>
<text: 
'## Syntax — Pseudo variables

Two further keywords are the pseudo variables `self` and `super`.

Both refer to the receiver of a message, but with different method lookup, as in other object-oriented languages.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Syntax — Pseudo variables')
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxSelfSuperPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Syntax — Pseudo variables')
	addSnippet: (LeTextSnippet new
			string: ' `self` and `super` both refer to the object itself.';
			yourself);
	addSnippet: (LePharoSnippet new
			code: 'self == super';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> syntaxStrings: aSlide [
	<gtSlide>
<text: 
'## Syntax — Strings and Symbols

Printable characters start with a `$`.
Strings use *single quotes*.

*NB:* Double quotes enclose comments, not strings.
A comment is not an object, but you *can* ask a class for its comment and get a string back ...

A *symbol* starts with a hash (`#`). It is like a string, but has a unique instance.

A symbol is not identical to a string with the same characters, but they are considered equal as values.
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Syntax — Strings and Symbols')
]

{ #category : #page }
SmalltalkIntroSlideshow >> syntaxStringsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Syntax — Strings and Symbols')
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Characters:';
			addSnippet: (LePharoSnippet new
					code: '$a';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Strings:';
			addSnippet: (LePharoSnippet new
					code: '''hello world''';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '''hello world'' first = $h';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Comments:';
			addSnippet: (LePharoSnippet new
					code: '"Ceci n''est pas un string"';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'GtLudoGame comment ';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Symbols:';
			addSnippet: (LePharoSnippet new
					code: '#ThereIsOnlyOneOfMe';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# True or false';
			addSnippet: (LePharoSnippet new
					code: '#ThereIsOnlyOneOfMe == ''ThereIsOnlyOneOfMe''';
					yourself);
			addSnippet: (LePharoSnippet new
					code: '#ThereIsOnlyOneOfMe = ''ThereIsOnlyOneOfMe''';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> systemChangesAreMessageSends: aSlide [
	<gtSlide>
<text: 
'## Changes to the system are message sends

You create a class by sending a message to its superclass.

To create a method, you send a message to the class.

You can also ask Smalltalk to remove a class from the system.'>

	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Changes to the system are message sends')
]

{ #category : #page }
SmalltalkIntroSlideshow >> systemChangesAreMessageSendsPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Changes to the system are message sends')
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
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> takeHome: aSlide [
	<gtSlide>
<text: 
'# Take home messages

Summing up, Smalltalk is one of very few software systems which enables fully live programming, in which programming means changing a running system.

We have also see how  live *examples* extend conventional unit tests to yield explorable objects that can not only  be composed to form hierarchies of tests, but they can also be used to form live documentation.

Finally the ability to *mold* the development tools to the needs to the application being developed allows you create fully explorable and explainable applications.'>
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
'# Three kinds of messages

There are three kinds of messages you can send to a Smalltalk object, each taking a different number of arguments.

The *receiver* is the object to which the message is sent.
The *sender* is the method sending the message (if the code is in a method somewhere).
The *selector* is the name of the message (without the arguments).

*Unary* messages have no argument.
`5 factorial` is a unary message with selector `#factorial` sent to the receiver `5`.
`Float pi` is a unary message `#pi` sent to the class `Float`.
You can also send unary messages to classes, as they are objects too.

*Binary* messages are made up of operator symbols like `+` `-` `*` `/` `>` `<` `=` and others.
They take exactly one argument.
`3 + 4` is the message `#+` send to the receiver `3` with argument `4`.

*Keyword* messages take one or more arguments.
Each argument is preceded by a keyword, which ends with a colon (`:`).
Here the receiver is `3`, the message is `raisedTo: 10 modulo: 5`, and the selector is `#raisedTo:modulo:`
The Ludo game also accepts various keyword messages.
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
			string: '';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Unary messages';
			addSnippet: (LePharoSnippet new
					code: '5 factorial';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'Float pi ';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'GtLudoGame new';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Binary messages';
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
	addSnippet: (LeTextSnippet new
			string: '# Keyword messages';
			addSnippet: (LePharoSnippet new
					code: '3 raisedTo: 10 modulo: 5';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'GtLudoGame new roll: 5';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '';
			yourself);
	yourself
]

{ #category : #slides }
SmalltalkIntroSlideshow >> title: aSlide [
	<gtSlide>
	<text: '# A bit of Smalltalk

Smalltalk is a fully object-oriented language and environment in which everything is an object. The system is live, which means that you are always developing a running system. Programming means making small incremental changes, by adding classes or methods to the live system.

Today we''ll see how this impacts the sofware develpment process. As a running example, we''ll take the Ludo game that the students developed in P2, and as a platform, we''ll use GT, the Glamorous Toolkit, a moldable development environment built on top of Pharo Smalltalk.

*NB:* This slideshow is available in the standard download of GT from [gtoolkit.com](https://gtoolkit.com) in the class {{gtClass:name=SmalltalkIntroSlideshow}}.
'>
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
	addSnippet: (LePharoSnippet new
			code: 'toc := thisSnippet page.
(toc database pages collect: #title)
	difference: (toc allChildrenTextSnippets
			flatCollect: [ :s | s outgoingTextualLinks items collect: [ :l | l targetReference pageTitle ] ]).';
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Numbers, strings, booleans and blocks are objects]]';
			addSnippet: (LeTextSnippet new
					string: '[[Classes are objects]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Methods are objects]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Everything is an object]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Everything happens by sending messages]]';
			addSnippet: (LeTextSnippet new
					string: '[[All computations are message sends]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Object creation is a message send]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Changes to the system are message sends]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[You can change (almost) anything!]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Three kinds of messages]]';
			addSnippet: (LeTextSnippet new
					string: '[[Precedence]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Syntax — Numbers]]';
			addSnippet: (LeTextSnippet new
					string: '[[Syntax — Strings and Symbols]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Syntax — Constants]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Syntax — Arrays]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Syntax — Blocks]]';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '[[Syntax — Pseudo variables]]';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '[[Exploring a live system]]';
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
					addSnippet: (LeTextSnippet new
							string: '[[Model classes]]';
							yourself);
					addSnippet: (LeTextSnippet new
							string: '[[Relationships between classes]]';
							yourself);
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Not used';
			addSnippet: (LeTextSnippet new
					string: '[[Changing a running system on the fly]]';
					yourself);
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
'# What''s next?

The Glamorous Toolkit is an open-source system that runs under Linux, Mac and Windows. All the examples we have seen, as well as this slideshow are part of the download.

There is also a lively community around Smalltalk, Pharo and GT. I encourage you to try it out and explore.
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

{ #category : #slides }
SmalltalkIntroSlideshow >> youCanChangeAnything: aSlide [
	<gtSlide>
<text: 
'## You can change (almost) anything!

Smalltalk is designed so that you can change anything in the system. The consequence is that you are also allowed to shoot yourself in the foot.

Luckily Smalltalk prevents you from removing the class `Object`, but you can still shoot yourself in the foot in many other ways!
'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'You can change (almost) anything!')
]

{ #category : #page }
SmalltalkIntroSlideshow >> youCanChangeAnythingPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'You can change (almost) anything!')
	addSnippet: (LePharoSnippet new
			code: 'Smalltalk removeClassNamed: ''Object''.';
			yourself);
	yourself
]
