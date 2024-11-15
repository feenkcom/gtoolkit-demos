Class {
	#name : #GtPlaygroundAndInspectorShow,
	#superclass : #Object,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#category : #'GToolkit-Demo-MoldableDevelopment-Slideshows'
}

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> createClassFromPlaygroundExplanationSlideFor: aSlide [
	"<gtSlide>"
	<noTest>
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
								allChildrenBreadthFirstDetect: [:aChild | aChild isKindOf: GtFixItButton ]
								ifFound: [:aChild | aChild ].
							BlSpace simulateClickOn: button.
							BlSpace simulateClickOn: button.
							dropDown := playgroundElement space root children first childAt: 2.
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
								((self yellowExplanationTargetCircleFor: #menu)
									relocate:
										(50 @ 50))])].
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> createMethodFromPlaygroundExplanationSlideFor: aSlide [
	"<gtSlide>"
	<noTest>
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: self fixItAdornmentForMethodExplanationText;
		element: [ self fixItAdornmentForMethodExplanation ]
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> fixItAdornmentForClassExplanation [
	"<gtExample>"
	| playgroundElement defaultPlaygroundElement aScripter adornmentButtonTarget |
	
	playgroundElement := BlUseAsyncFeatures
		disableDuring: [(GtPlaygroundLiveSlide new snippets: {'GtDummyClass new.'}) asElement].
	defaultPlaygroundElement := BlUseAsyncFeatures
		disableDuring: [(GtPlaygroundLiveSlide new snippets: {'GtDummyClass new.'}) asElement].
		
	aScripter := BlScripter new.
	aScripter
		substep: 'Initiate Playground'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ playgroundElement ];
			play.
			aStep wait forEmptySpaceTaskQueue;
			play ].

	playgroundElement := aScripter elementWithoutParent.	
	
	aScripter := BlScripter new.
	aScripter
		substep: 'Initiate Default Playground'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ defaultPlaygroundElement];
			play.
			aStep wait forEmptySpaceTaskQueue;
			play ].

	defaultPlaygroundElement := aScripter elementWithoutParent.
	
	adornmentButtonTarget := defaultPlaygroundElement
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextEditorSegmentElement)]
		ifFound: [:aChild | aChild childAt: 2].
		
	adornmentButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #fixItAdornment)
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
GtPlaygroundAndInspectorShow >> fixItAdornmentForClassExplanationText [
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
GtPlaygroundAndInspectorShow >> fixItAdornmentForMethodExplanation [
	"<gtExample>"
	| defaultPlaygroundElement aScripter adornmentButtonTarget |
	defaultPlaygroundElement := BlUseAsyncFeatures
		disableDuring: [ (GtPlaygroundLiveSlide new
				snippets: {'GtDummyExamplesOnInstanceSide new inexistentExampleMethod.'})
				asElement ].
	aScripter := BlScripter new.
	aScripter
		substep: 'Initiate Default Playground'
		do: [ :aStep | 
			aStep set
				label: 'Playground';
				element: [ defaultPlaygroundElement ];
			play.
			aStep wait forEmptySpaceTaskQueue;
			play ].

	defaultPlaygroundElement := aScripter elementWithoutParent.
	defaultPlaygroundElement
		allChildrenBreadthFirstDetect: [ :aChild | aChild isKindOf: BrTextEditorSegmentElement ]
		ifFound: [ :aChild | 
			adornmentButtonTarget := aChild childAt: 7.
			adornmentButtonTarget
				addChild:
					((self yellowExplanationTargetCircleFor: #adornment)
						relocate: 10 @ adornmentButtonTarget extent y / 2) ].			
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c vertical matchParent.
			c horizontal matchParent ];
		margin: (BlInsets all: 5);
		addChild: defaultPlaygroundElement maximized
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> fixItAdornmentForMethodExplanationText [
	| text |
	text := 'The same thing applies to methods as well. If we try to call a method that was not yet implemented, the same ' asRopedText,
('adornment' asRopedText glamorousExplanationFor: #adornment),
' pops up next to it. Clicking on it gives us the option to create the method in the respective class. If we choose that, a method coder opens right in the playground so we can create the method in place.' asRopedText.
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> inspectorInterfaceExplanationSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: self inspectorInterfaceExplanationText;
		element: [ self inspectorInterfaceExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> inspectorInterfaceExplanationText [
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
GtPlaygroundAndInspectorShow >> inspectorInterfaceExplanationWithLinks [
	| inspectorElement headerTarget actionTargets spotterButtonTarget coderButtonTarget viewsTarget rawViewtarget metaViewTarget |
	
	inspectorElement := BlUseAsyncFeatures
		disableDuring: [ (GtABCartoonAddressBookExample new cartoonAddressBook gtViewsFor: GtPhlowView empty) 
			asElementDo: [ :e | e ] ].
	inspectorElement forceLayout.
	
	headerTarget := inspectorElement phlow firstChildWithViewTitle.
	actionTargets := inspectorElement phlow allChildrenWithAction.
	spotterButtonTarget := inspectorElement phlow allChildrenWithAction at: 3.
	coderButtonTarget := inspectorElement phlow allChildrenWithAction at: 1.
	viewsTarget := inspectorElement
		allChildrenBreadthFirstSelect: [:aChild |
			aChild isKindOf: BrTab].
	rawViewtarget := viewsTarget detect: [:aView | aView label asString = 'Raw' asString].
	metaViewTarget := viewsTarget detect: [:aView | aView label asString = 'Meta' asString].
	
	headerTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #header)
				relocate:
					(5 @ headerTarget extent y / 2)). 
	actionTargets do: [:each |
		each addChild:
			((self yellowExplanationTargetCircleFor: #actions)
				relocate:
					(5 @ each extent y / 2))].
	spotterButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #spotterButton)
				relocate:
					(5 @ spotterButtonTarget extent y / 2)).
	coderButtonTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #coderButton)
				relocate:
					(5 @ coderButtonTarget extent y / 2)).
	viewsTarget allButFirstDo: [:each |
		each
			addChild:
				((self yellowExplanationTargetCircleFor: #views)
					relocate:
						(5 @ each extent y / 2))].
	rawViewtarget
		addChild:
			((self yellowExplanationTargetCircleFor: #rawView)
				relocate:
					(5 @ rawViewtarget extent y / 2)).
	metaViewTarget
		addChild:
			((self yellowExplanationTargetCircleFor: #metaView)
				relocate:
					(5 @ metaViewTarget extent y / 2)).
					
	^ BlElement new
		aptitude: BrShadowAptitude;
		background: Color white;
		margin: (BlInsets all: 5);
		addChild: inspectorElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> inspectorMethodExplanationSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 10;
		newTextWithFormat: self inspectorMethodExplanationText;
		element: [ self inspectorMethodExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> inspectorMethodExplanationText [
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
GtPlaygroundAndInspectorShow >> inspectorMethodExplanationWithLinks [
	<gtExample>
	| coderElement inspectorElement coderLabel inspectorLabel |
	
	coderElement := self methodCoderWithExplanationLinks.
	inspectorElement := self inspectorWithExplanationLinks.
	coderLabel := BrLabel new
		text: ('Contacts with details view method' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		aptitude: BrGlamorousLabelAptitude new.
	inspectorLabel := BrLabel new
		text: ('Contacts with details view result' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 0 left: 10);
		aptitude: BrGlamorousLabelAptitude new.
		
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent.
			c padding: (BlInsets all: 5)];
		layout: BlLinearLayout vertical;
		addChildren: {coderLabel. coderElement. inspectorLabel. inspectorElement}.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> inspectorWithExplanationLinks [
	| resultInspectorContainer resultElement resultInspectorTree titleTab avatarLabel nameLabel phoneLabel itemsCollection |
	
	resultInspectorContainer := BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		layout: BlLinearLayout horizontal;
		aptitude: BrShadowAptitude;
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
	resultInspectorTree := resultElement phlow firstChildWithViewTitle.
	
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
			((self yellowExplanationTargetCircleFor: #title:)
				relocate: 10 @ titleTab extent y / 2).
	avatarLabel
		addChild:
			((self yellowExplanationTargetCircleFor: #columns)
				relocate: 5 @ avatarLabel extent y / 2).
	nameLabel
		addChild:
			((self yellowExplanationTargetCircleFor: #columns)
				relocate: 5 @ nameLabel extent y / 2).
	phoneLabel
		addChild:
			((self yellowExplanationTargetCircleFor: #columns)
				relocate: 5 @ phoneLabel extent y / 2).
	itemsCollection
		do: [ :eachRow | 
			eachRow
				addChild:
					((self yellowExplanationTargetCircleFor: #items:)
						relocate: 3 @ eachRow extent y / 2) ].

	^ resultInspectorContainer
		addChild: resultElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> methodCoderWithExplanationLinks [
	<gtExample>
	| selectors coder coderViewModel coderElement |
	
		
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: #(gtView columnedList title: items:).
	selectors addSelector: #column:icon:width: withIdentifier: #columns.
	selectors addSelector: #column:text: withIdentifier: #columns.
	
	coder := GtPharoMethodCoder forMethod: GtABAddressBook >> #gtViewContactsOn:.
	coderViewModel := coder asCoderViewModel.
	coderViewModel addStyler: selectors.
	coderElement := coderViewModel asElement.
	coderElement margin: (BlInsets all: 10).
	coderElement vMatchParent.
	
	^ coderElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> playgroundAndInspectorExplanationText [
	^ 'Playground and inspector are the core tools that enable live exploration. Using the playground you can easily write and run different snippets of code and then visualize their result using the inspector.' asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> playgroundAndInspectorMashExample [
	"<gtExample>"
	^ (GtMashExampleLiveSlide new
		leftElement: 
			(BlElement new
				aptitude: BrShadowAptitude;
				background: Color white;
				addChild: ((GtPlaygroundLiveSlide new 
					snippets: {'42 + 2.'};
					inspectSnippetAt: 1) asElement));
		centerElement:
			(BlElement new
				aptitude: BrShadowAptitude;
				background: Color white;
				addChild: ((GtPlaygroundLiveSlide new
					snippets: {'BlElement new background: Color red.'};
					inspectSnippetAt: 1) asElement));
		rightElement:
			(BlElement new
				aptitude: BrShadowAptitude;
				background: Color white;
				addChild: ((GtABCartoonAddressBookExample new cartoonAddressBook 
					gtViewsFor: GtPhlowView empty) asElement))) asElement.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> playgroundAndInspectorMashExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 5;
		newTextWithFormat: self playgroundAndInspectorExplanationText;
		element: [self playgroundAndInspectorMashExample];
		elementWeight: 0.6.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> playgroundInterfaceExplanationText [
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
GtPlaygroundAndInspectorShow >> slideshowLinkSlideFor: aSlide [
	<gtSlide>
	^ aSlide slideshow
		priority: 11;
		text: 'Want to learn more about custom inspector views? Follow the show below.' asRopedText glamorousRegularFont;
		slideshow: [ GtLiveShow createWithArrowsVisible: GtInspectorViews new ] withTitle: 'GtInspectorViews'.
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> title: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Playground & Inspector' asRopedText
			fontSize: 50;
			bold;
			glamorousRegularFont);
		subtitleWithFormat: ('tool' asRopedText
			fontSize: 40;
			thin;
			glamorousRegularFont).
]

{ #category : #accessing }
GtPlaygroundAndInspectorShow >> yellowExplanationTargetCircleFor: aModel [
	^ BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 0 @ 0;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: aModel).
]
