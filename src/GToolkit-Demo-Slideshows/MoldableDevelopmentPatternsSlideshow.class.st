"
Draft slides for Smalltalks 2023 in Quilmes AR.
"
Class {
	#name : #MoldableDevelopmentPatternsSlideshow,
	#superclass : #PrioritySlideshow,
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> collectionWrapper: aSlide [
	<gtSlide>
	
<text: '## Pattern: ...

TODO -- Website; IMDB

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Collection Wrapper')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> collectionWrapperPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Collection Wrapper')
	addSnippet: (LeTextSnippet new
			string: '# PLACEHOLDER';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'to do for a later version ...';
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> conclusions: aSlide [
	<gtSlide>
	
<text: '# Conclusions 

TODO

Takeaway messages:

- The system is the source of knowledge. The goal of MD is to make that knowledge accessible.

- Every problem is different and requires custom tools. GT is an environment that makes it cheap to build such tools by making the platform itself moldable.

- MD can be applied to any problem. Just make the domain concepts first-class, and mold them to make them explainable. (Example of this slideshow.)

- MD requires a paradigm shift, that puts moldable objects rather than source code in focus, but it can be learned with the help of patterns.

'>
	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'Conclusions')

]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> contextualPlayground: aSlide [
	<gtSlide>

<text: '## Pattern: Contextual Playground

In a conventional development process, you must constantly switch context between writing code, and running or testing it. By starting instead from a moldable object, you can stay within the context of a live object to explore and experiment with new features.

Here we inspect our current version of the state machine, and ask how to add a number to the top of the stack. We navigate to the stack instance, and query its Meta view for "add" methods. We find the `addLast:` message, and try it out in the contexual playground of the  moldable object.

We like what we see, so we extract the code as a method called `!`.

We similarly experiment with and extract methods `stack`, `top`, and `isEmpty`.'>

	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Contextual Playground')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> contextualPlaygroundPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Contextual Playground')
	addSnippet: (LeTextSnippet new
			string: '#Intent';
			addSnippet: (LeTextSnippet new
					string: 'Prototype new behavior in a Playground of a *Moldable Object*. Experimental code snippets will be bound to the content of the object, can be inspected, and can be extracted as methods.';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Example';
			addSnippet: (LeTextSnippet new
					string: 'We inspect an instance of our stack machine, and experiment with adding numbers to the stack.';
					yourself);
			addSnippet: (LeElementSnippet new
					code: 'GtInspector newOn: StackMachineV0 new';
					codeVisible: false;
					elementHeight: 424;
					codeHeight: 50;
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'When we are happy with the code, we can extract it as a method `!`.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'We similarly experiment and extract methods `stack`, `isEmpty`, `top`, and `pop`.';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> contextualPlaygroundScenery: aSlide [
	<gtSlide>

<text: '# Contextual Playground

A Contextual Playground offers a way to experiment with a moldable object and extend its behavior.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Contextual Playground' ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> customAction: aSlide [
	<gtSlide>

<text: '## Pattern: ...

TODO -- SPL; stack machine

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Custom Action')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> customActionPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Custom Action')
	addSnippet: (LeTextSnippet new
			string: '# PLACEHOLDER';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'to do for a later version ...';
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> exampleObject: aSlide [
	<gtSlide>

<text: '## Pattern: ...

TODO -- Ludo; stack machine

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Example Object')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> exampleObjectPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Example Object')
	addSnippet: (LeTextSnippet new
			string: '# PLACEHOLDER';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'to do for a later version ...';
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> exampleObjectScenery: aSlide [
	<gtSlide>

<text: '# Example Object

TODO

'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Example Object' ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> howToPracticeMoldableDevelopment: aSlide [
	<gtSlide>

<text: '# How to practice Moldable Development?

What does moldable development mean in practice?

Much of the moldable development process can be understood in terms of a number of recurring design patterns.

I''ll now try to illustrate most of the patterns in this diagram with the help of live examples.'>

	^ aSlide textAndElement
		elementWeight: 0.5;
		setPriority;
		newTextWithFormat: (self
				asSubtitle: 'How to practice Moldable Development?')
				, (self
						asText: '

Moldable development works by applying a number of learnable patterns.');
		element: [ self patternMapScenery ]
]

{ #category : #initalization }
MoldableDevelopmentPatternsSlideshow >> initializeDb [
	self db addPage: self moldableObjectPage.

	self db addPage: self contextualPlaygroundPage.

	self db addPage: self viewableDataWrapperPage.
	self db addPage: self viewableEntityPage.
	self db addPage: self simpleViewPage.
	self db addPage: self projectDiaryPage.
	self db addPage: self collectionWrapperPage.
	self db addPage: self exampleObjectPage.
	self db addPage: self customActionPage.
	
	self db addPage: self placeholderPage.
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> inspectingLudo: aSlide [
	<gtSlide>

<text: '## Inspecting a live game

Imagine, on the other hand, a development process which starts not from the source code but from live objects.

Here we see an Inspector on a live instance of the Ludo game, already in a given state after several moves.

Normally you would only inspect a live object during a debugging task, but in Moldable Development the Inspector is the starting point for most activities.

The default view here is the interactive one we saw before.

But we also have a number of other custom views to show us the Players, the Squares, the Tokens, and so on.

From each of these views we can navigate to other domain objects with their own custom views.

For example, Players have a view showing the positions of their tokens.

*(Navigate to a player.)*

We can also explore the history of past views, and thus obtain an explanation of how the game has evolved.

*(Go to the Moves view, and replay several moves.)

The object is also live, so we can can interact with it programmatically, by opening a playground, and, for example, autoplaying it to the end.

*(Open a second Inspector view showing the Board, and autoplay from the playground, showing both the Moves and Board views updating.)*

The views are cheap to create. The Moves view, for example, consists of just a few lines of code displaying the moves as a columned list.

*(OPT-Click on the Moves view.)*

We can also program with the live object, for example, to make the `Moves` view the default one.

*(Change the  Moves priority to 5.)*'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Inspecting a live Ludo game';
		element: [ (GtPager
				createWrappedOn: (GtInspector forObject: GtLudoRecordingGameExamples new gameShowingAllMoves3))
				maximized ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> ludoGame: aSlide [
	<gtSlide>
	
<text: '## Understanding the Ludo game

Consider this toy example of a Ludo game given as a Java programming exercise to first-year CS students at the University of Bern.

To understand it, we can try to play the game, but this will not bring us much insight into the rules of the game or its design.

We see that we can click on the die to roll it, and if we manage to roll a 6, we can click on a player to make it advance, but how is the game structured, and how are the rules implemented?

There is a notable gap between the running system and its implementation.

Also, experimenting with the application in this way is slow and tedious.

Clearly this approach does not scale.'>

	^ aSlide textAndElement
		elementWeight: 0.5;
		setPriority;
		newTextWithFormat: (self asHeader: 'Understanding the Ludo game') bold
				, (self
						asText: '

We can play with this implementation of a Ludo game, but how does it work?');
		element: [ GtLudoGame new asElement asScalableElement ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> ludoSourceCode: aSlide [
	<gtSlide>

<text: '## Browsing the Ludo source code

At this point we can try to browse the source code of the game.

We see many domain concepts implemented as classes, and we see methods whose names clearly evoke their intent, but where should we start reading, and how can we map the source code back to the running system?

Again, just reading source code does not scale very well, whether we want to get a general idea of the design, or if we want to answer a more specific question about how to further develop the system.'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Browsing the code is slow and tedious';
		element: [ (GtCoderElement forClass: GtLudoGame) createInPager maximized ]
]

{ #category : #accessing }
MoldableDevelopmentPatternsSlideshow >> moldableDevelopmentPatterns: aSlide [
	"<gtSlide>"
	
<text: '# Moldable Development Patterns 

NOT USED'>

	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asSubtitle: 'Moldable Development Patterns ');
		newFadedText: '';
		element: [ self patternMapScenery ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> moldableObject: aSlide [
	<gtSlide>

<text: '## Pattern: Moldable object

In moldable development, we focus on molding live objects to iteratively answer questions.

As a consequence, instead of starting from source code, we start with a live object that we can mold.

If we already have an existing code base, we just start by inspecting an instance to work with.

This can come from a code snippet in a notebook page or a Playground, or from a runnable method.

In case you are starting a greenfield project, you won''t have any existing classes or objects, so you can start by writing a snippet to create one.

Here `MyStackMachine` does not exist, so we “fix it” and create a new class and package.

Now we have a moldable object to inspect.

Once you have an object, you can inspect it, explore it, and extend it.

We''d like to initialize it, so we can add an `initialize` method in the Meta view.

We add a stack slot and initialize it as an OrderedCollection.

We run `self initialize` in the playground, and refresh the Raw view to see the new state.

From here we can navigate to inspect the empty stack state.'>

	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Moldable object')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> moldableObjectPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Moldable object')
	addSnippet: (LeTextSnippet new
			string: '#Intent';
			addSnippet: (LeTextSnippet new
					string: 'Start coding by inspecting *moldable object*, that is, a live instance of the class you are coding, not in a code editor.  Then incrementally add behavior and create custom views to make the new behavior visible.';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '#Example';
			addSnippet: (LeTextSnippet new
					string: 'Start with a snippet to create a moldable object. Create the class if it doesn''t exist yet.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'sm := MyStackMachine new.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Now we can inspect it and extend it.';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> moldableObjectScenery: aSlide [
	<gtSlide>

<text: '# Moldable Object

Moldable development starts with a moldable object.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Moldable Object' ]
]

{ #category : #figures }
MoldableDevelopmentPatternsSlideshow >> patternMapScenery [
	<gtExample>
	<noTest>
	| scenery item1 item2 item3 item4 item5 item6 item7 item8 item9 |
scenery := GtScenery new.
item1 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Moldable Object')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 16; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item1 position: (322.00000000000006@194.00000000000003).
item1 extent: (170.20192464192695@39.99999999999997).
item2 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Viewable Data Wrapper')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 22; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item2 position: (577@194).
item2 extent: (215.06197611490893@40.0).
item3 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Project Diary')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 14; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item3 position: (609.0000000000002@258.0000000000001).
item3 extent: (133.14793904622388@40.0).
item4 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Contextual Playground')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 22; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item4 position: (296.0@332.0000000000001).
item4 extent: (222.93304443359375@40.0).
item5 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Example Object')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 15; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item5 position: (593.0000000000001@332.00000000000006).
item5 extent: (162.92442321777332@40.0).
item6 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Viewable Entity')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 16; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item6 position: (326.0@432.00000000000006).
item6 extent: (165.39362589518248@40.0).
item7 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Custom Action')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 14; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item7 position: (522.0000000000001@430.0).
item7 extent: (162.03145345052087@40.0).
item8 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Simple View')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 12; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item8 position: (252.00000000000006@543.0).
item8 extent: (126.12884521484375@40.0).
item9 := scenery addItem: (GtSceneryItem new stencil: (GtSceneryTextStencil new text: (((BlRunRopedText string: 'Collection Wrapper')
attributeRuns: ((BlRunTree basicNew instVarAt: 1 put: (BlRunTreeLeafNode basicNew instVarAt: 1 put: 19; instVarAt: 2 put: ((Array new: 3) at: 1 put: (BlFontSizeAttribute new size: 20); at: 2 put: (BlFontWeightAttribute new weight: 700); at: 3 put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler name: 'Source Sans Pro'); yourself); yourself); yourself)))))).
item9 position: (424@543).
item9 extent: (185.22221883138013@40.0).
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item1 to: item2.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item2 to: item1.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item1 to: item3.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item3 to: item5.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item1 to: item4.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item4 to: item6.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item4 to: item7.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item6 to: item8.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item6 to: item9.
scenery addConnectionWithStencil: (GtSceneryLineStencil new) from: item4 to: item5.
^ scenery
]

{ #category : #figures }
MoldableDevelopmentPatternsSlideshow >> patternSceneryHighlighting: patternName [
	| scenery |
	scenery := self patternMapScenery.
	scenery items do: [ :item | item stencil text thin ].
	((scenery items collect: [ :item | item stencil text ])
		detect: [ :text | text asString = patternName ]) bold.
	^ scenery
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> placeholderPage [
	"Use this page as a template."
	<gtExample>
	<noTest>
	^ (LePage named: 'Placeholder page')
		addSnippet: (LeTextSnippet new
				string: '#TO DO';
				addSnippet: (LeTextSnippet new
						string: 'to do';
						yourself);
				yourself);
		yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> projectDiary: aSlide [
	<gtSlide>

<text: '## Pattern: ...

TODO -- GT book case studies; Ludo Game, SPL

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Project Diary')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> projectDiaryPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Project Diary')
	addSnippet: (LeTextSnippet new
			string: '# PLACEHOLDER';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'to do for a later version ...';
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> simpleView: aSlide [
	<gtSlide>
	
<text: '## Pattern: ...

TODO -- Ludo game Players etc; Stack machine state

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Simple View')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> simpleViewPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Simple View')
	addSnippet: (LeTextSnippet new
			string: '# PLACEHOLDER';
			yourself);
	addSnippet: (LeTextSnippet new
			string: 'to do for a later version ...';
			yourself);
	yourself
]

{ #category : #accessing }
MoldableDevelopmentPatternsSlideshow >> slidePriorities [
	"This method defines the slide priorities implicitly by their order instead of by fixed numbers.
	See also: PrioritySlideshow>>#priorityFor:"
	<gtExample>
	^ #( 
		titleSlide:
		
		whatIsMoldableDevelopment:
			ludoGame:
			ludoSourceCode:
			inspectingLudo:
			spl:
	
		howToPracticeMoldableDevelopment:
			moldableObjectScenery:
				moldableObject:
			contextualPlaygroundScenery:
				contextualPlayground:
				
			exampleObjectScenery:
				exampleObject:
			

			viewableEntityScenery:
				viewableEntity:
		
			simpleView:
			
			viewableDataWrapper:
			customAction:
			collectionWrapper:
			projectDiary:
	
		conclusions:
	
	)
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> spl: aSlide [
	<gtSlide>

<text: '## Inspecting an interpreter

Moldable development can apply to any kind of project.

Here is a very different example of an interpreter for a Simple Programming Language for a compiler course.

The default view is actually a composition of three views, of the current continuation, in this case a factorial program, the current environment bindings, and the program output.

This inspector also has custom actions to perform a single interpretation step, or to run the program to the end.

*(Do both.)*

We see the three views update with each step.

Another view allows us to explore the history of the execution, thus allowing us to replay and understand the semantic steps.'>
	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'SPL';
		element: [ (GtPager createWrappedOn: (GtInspector forObject: SPL factorial)) maximized ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> titleSlide: aSlide [
	<gtSlide>

<text: '# Moldable Development Patterns

Hi. My name is Oscar Nierstrasz.

Today I''d like to talk to you about a new way of software development that treats software systems as repositories of knowledge.

The central idea is that software systems should be *explainable*, and that this can be achieved by making the domain concepts of your application first class entities that are augmented by lots and lots of small, custom tools that answer questions about the software and the domain.

First I''ll show you a couple of examples to illustrate what I mean by explainable systems, and then we''ll look at how you can practice moldable development with the help of a number of design patterns.'>

	^ aSlide titleWithFooter
		setPriority;
		titleBottomPadding: 20;
		subtitleBottomPadding: 40;
		titleWithFormat: (self asTitle: 'Moldable Development Patterns');
		footerWithFormat: (self asBigText: 'oscar.nierstrasz@feenk.com')
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> viewableDataWrapper: aSlide [
	<gtSlide>

<text: '## Pattern: Viewable Data Wrapper

REDO -- website, IMDB movie list

Although sometimes you may have the luxury to work on a greenfield project, most projects start from some existing data and code.

When we load the data into our environment, we will obtain the default views for that data.

Here, for example, we have loaded the cloned ESUG website repo and are inspecting the contents.

We obtain a completely generic view of the folders and files that tells us nothing about the domain.

*(Evaluate the first snippet showing the FileLocator views.)*

We would like to turn this into a proper domain object that tells us interesting things about itself.

As a first step, then, we can *wrap* the data into a dedicated object.

When we do this, at first glance the result appears to be even worse, as now we just get a generic *Raw* view of the new object.

*(Inspect the first EsugWebsiteWrapper.)* 

But now we have the possibility to explore it, add behavior, and add new views.

After some iterations we obtain the view we have seen earlier.

*(Inspect the last snippet.)*'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Viewable Data Wrapper')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> viewableDataWrapperPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Viewable Data Wrapper')
		addSnippet: (LeTextSnippet new
				string: '## Start by grabbing your data.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'repoDir := FileLocator imageDirectory / ''esug.github.io''.

"Clone the repo if we haven''t already done so."
repoDir exists
	ifFalse: [ repo := ''git@github.com:ESUG/esug.github.io.git''.
		repository := IceRepositoryCreator fromUrl: repo to: repoDir ].
repoDir';
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## Wrap it in a new class.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'EsugWebsiteWrapper new repoDir: repoDir';
				yourself);
		addSnippet: (LeTextSnippet new
				string: '## Add views to answer questions about the data.';
				yourself);
		addSnippet: (LePharoSnippet new
				code: 'EsugWebsite instance';
				yourself);
		yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> viewableEntity: aSlide [
	<gtSlide>
	
<text: '## Pattern: ...

TODO -- Ludo game, IMDB JSON view

'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self db pageNamed: 'Pattern: Viewable Entity')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> viewableEntityPage [
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Viewable Entity')
		addSnippet: (LeTextSnippet new
				string: '#Intent';
				addSnippet: (LeTextSnippet new
						string: 'Turn interesting data into a *viewable entity*. ';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Extract the navigation steps into a new custom view for the moldable object you start navigating from. ';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '#Example';
				addSnippet: (LeTextSnippet new
						string: 'We explore an instance of our stack machine with two values pushed on it.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: 'StackMachineV1 new
	! 3;
	! 4;
	yourself';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'We find a view that we like and add it to the stack machine.';
						yourself);
				yourself);
		yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> viewableEntityScenery: aSlide [
	<gtSlide>

<text: '# Viewable Entity

As you discover interesting facts about your moldable domain objects, you want to turn these facts into Vieable Entities. In other words, these will then become views of your moldable object.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Viewable Entity' ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> whatIsMoldableDevelopment: aSlide [
	<gtSlide>

<text: '# What is Moldable Development?

It is well-known that in conventional software development, much of the developer''s time is spent trying to answer questions about the software.

This can be done by experimenting with the running system, reading the code, or possibly by applying some analysis tools.

Unfortunately none of these approaches scales very well, least of all generic analysis tools that are not tailored to your specific application.

Instead, moldable development takes the approach that domain-specific tools are needed make any given system explainable, so building custom tools must be cheap and fast.
'>

	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'What is Moldable Development?');
		paragraphWithFormat: (self
				asBigText: '

Moldable development supports decision making by making domain concepts ')
				, (self asBigText: 'explainable.') italic
]
