Class {
	#name : #GtPlaygroundAndInspectorSlideshow,
	#superclass : #GtLiveShow,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> createClassFromPlaygroundExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: self fixItAdornmentForClassExplanationText;
		element: [ self fixItAdornmentForClassExplanation ];
		onFirstAddToSceneGraphDo: 
			[:anElement |
				| button playgroundElement dropDown selection menuTarget |
				playgroundElement := (anElement childAt: 2) childAt: 2.

				playgroundElement enqueueTask:
					(BlTaskAction new
						action: [
							button := playgroundElement
								allChildrenBreadthFirstDetect: [:aChild |
									(aChild isKindOf: BrTextEditorSegmentElement)]
								ifFound: [:aChild | aChild childAt: 2].
							BlSpace simulateClickOn: button.
							BlSpace simulateClickOn: button.
							dropDown := playgroundElement space root childAt: 2.
							selection := dropDown
								allChildrenBreadthFirstDetect: [:aChild |
									aChild isKindOf: BrInfiniteListElement]
								ifFound: [:aChild | (aChild childAt: 1) childAt: 1].
						BlSpace simulateClickOn: selection.
						BlSpace simulateClickOn: selection.
						menuTarget := playgroundElement
							allChildrenBreadthFirstDetect: [:aChild |
								aChild isKindOf: BrFrame]
							ifFound: [:aChild | aChild].
						menuTarget
							addChild:
								((self yellowTargetCircleWithExplanationModel: #menu)
									relocate:
										(50 @ 50))])].
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> createMethodFromPlaygroundExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: self fixItAdornmentForMethodExplanationText;
		element: [ self fixItAdornmentForMethodExplanation ];
		onFirstAddToSceneGraphDo:
			[:anElement |
				| button playgroundElement dropDown selection coderTarget |
				playgroundElement := (anElement childAt: 2) childAt: 2.

				playgroundElement enqueueTask:
					(BlTaskAction new
						action: [
							button := playgroundElement
								allChildrenBreadthFirstDetect: [:aChild |
									(aChild isKindOf: BrTextEditorSegmentElement)]
								ifFound: [:aChild | aChild childAt: 7].
							BlSpace simulateClickOn: button.
							BlSpace simulateClickOn: button.
							dropDown := playgroundElement space root childAt: 2.
							selection := dropDown
								allChildrenBreadthFirstDetect: [:aChild |
									aChild isKindOf: BrInfiniteListElement]
								ifFound: [:aChild | (aChild childAt: 1) childAt: 1].
							BlSpace simulateClickOn: selection.
							BlSpace simulateClickOn: selection.
							coderTarget := playgroundElement
								allChildrenBreadthFirstDetect: [:aChild |
									aChild isKindOf: BrFrame]
								ifFound: [:aChild | aChild].
							coderTarget
								addChild:
									((self yellowTargetCircleWithExplanationModel: #coder)
										relocate:
											(50 @ 50))])].
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> fixItAdornmentForClassExplanation [
	<gtExample>
	| playgroundElement defaultPlaygroundElement aScripter adornmentButtonTarget |
	
	playgroundElement := BlUseAsyncFeatures
		disableDuring: [(GtPlaygroundLiveSlide new snippets: {'GtDummyClass new.'}) asElement].
	defaultPlaygroundElement := BlUseAsyncFeatures
		disableDuring: [(GtPlaygroundLiveSlide new snippets: {'GtDummyClass new.'}) asElement].
		
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Initiate Playground'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ playgroundElement ].
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.

	playgroundElement := aScripter elementWithoutParent.	
	
	aScripter
		substep: 'Initiate Default Playground'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ defaultPlaygroundElement ].
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	defaultPlaygroundElement := aScripter elementWithoutParent.
	
	adornmentButtonTarget := defaultPlaygroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextEditorSegmentElement)]
		ifFound: [:aChild | aChild childAt: 2].
		
	adornmentButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #fixItAdornment)
					relocate:
						(10 @ adornmentButtonTarget extent y / 2)).
		
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent ];
		margin: (BlInsets all: 5);
		addChild: (defaultPlaygroundElement maximized vExact: 350);
		addChild: playgroundElement maximized.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> fixItAdornmentForClassExplanationText [
	| text |
	text := 'The Playground also offers the possibility to crate code in place. For example, if you try to instantiate a class that was not defined before, an ' asRopedText,
('adornment' asRopedText glamorousExplanationFor: #fixItAdornment),
' appears next to it. Clicking on it gives you the option to create a class. Selecting it opens a ' asRopedText,
('menu' asRopedText glamorousExplanationFor: #menu),
', similar to the one in the coder, where you can define your class.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> fixItAdornmentForMethodExplanation [
	<gtExample>
	| playgroundElement defaultPlaygroundElement aScripter adornmentButtonTarget |
	
	playgroundElement := BlUseAsyncFeatures
		disableDuring: [(GtPlaygroundLiveSlide new snippets: {'GtDummyExamplesOnInstanceSide new exampleMethod.'}) asElement].
	defaultPlaygroundElement := BlUseAsyncFeatures
		disableDuring: [(GtPlaygroundLiveSlide new snippets: {'GtDummyExamplesOnInstanceSide new exampleMethod.'}) asElement].
		
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Initiate Playground'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ playgroundElement ].
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	playgroundElement := aScripter elementWithoutParent.	
	
	aScripter
		substep: 'Initiate Default Playground'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ defaultPlaygroundElement ].
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	defaultPlaygroundElement := aScripter elementWithoutParent.
	
	adornmentButtonTarget := defaultPlaygroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextEditorSegmentElement)]
		ifFound: [:aChild | aChild childAt: 7].
		
	adornmentButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #adornment)
					relocate:
						(10 @ adornmentButtonTarget extent y / 2)).
		
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent ];
		margin: (BlInsets all: 5);
		addChild: defaultPlaygroundElement maximized;
		addChild: playgroundElement maximized.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> fixItAdornmentForMethodExplanationText [
	| text |
	text := 'The same thing applies to methods as well. If we try to call a method that was not yet implemented, the same ' asRopedText,
('adornment' asRopedText glamorousExplanationFor: #adornment),
' pops up next to it. Clicking on it gives us the option to create the method in the respective class. If we choose that, a ' asRopedText,
('method coder' asRopedText glamorousExplanationFor: #coder),
' opens up inside the playground so we can create the method in place.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> inspectorInterfaceExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: self inspectorInterfaceExplanationText;
		element: [ self inspectorInterfaceExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> inspectorInterfaceExplanationText [
	| text |
	text := 'The inspector is made of several parts.
The first is the ' asRopedText,
('header' asRopedText glamorousExplanationFor: #header),
', where you can see a string representation of the inspected object and a list of ' asRopedText,
('actions' asRopedText glamorousExplanationFor: #actions),
' specific to the object, such as opening a ' asRopedText,
('spotter' asRopedText glamorousExplanationFor: #spotterButton),
' in the context of the object, or opening in a new tab a ' asRopedText,
('coder' asRopedText glamorousExplanationFor: #coderButton),
' on the class of the object.
Then we have the container that has a list of ' asRopedText,
('views' asRopedText glamorousExplanationFor: #views),
' for the inspected object. Those views can be custom, specific to the inspected object, for example or default, available for all the objects, for example ' asRopedText,
('Raw' asRopedText glamorousExplanationFor: #rawView),
' and ' asRopedText,
('Meta' asRopedText glamorousExplanationFor: #metaView),
' views.
The Meta view offers a coder on the class of the object inside the inspector.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> inspectorInterfaceExplanationWithLinks [
	| inspectorElement headerTarget actionTargets spotterButtonTarget coderButtonTarget viewsTarget rawViewtarget metaViewTarget |
	
	inspectorElement := BlUseAsyncFeatures
		disableDuring: [ (GtABCartoonAddressBookExample new cartoonAddressBook gtViewsFor: GtPhlowView empty) 
			asElementDo: [ :e | e ] ].
	inspectorElement forceLayout.
	
	headerTarget := inspectorElement phlow firstChildWithView.
	actionTargets := inspectorElement phlow allChildrenWithAction.
	spotterButtonTarget := inspectorElement phlow allChildrenWithAction at: 3.
	coderButtonTarget := inspectorElement phlow allChildrenWithAction at: 2.
	viewsTarget := inspectorElement
		allChildrenBreadthFirstSelect: [:aChild |
			aChild isKindOf: BrTab].
	rawViewtarget := viewsTarget detect: [:aView | aView label asString = 'Raw' asString].
	metaViewTarget := viewsTarget detect: [:aView | aView label asString = 'Meta' asString].
	
	headerTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #header)
				relocate:
					(5 @ headerTarget extent y / 2)). 
	actionTargets do: [:each |
		each addChild:
			((self yellowTargetCircleWithExplanationModel: #actions)
				relocate:
					(5 @ each extent y / 2))].
	spotterButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #spotterButton)
				relocate:
					(5 @ spotterButtonTarget extent y / 2)).
	coderButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #coderButton)
				relocate:
					(5 @ coderButtonTarget extent y / 2)).
	viewsTarget allButFirstDo: [:each |
		each
			addChild:
				((self yellowTargetCircleWithExplanationModel: #views)
					relocate:
						(5 @ each extent y / 2))].
	rawViewtarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #rawView)
				relocate:
					(5 @ rawViewtarget extent y / 2)).
	metaViewTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #metaView)
				relocate:
					(5 @ metaViewTarget extent y / 2)).
					
	^ BlElement new
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: inspectorElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> inspectorMethodExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 10;
		newTextWithFormat: self inspectorMethodExplanationText;
		element: [ self inspectorMethodExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> inspectorMethodExplanationText [
	| text |
	text := 'An inspector view is a method implemented in the class of the object that we want to visualize. This method is annotated with a specific pragma, namely ' asRopedText,
('gtView' asRopedText glamorousExplanationFor: #gtView),
'. Inside the method we specify how the view will look. For instance, here we have a ' asRopedText,
('columned list' asRopedText glamorousExplanationFor: #columnedList),
' view, so after we give it a ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
', we specify the ' asRopedText,
('items' asRopedText glamorousExplanationFor: #items:),
' for the list and how the ' asRopedText,
('columns' asRopedText glamorousExplanationFor: #columns),
' will be structured inside the list.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> inspectorMethodExplanationWithLinks [
	<gtExample>
	| coderElement inspectorElement coderLabel inspectorLabel |
	
	coderElement := self methodCoderWithExplanationLinks.
	inspectorElement := self inspectorWithExplanationLinks.
	coderLabel := BrLabel new
		text: ('Contacts with details view method' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		look: BrGlamorousLabelLook new.
	inspectorLabel := BrLabel new
		text: ('Contacts with details view result' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		look: BrGlamorousLabelLook new.
		
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.
			c padding: (BlInsets all: 5)];
		layout: BlLinearLayout vertical;
		addChildren: {coderLabel. coderElement. inspectorLabel. inspectorElement}.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> inspectorWithExplanationLinks [
	| resultInspectorContainer resultElement resultInspectorTree titleTab avatarLabel nameLabel phoneLabel itemsCollection |
	
	resultInspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		look: BrShadowLook;
		background: Color white;
		margin: (BlInsets all: 10).
	
	resultElement := BlUseAsyncFeatures
		disableDuring: [ (GtPhlowView empty composite
				views:
					{(GtABCartoonAddressBookExample new cartoonAddressBook
						gtViewContactsOn: GtPhlowView empty)};
				labelled: 'a GtABAddressBook (Cartoons)' asRopedText)
				asElementDo: [ :e | e ] ].
	resultElement forceLayout.
	resultInspectorTree := resultElement phlow firstChildWithView viewContentElement.
	
	titleTab := resultInspectorTree
		allChildrenBreadthFirstDetect: [ :aChild | 
			(aChild isKindOf: BrTab)
				and: [ aChild label asString = 'Contacts with details' ] ]
		ifFound: [ :aChild | aChild ].
	avatarLabel := resultInspectorTree
		allChildrenBreadthFirstDetect:
			[ :aChild | (aChild isKindOf: BrLabel) and: [ aChild text asString = 'Avatar' ] ]
		ifFound: [ :aChild | aChild ].
	nameLabel := resultInspectorTree
		allChildrenBreadthFirstDetect:
			[ :aChild | (aChild isKindOf: BrLabel) and: [ aChild text asString = 'Name' ] ]
		ifFound: [ :aChild | aChild ].
	phoneLabel := resultInspectorTree
		allChildrenBreadthFirstDetect:
			[ :aChild | (aChild isKindOf: BrLabel) and: [ aChild text asString = 'Phone' ] ]
		ifFound: [ :aChild | aChild ].
	itemsCollection := resultInspectorTree
		allChildrenBreadthFirstSelect: [ :aChild | 
			(aChild isKindOf: BlElement) and: [aChild parent isKindOf: BrInfiniteListElement] ].
			
	titleTab
		addChild:
			((self yellowTargetCircleWithExplanationModel: #title:)
				relocate: 10 @ titleTab extent y / 2).
	avatarLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: 5 @ avatarLabel extent y / 2).
	nameLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: 5 @ nameLabel extent y / 2).
	phoneLabel
		addChild:
			((self yellowTargetCircleWithExplanationModel: #columns)
				relocate: 5 @ phoneLabel extent y / 2).
	itemsCollection
		do: [ :eachRow | 
			eachRow
				addChild:
					((self yellowTargetCircleWithExplanationModel: #items:)
						relocate: 3 @ eachRow extent y / 2) ].

	^ resultInspectorContainer
		addChild: resultElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> methodCoderWithExplanationLinks [
	| coder selectors coderElement |
	coder := GtMethodCoder
		forMethod: GtABAddressBook >> #gtViewContactsOn:.
		
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors
		addSelectors:
			{#gtView. #columnedList . #title: . #items:}.
	selectors addSelector: #column:icon: withIdentifier: #columns.
	selectors addSelector: #column:text: withIdentifier: #columns.
	
	coder
		explanationLink:
			(GtCompositeExplanationLinkStyler
				forLinks:
					{selectors}).
	coderElement := (coder expanded: true) asElement
		margin: (BlInsets all: 10).
	coderElement forceLayout.
	coderElement vMatchParent.
	
	^ coderElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> playgroundAndInspectorExplanationText [
	^ 'Playground and inspector are the core tools that enable live exploration. Using the playground you can easily write and run different snippets of code and then visualize their result using the inspector.' asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> playgroundAndInspectorMashExample [
	<gtExample>
	^ (GtMashExampleLiveSlide new
		leftElement: 
			(BlElement new
				look: BrShadowLook;
				background: Color white;
				addChild: ((GtPlaygroundLiveSlide new 
					snippets: {'42 + 2.'};
					inspectSnippetAt: 1) asElement));
		centerElement:
			(BlElement new
				look: BrShadowLook;
				background: Color white;
				addChild: ((GtPlaygroundLiveSlide new
					snippets: {'BlElement new background: Color red.'};
					inspectSnippetAt: 1) asElement));
		rightElement:
			(BlElement new
				look: BrShadowLook;
				background: Color white;
				addChild: ((GtABCartoonAddressBookExample new cartoonAddressBook 
					gtViewsFor: GtPhlowView empty) asElement))) asElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> playgroundAndInspectorMashExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 5;
		newTextWithFormat: self playgroundAndInspectorExplanationText;
		element: [self playgroundAndInspectorMashExample];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> playgroundInterfaceExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 6;
		newTextWithFormat: self playgroundInterfaceExplanationText;
		element: [ self playgroundInterfaceExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> playgroundInterfaceExplanationText [
	| text |
	text := 'In the playground you can have multiple ' asRopedText,
('snippets' asRopedText glamorousExplanationFor: #snippets),
' opened, where you can write your code. To open a new snippet you click on the ' asRopedText,
('+' asRopedText glamorousExplanationFor: #plusButton),
' button and then select ' asRopedText,
('pharo' asRopedText glamorousExplanationFor: #pharoButton),
'. And if you want to close a snippet you can click on the ' asRopedText,
('close' asRopedText glamorousExplanationFor: #closeButton),
'button.
Each snippet can be ' asRopedText,
('evaluated' asRopedText glamorousExplanationFor: #evaluateButton),
', ' asRopedText,
('inspected' asRopedText glamorousExplanationFor: #inspectButton),
' or ' asRopedText,
('debugged' asRopedText glamorousExplanationFor: #debugButton),
' individually.
Finally, if you click on the ' asRopedText,
('search' asRopedText glamorousExplanationFor: #searchButton),
' button you open up a spotter where you can see a history of all the playground snippets you have evaluated or inspected in this image.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> playgroundInterfaceExplanationWithLinks [
	<gtExample>
	| playgroundElement aScripter snippetTargets plusButtonTargets pharoButtonTarget closeButtonTargets evaluateButtonTargets inspectButtonTargets debugButtonTargets searchButtonTarget frameToolbar |
	playgroundElement := (GtPlaygroundLiveSlide new snippets: {'4/20'. '4 factorial'}) asElement.
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Playground Element'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ playgroundElement ] ].
	aScripter
		substep: 'Click on plus button to open new snippet'
		do: [ :aStep | 
			aStep click
				label: 'Click on + button';
				onBreadthFirstChildOfClass: BrInfinitePagerElement;
				onBreadthFirstChildOfClass: GtPlayground;
				onChildNamed: #content;
				onBreadthFirstChildOfClass: GtPageSnippetsElement;
				onChildAt: 2;
				onChildAt: 2.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	playgroundElement := BlUseAsyncFeatures
		disableDuring: [ aScripter elementWithoutParent ].
	
	plusButtonTargets := OrderedCollection new.
	closeButtonTargets := OrderedCollection new.
	evaluateButtonTargets := OrderedCollection new.
	inspectButtonTargets := OrderedCollection new.
	debugButtonTargets := OrderedCollection new.
	
	snippetTargets := playgroundElement
		allChildrenBreadthFirstSelect: [:aChild |
			(aChild isKindOf: BrFrame)].
	snippetTargets do: [ :each |
		plusButtonTargets add: (each children at: 2).
		closeButtonTargets add: (each children at: 1) ].
	frameToolbar := playgroundElement
		allChildrenBreadthFirstSelect: [:aChild | 
			(aChild isKindOf: BrToolbar) 
				and: [(aChild parent isKindOf: GtCoderActionsElement)
					and: [aChild hasChildren]]].
	frameToolbar do: [ :each |
		evaluateButtonTargets add: (each children at: 1).
		inspectButtonTargets add: (each children at: 2).
		debugButtonTargets add: (each children at: 3) ].
	searchButtonTarget := playgroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			aChild isKindOf: BrToolbar] 
		ifFound: [:aChild | aChild children at: 2].
	pharoButtonTarget := playgroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrToolbar) and: [aChild parent isKindOf: GtSnippetElement]] 
		ifFound: [:aChild | aChild children at: 3].
	
	snippetTargets do: [ :eachSnippet |
		eachSnippet
			addChild:
				((self yellowTargetCircleWithExplanationModel: #snippets)
					relocate:
						(5 @ eachSnippet extent y / 2))].
	plusButtonTargets do: [ :each |
		each
			addChild:
				((self yellowTargetCircleWithExplanationModel: #plusButton)
					relocate:
						(10 @ each extent y / 2))].
	closeButtonTargets do: [ :each |
		each
			addChild:
				((self yellowTargetCircleWithExplanationModel: #closeButton)
					relocate:
						(10 @ each extent y / 2))].
	evaluateButtonTargets do: [ :eachEvaluateButton |
		eachEvaluateButton parent
			addChild:
				((self yellowTargetCircleWithExplanationModel: #evaluateButton)
					relocate:
						(eachEvaluateButton position x @ eachEvaluateButton position y + 5))].
	inspectButtonTargets do: [ :eachInspectButton |
		eachInspectButton parent
			addChild:
				((self yellowTargetCircleWithExplanationModel: #inspectButton)
					relocate:
						(eachInspectButton position x @ eachInspectButton position y + 5))].
	debugButtonTargets do: [ :eachDebugButton |
		eachDebugButton parent
			addChild:
				((self yellowTargetCircleWithExplanationModel: #debugButton)
					relocate:
						(eachDebugButton position x @ eachDebugButton position y + 5))].
	searchButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #searchButton)
					relocate:
						(10 @ searchButtonTarget extent y / 2)).
	pharoButtonTarget
		addChild:
			((self yellowTargetCircleWithExplanationModel: #pharoButton)
					relocate:
						(10 @ pharoButtonTarget extent y / 2)).
	
	^ playgroundElement maximized.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> slideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 11;
		text: 'Want to learn more about custom inspector views? Follow the show below.' asRopedText glamorousRegularFont;
		slideshow: [GtInspectorViews new] withTitle: 'GtInspectorViews'.
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Playground and Inspector' asRopedText
			fontSize: 70;
			glamorousRegularFont).
]

{ #category : #accessing }
GtPlaygroundAndInspectorSlideshow >> yellowTargetCircleWithExplanationModel: aModel [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: aModel).
]
