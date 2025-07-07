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
	<text: '## Pattern: Collection Wrapper

Here again is our website inspector. If we dive into the list of links in a website, the result is a `WebLinkGroup` and not just a collection. This way we obtain more useful views for the result.

If we explore the class hierarchy, we see that the website and the query result are in the same hierarchy and inherit the same views and actions.

*(Maximize the Meta view of the group to see the class hierarchy starting from AWebLinkGroup.)*

Furthermore the WebLinkGroup uses the TGtGroupWithItems trait so that it is mostly polymorphic with Collections. Only a few methods are actually implemented by this class.

*(Show the non-trait methods.)*

Similarly, if we perform a Spotter search for, say “Smalltalk”, we will get a wrapped Page group with a useful overview.

*(Minimize the Coder view to see the Inspector again, perform the query and view the result set.)*'>
	<demo: '## Pattern: Collection Wrapper

Inspect the Links from the Overview.
Open a Coder on the Link group.
Maximize the veiw and show the hierarchy.
Show the classes uses the trait TGtGroupWithItems.
Show the non-trait methods.
Optionally go back to the overview and search for Smalltalk.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Collection Wrapper')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> collectionWrapperPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Collection Wrapper')
	addSnippet: (LeTextSnippet new
			string: '# Intent';
			addSnippet: (LeTextSnippet new
					string: 'Wrap collections of domain objects in a dedicated collection wrapper, so that the results of queries can also have dedicated views, actions and searches.';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Example';
			addSnippet: (LeTextSnippet new
					string: 'If we dive into a collection of links, or perform a Spotter search, the result should not be a raw collection, but a wrapped WebPageGroup or WebLinkGroup.';
					yourself);
			addSnippet: (LeExampleSnippet new
					exampleBehaviorName: #MarkdownWebsiteExamples;
					exampleSelector: #onWebsiteOct23;
					noCode: true;
					previewHeight: 450);
			addSnippet: (LeTextSnippet new
					string: '';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> collectionWrapperScenery: aSlide [
	<gtSlide>

<text: '# Collection Wrapper

Just as raw data needs to be wrapped to make it moldable, the results of queries should be wrapped to make them moldable as well.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Collection Wrapper' ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> contextualPlayground: aSlide [
	<gtSlide>
	<text: '## Pattern: Contextual Playground

In a conventional development process, you must constantly switch context between writing code, and running or testing it. By starting instead from a moldable object, you can stay within the context of a live object to explore and experiment with new features.

Here we inspect our current version of the state machine, and ask how to add a number to the top of the stack. We navigate to the stack instance, and query its Meta view for “add” methods. We find the `addLast:` message, and try it out in the contexual playground of the  moldable object.

We like what we see, so we extract the code as a method called `!`.

We similarly experiment with and extract methods `stack`, `top`, and `isEmpty`.'>
	<demo: '## Pattern: Contextual Playground

Inspect the stack instance.
In the Meta view, search for add methods.
Try addLast: in the playground and refresh to see the result.
Extract as a `!` method.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Contextual Playground')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> contextualPlaygroundPage [
	<lePage>
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
	<text: '## Pattern: Custom Action

Whereas a custom view presents information in a useful and reproducible way, a custom action encapsulates a repeated task and makes it available in a concenvient way.

Here we see our website inspector again. We see there are some unreachable pages. If we navigate to some of these pages, we might like to check the page online.

*(Navigate to the unreachable pages and open one of them.)*

A custom action will open the page online in a web browser.

Note that the code for an action is similar in style to that of a view.

*(Option click on the web browser button.)*

We can also see that many links are missing an HTTP status. Again we can use a custom action to check these links,and another one to stop checking.

*(Open the missing status view. Start and stop link checking.)*'>
	<demo: '## Pattern: Custom Action

Navigate to an unreachable page.
Open it in a web browser with the custom action.
Show the custom code.
Inspect the Missing status group from the Overview.
Start and stop link checking.
Possibly inspect a bad link and open it in a web browser.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Custom Action')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> customActionPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Custom Action')
	addSnippet: (LeTextSnippet new
			string: '# Intent';
			addSnippet: (LeTextSnippet new
					string: 'Add a *custom action* button to the key objects involved in the repeated tasks, encapsulating the boilerplate code to perfom them.';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Example';
			addSnippet: (LeTextSnippet new
					string: 'The Markdown website includes custom actions to check links, and open a page in a web browser.';
					yourself);
			addSnippet: (LeExampleSnippet new
					exampleBehaviorName: #MarkdownWebsiteExamples;
					exampleSelector: #onWebsiteOct23;
					noCode: true;
					previewHeight: 450);
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> customActionScenery: aSlide [
	<gtSlide>

<text: '# Custom Action

Views are just one way of adding cheap, custom tools to moldable domain objects.

Another way is by introducing custom actions.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Custom Action' ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> exampleObject: aSlide [
	<gtSlide>
	<text: '## Pattern: Example Object

Here we have a fresh stack machine, to which we want to push 3 and 4.

This works nicely, but we would like to turn this into an example.

First we extract the code as a method called `stackWith3and4`. Then we add the `<gtExample>` pragma. This turns it into an example method that can be run from the coder to create a new instance.

*(Extract the code, open a coder, and add the pragma. Run the example from the coder.)*

Finally we add a few obvious assertions to let the example also serve as a test case.

Note that the class is now decorated with an example runner action.'>
	<demo: '## Pattern: Example Object

Run the example.
Extract the code as stackWith3and4.
Add the pragma.
Run the code from the coder.
Add some assertions.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Example Object')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> exampleObjectPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Example Object')
	addSnippet: (LeTextSnippet new
			string: '# Intent';
			addSnippet: (LeTextSnippet new
					string: 'Wrap examples as methods that optionally perform some tests, and return an example instance.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Examples work just like classical unit tests, but they can be composed. This eliminates code duplication, and reduces cascades of failing tests due to shared fixtures.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'Examples can be used as a starting point for moldable development, or can be embedded in notebook pages for documentation.';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Example';
			addSnippet: (LeTextSnippet new
					string: 'Here is a code snippet that we would like to extract as an example.';
					yourself);
			addSnippet: (LeElementSnippet new
					code: 'scripter := GtInspectorScripterExamples new
		scriptedInspectorOn: StackMachineV1 new
		WithPlaygroundText: ''example := self class new.
example ! 3.
example ! 4.
example.''.
scripter elementWithoutParent.';
					codeVisible: false;
					elementHeight: 455;
					codeHeight: 190;
					yourself);
			addSnippet: (LeTextSnippet new
					string: '';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> exampleObjectScenery: aSlide [
	<gtSlide>

<text: '# Example Object

An Example method is just like a test method, except that it returns an object. This may seem like a trivial point, but it opens up a world of possibilities.'>

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

*(Go to the Moves view, and replay several moves.)*

The object is also live, so we can can interact with it programmatically, by opening a playground, and, for example, autoplaying it to the end.

*(Open a second Inspector view showing the Board, and autoplay from the playground, showing both the Moves and Board views updating.)*

The views are cheap to create. The Moves view, for example, consists of just a few lines of code displaying the moves as a columned list.

*(OPT-Click on the Moves view.)*

We can also update the live object, for example, to make the `Moves` view the default one.

*(Change the  Moves priority to 5.)*'>

<demo: '## Inspecting a live game

Show some views.
Navigate to a Player. Inspect its views.
Show more views.
Show the the Moves view. Replay several moves.

Open a playground. Do: self autoPlay: 10
Open a second inspector, and autoplay some more.
Play to the end.

Show the Moves view code.
Change the priority to 5.'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Inspecting a live Ludo game';
		element: [ (GtPager
				createWrappedOn: (GtInspector forObject: GtLudoRecordingGameExamples new gameShowingAllMoves3))
				maximized ]
]

{ #category : #accessing }
MoldableDevelopmentPatternsSlideshow >> killList [
"Used by scriptText to remove text lines starting with any of these prefixes. Can be overridden by subclasses."
	"^ #('#' '*(' '```')"
	^ #()
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

<demo: '## Understanding the Ludo game

Click on the die and try to play.'>

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

<demo: '## Browsing the Ludo source code

Browse the classes and methods. Look at some class comments.'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'Browsing the code is slow and tedious';
		element: [ (GtCoderElement forClass: GtLudoGame) createInPager maximized ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> markdownWebsiteExample: aSlide [
	<gtSlide>

<text: '## Markdown Website Explorer

After a few iterations, we have a collection of domain objects with custom views that allow us to explore the pages, links, missing links, reachable and unreachable pages, and even a map showing the connections between pages.'>

<demo: '## Markdown Website Explorer

Explore the pages, the unreachable pages and the map.'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'A Markdown Website Explorer';
		element: [ (GtPager
				createWrappedOn: (GtInspector forObject: MarkdownWebsiteExamples new onWebsiteOct23))
				maximized ]
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
	<demo: '## Pattern: Moldable object

Fix the class and inspect the result.
Add an initialize method with a `stack` slot in the Meta view.
Run it in the Playground.
See it in the Raw view.
Inspect the stack slot state.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Moldable object')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> moldableObjectPage [
	<lePage>
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
	"NB: Generated by GtScenery>>#storeAsExampleMethod -- do not edit."

	<gtExample>
	<noTest>
	| scenery item1 item2 item3 item4 item5 item6 item7 item8 item9 |
	scenery := GtScenery new.
	item1 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Moldable Object')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 16;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item1 position: 322.00000000000006 @ 194.00000000000003.
	item1 extent: 170.20192464192695 @ 39.99999999999997.
	item2 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Viewable Data Wrapper')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 22;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item2 position: 577 @ 194.
	item2 extent: 215.06197611490893 @ 40.0.
	item3 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Project Diary')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 14;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item3 position: 609.0000000000002 @ 258.0000000000001.
	item3 extent: 133.14793904622388 @ 40.0.
	item4 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Contextual Playground')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 22;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item4 position: 296.0 @ 332.0000000000001.
	item4 extent: 222.93304443359375 @ 40.0.
	item5 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Example Object')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 15;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item5 position: 593.0000000000001 @ 332.00000000000006.
	item5 extent: 162.92442321777332 @ 40.0.
	item6 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Viewable Entity')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 16;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item6 position: 326.0 @ 432.00000000000006.
	item6 extent: 165.39362589518248 @ 40.0.
	item7 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Custom Action')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 14;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item7 position: 522.0000000000001 @ 430.0.
	item7 extent: 162.03145345052087 @ 40.0.
	item8 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Simple View')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 12;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item8 position: 252.00000000000006 @ 543.0.
	item8 extent: 126.12884521484375 @ 40.0.
	item9 := scenery
			addSceneryItem: (GtSceneryTextStencil new
					text: ((BlRunRopedText string: 'Collection Wrapper')
							attributeRuns: (BlRunTree basicNew
									instVarAt: 1
										put: (BlRunTreeLeafNode basicNew
												instVarAt: 1 put: 19;
												instVarAt: 2
													put: ((Array new: 3)
															at: 1 put: (BlFontSizeAttribute new size: 20);
															at: 2 put: (BlFontWeightAttribute new weight: 700);
															at: 3
																put: (BlFontFamilyDefaultAttribute new beNotOverwritableByStyler
																		name: 'Source Sans Pro');
															yourself);
												yourself);
									yourself))) asItem.
	item9 position: 424 @ 543.
	item9 extent: 185.22221883138013 @ 40.0.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item1
		to: item2.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item2
		to: item1.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item1
		to: item3.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item3
		to: item5.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item1
		to: item4.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item4
		to: item6.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item4
		to: item7.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item6
		to: item8.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item6
		to: item9.
	scenery
		addConnectionWithStencil: GtSceneryLineStencil new
		from: item4
		to: item5.
	scenery
		storeStringMethodName: 'MoldableDevelopmentPatternsSlideshow>>#patternMapScenery'.
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
	<lePage>
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
	<text: '## Pattern: Project Diary

All through this presentation we have been using notebook pages to document our progress. There are many further examples in the GT book. By curating these pages, they turn into a searchable knowledge base of documentation and live examples.'>
	<demo: '## Pattern: Project Diary

Browse some of the Ludo pages.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Project Diary')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> projectDiaryPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Project Diary')
		addSnippet: (LeTextSnippet new
				string: '# Intent';
				addSnippet: (LeTextSnippet new
						string: 'Use a notebook as the starting point for your project and all of its tasks. Use the notebook to keep a diary of your progress. As the project matures, use the notebook as a draft for the documentation.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '# Example';
				addSnippet: (LeTextSnippet new
						string: 'There are numerous examples in the Glamorous Toolkit book. See, for example, the pages documenting the Ludo game.';
						yourself);
				addSnippet: (LeElementSnippet new
						code: 'page := LeStorageExamples new gtBook
		pageNamed: ''Implementing a Ludo Game as a moldable development exercise''.
(GtPager createWrappedOn: (LePagePhlowTool page: page)) maximized';
						codeVisible: false;
						elementHeight: 598;
						codeHeight: 50;
						yourself);
				yourself);
		yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> projectDiaryScenery: aSlide [
	<gtSlide>

<text: '# Project Diary

We have been using notebook pages to work from.
Also this is a pattern, as these pages can be used to document and manage your Moldable Development projects.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Project Diary' ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> simpleView: aSlide [
	<gtSlide>
	<text: '## Pattern: Simple View

In this demo example of an address book we can see columned lists, an even simpler list view, a fancier mondrian graph layout view, and a text editor view.

*(Click through them and show the code.)*

Any kind of graphical element can also be reused within an `explicit` view. This is the case for the Ludo game, which reuses its graphical UI as a view.

Finally we see some statistics calculated on the current image. The greatest number of views are the `empty` view, which is is used to suppress a view if it contains no useful information. Next are forwarding views, which just reuse other existing views. The next bunch we have all seen already.

Interestingly, most of the views are under 12 lines of code.
Here we retrieve all the `gtView` methods, and in the inspector view we can see some metrics.

*(Evaluate the snippet, and switch to the Inspector Metrics view.)*'>
	<demo: '## Pattern: Simple View

Open the example in a new column.
Explore the views and show the code.
Go back to the page.
Show the explicit view.
Show the statistics.
Explore the pragmas and show the metrics view.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Simple View')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> simpleViewPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Simple View')
		addSnippet: (LeTextSnippet new
				string: '# Intent';
				addSnippet: (LeTextSnippet new
						string: 'Pick the simplest view that answers questions about your domain object. Only refine the view if this will answer more questions.';
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'In this way, views are cheap and quick to create.';
						yourself);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '# Examples';
				addSnippet: (LeTextSnippet new
						string: 'Here we can find a `columnedList` view, a plain `list` view, and a fancier `mondrian` view. The Print view is a `textEditor` view.';
						yourself);
				addSnippet: (LeExampleSnippet new
						exampleBehaviorName: #GtABCartoonAddressBookExample;
						exampleSelector: #cartoonAddressBook;
						noCode: true;
						previewHeight: 300);
				addSnippet: (LeTextSnippet new
						string: 'Any element can be embedded as an `explicit` view';
						yourself);
				addSnippet: (LeExampleSnippet new
						exampleBehaviorName: #GtLudoGameExamples;
						exampleSelector: #playerAsecondTokenCloseToSecondOccupiedGoal;
						noCode: true;
						previewHeight: 500);
				yourself);
		addSnippet: (LeTextSnippet new
				string: '# Statistics';
				addSnippet: (LeTextSnippet new
						string: 'Here are some statistics of the most popular views in this image. We''ve already seen most of the important ones.';
						yourself);
				addSnippet: (LeElementSnippet new
						code: 'apiSelectors := ((GtPhlowProtoView methods
		select: [ :each | each protocol = ''decorating'' ]) collect: #selector) asSet
		, {#mondrian}.

popularity := ((Object withAllSubclasses
		flatCollect: [ :class | class methods select: [ :each | each hasPragmaNamed: #gtView ] ])
		flatCollect: [ :method | method ast sentMessages intersection: apiSelectors ])
		asBag sortedCounts.
popularity gtItemsFor: GtPhlowView new';
						codeVisible: false;
						elementHeight: 475;
						codeHeight: 50;
						yourself);
				addSnippet: (LeTextSnippet new
						string: 'Most of these are under 12 lines of code.';
						yourself);
				addSnippet: (LePharoSnippet new
						code: '#gtView gtPragmas ';
						yourself);
				yourself);
		yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> simpleViewScenery: aSlide [
	<gtSlide>

<text: '# Simple View

A view does not have to be complex or rich to be useful.
Most views are very simple.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Simple View' ]
]

{ #category : #accessing }
MoldableDevelopmentPatternsSlideshow >> slidePriorities [
	"This method defines the slide priorities implicitly by their order instead of by fixed numbers.
	See also: PrioritySlideshow>>#priorityFor:"

	<gtExample>
	<return: #Array>
	^ #(titleSlide: whatIsMoldableDevelopment: ludoGame: ludoSourceCode: inspectingLudo: spl: howToPracticeMoldableDevelopment: moldableObjectScenery: moldableObject: contextualPlaygroundScenery: contextualPlayground: exampleObjectScenery: exampleObject: viewableEntityScenery: viewableEntity: simpleViewScenery: simpleView: viewableDataWrapperScenery: viewableDataWrapper: markdownWebsiteExample: customActionScenery: customAction: collectionWrapperScenery: collectionWrapper: projectDiaryScenery: projectDiary: takeaways: takeawayKnowledge: takeawayCustomTools: takeawayUniversal: takeawayPatterns:)
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> spl: aSlide [
	<gtSlide>

<text: '## Inspecting an interpreter

Moldable development can apply to any kind of project.

Here is a very different example of an interpreter for a Simple Programming Language for a compiler course.

The default view is actually a composition of three views, of the current continuation -- in this case a factorial program -- the current environment bindings, and the program output.

This inspector also has custom actions to perform a single interpretation step, or to run the program to the end.

*(Do both.)*

We see the three views update with each step.

Another view allows us to explore the history of the execution, thus allowing us to replay and understand the semantic steps.'>

<demo: '## Inspecting an interpreter

Show some views.
Perform some steps.
Play to the end.
Explore the History.'>

	^ aSlide labelAndElement
		setPriority;
		newFadedText: 'SPL';
		element: [ (GtPager createWrappedOn: (GtInspector forObject: SPL factorial)) maximized ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> takeawayCustomTools: aSlide [
	<gtSlide>

<text: '## Takeaway: Every problem requires different custom tools

Every problem is different and requires custom tools. GT is an environment that makes it cheap to build such tools by making the platform itself moldable.'>

	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asText: 'Every problem needs custom tools');
		element: [ (GtPager
				createWrappedOn: (GtInspector forObject: MarkdownWebsiteExamples new onWebsiteOct23))
				maximized ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> takeawayKnowledge: aSlide [
	<gtSlide>
	
<text: '## Takeaway: Moldable Development reveals system knowledge

The system is the source of knowledge. The goal of moldable development is to make that knowledge explicit and accessible.

The GT Book is an example of such a knowledge base, but every project should have one.'>

	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asText: 'Moldable Development makes system knowledge explicit and accessible');
		element: [ (GtPager
				createWrappedOn: (LePagePhlowTool page: LeStorageExamples new gtBook tableOfContents))
				maximized ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> takeawayPatterns: aSlide [
	<gtSlide>

<text: '## Takeaway: Moldable Development requires a paradigm shift

Moldable Development puts moldable objects rather than source code in focus.

This requires a different way of thinking about and developing software, but it can be learned with the help of these patterns.

Thanks for  listening.'>

	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asText: 'Moldable Development requires a paradigm shift');
		element: [ self patternMapScenery ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> takeawayUniversal: aSlide [
	<gtSlide>
	
<text: '## Takeaway: Moldable Development can be applied to any problem

The approach is always the same. Make the domain concepts first-class, and mold them to make them explainable.

Here we see that Moldable Development has also been applied to prepare this presentation.'>
	 
	^ aSlide labelAndElement
		setPriority;
		newTextWithFormat: (self asText: 'Moldable Development can be applied to any problem');
		element: [ (GtPager
				createWrappedOn: (GtInspector forObject: MoldableDevelopmentPatternsSlideshow new))
				maximized ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> takeaways: aSlide [
	<gtSlide>
	
<text: '# Takeaways 

Let me conclude with a few takeaway messages.'>

	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'Takeaways')

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

In this example, we want to be able to explore and analyze a GitHub Pages website consisting of markdown pages.

In this case I have a local snapshot of my own website, though I could also clone the current version.

If I explore this folder I can navigate to the individual files, but I can only do so using the generic views for files and directories.

What we can do now is wrap the data in a dedicated domain class to obtain a moldable object.

*(Apply the fixits to create the class and the setter.)*

Now we can find all the markdown files in the contextual playground, extract this as a lazy initializer, and slowly introduce interesting views.'>
	<demo: '## Pattern: Viewable Data Wrapper

Explore the website folder.
Show the basic views of the markdown pages.
Fix the wrapper and the data initializer.
Show how we access the data from the playground.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Viewable Data Wrapper')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> viewableDataWrapperPage [
	<lePage>
	<gtExample>
	<noTest>
	^ (LePage named: 'Pattern: Viewable Data Wrapper')
	addSnippet: (LeTextSnippet new
			string: '# Intent';
			addSnippet: (LeTextSnippet new
					string: 'Wrap data to obtain a moldable object to which you can add custom views.';
					yourself);
			yourself);
	addSnippet: (LeTextSnippet new
			string: '# Example';
			addSnippet: (LeTextSnippet new
					string: 'We can explore the files of a GitHub pages website.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'websiteFolder := (FileLocator gtResource / ''feenkcom'' / ''gtoolkit-demos''
		/ ''data'' / ''onierstrasz.github.io'') asFileReference';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'But to mold the data we need to wrap it. We create the class and start to explore.';
					yourself);
			addSnippet: (LePharoSnippet new
					code: 'MyWebsite new data: websiteFolder';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'We find all the markdown files corresponding to pages.';
					yourself);
			addSnippet: (LeTextSnippet new
					string: 'We slowly introduce views, and after some iterations we have an explainable domain object ...';
					yourself);
			addSnippet: (LeTextSnippet new
					string: '';
					yourself);
			yourself);
	yourself
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> viewableDataWrapperScenery: aSlide [
	<gtSlide>

<text: '# Viewable Data Wrapper

Many projects start with existing data. In this case a good strategy is to wrap the data to turn it into a Moldable Object.'>

	^ aSlide element
		setPriority;
		element: [ self patternSceneryHighlighting: 'Viewable Data Wrapper' ]
]

{ #category : #slides }
MoldableDevelopmentPatternsSlideshow >> viewableEntity: aSlide [
	<gtSlide>
	<text: '## Pattern: Viewable Entity

As you explore your moldable domain objects you will discover interesting facts that you would like to make explicitly visible.

In this example we are exploring our stack machine example. The default “raw” view is a rather poor way of understanding the machine. If we navigate from there to the stack instance, we find a better way to see the state of the stack in the Items view of the collection. We can Alt-click on the view to see its source code.

This is a classical example of a view method, in this case defined for SequenceableCollections. Let''s have a look at how it is defined.

The name is `gtSomethingFor:` by convention (it could be anything). It takes `aView` as its single argument. The important part is the `<gtView>` pragma in the first line, which flags it as a view method. We then construct the view by asking it for a columnedList view. There is a title for the view, a priority to define the order in which it will appear, and then a number of messages to configure the items of the columned list.

We can reuse this view for our Stack Machine.

*(Open a second, meta view, of the stack machine, next to the initial inspector view.)*

We define a `gtStackFor:` method with a `<gtView>` pragma, and we construct a `forward` view that forwards to the `stack` object, and reuses the `#gtItemsFor:` view. There it is!

*(Define the method.)*

Now we can give it a better title, and set the priority to 10 so we see it first.

*(Do that and see the view update.)*'>
	<demo: '## Pattern: Viewable Entity

Inspect the stack machine in a new column.
Inspect the stack state.
View the Items code and explain it.
Copy the selector.
Open a second inspector on the stack machine.
Go the StackMachine Meta view and add a forward view.'>
	^ aSlide lepiterPage
		setPriority;
		startPage: (self database pageNamed: 'Pattern: Viewable Entity')
]

{ #category : #page }
MoldableDevelopmentPatternsSlideshow >> viewableEntityPage [
	<lePage>
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
						string: 'We explore the example stack machine with two values on it.';
						yourself);
				addSnippet: (LeElementSnippet new
						code: 'GtInspector newOn: StackMachineV2 new stackWith3and4';
						codeVisible: false;
						elementHeight: 368;
						codeHeight: 50;
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

As you discover interesting facts about your moldable domain objects, you want to turn these facts into Viewable Entities. In other words, these will then become views of your moldable object.'>

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

Instead, moldable development takes the approach that domain-specific tools are needed to make any given system explainable, so building custom tools must be cheap and fast.
'>

	^ aSlide paragraph
		setPriority;
		subtitleWithFormat: (self asTitle: 'What is Moldable Development?');
		paragraphWithFormat: (self
				asBigText: '

Moldable development supports decision making by making domain concepts ')
				, (self asBigText: 'explainable.') italic
]

{ #category : #accessing }
MoldableDevelopmentPatternsSlideshow >> wordsPerMinute [
	^ 100
]
