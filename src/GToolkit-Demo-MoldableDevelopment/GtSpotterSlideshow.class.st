Class {
	#name : #GtSpotterSlideshow,
	#superclass : #Object,
	#traits : 'TGtSlideShow',
	#classTraits : 'TGtSlideShow classTrait',
	#category : #'GToolkit-Demo-MoldableDevelopment-Slideshows'
}

{ #category : #'private - instance creation' }
GtSpotterSlideshow >> newExplainerButton: anExplanationModel position: aPoint [
	^ BrButton new
		constraintsDo: [ :c | c ignoreByLayout ];
		size: 3 @ 3;
		elevation: (BlRelativeElevation elevation: 10);
		geometry: BlCircleGeometry new;
		aptitude: (GtExplainerTargetAptitude new explanationModel: anExplanationModel);
		relocate: aPoint
]

{ #category : #examples }
GtSpotterSlideshow >> spotterAfterFirstDiveInExplanation [
	<gtExample>
	| spotterElement contextTarget |

	spotterElement := self
		spotterElement: (self spotterElementInContextOf: GtABAddressBook withSearch: 'contactsWithAddress')
		withSelectedPosition: 1.
		
	spotterElement := self spotterElementDiveIn: spotterElement.
	
	contextTarget := (spotterElement query // GtSpotterCandidateElementId @ 1 // BrLabel) anyOne.
	contextTarget addChild: (self newExplainerButton: #secondContext position: 0@10).

	^ spotterElement
]

{ #category : #slides }
GtSpotterSlideshow >> spotterAfterFirstDiveInExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 16;
		newTextWithFormat: ( self spotterAfterFirstDiveInExplanationText );
		element: [ self spotterAfterFirstDiveInExplanation ];
		elementWeight: 0.6
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterAfterFirstDiveInExplanationText [
	| text |
	text := 'We chose to further explore the #contactsWithAddress: method, so now we are in the ' asRopedText,
('context' asRopedText glamorousExplanationFor: #secondContext),
' of the respective method. Now let''s say we want to take a look at one of the senders of this method, namely the #gtSpotterForPeopleFor: method.' asRopedText.
	
	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #'private - instance creation' }
GtSpotterSlideshow >> spotterButtonStencil [
	| spotterButton |
	spotterButton := GtHomeToolsSection new newSpotterButtonStencil create.
	^ BlElement new
		layout: BlLinearLayout vertical alignCenter;
		addChild: (spotterButton
			height: 180;
			width: 180).
]

{ #category : #examples }
GtSpotterSlideshow >> spotterDiveInExplanation [
	<gtExample>
	<noTest>
	| spotter arrowTargets contextTarget |
	
	spotter := self spotterElementInContextOf: GtABAddressBook withSearch: 'contacts'.
	
	"arrowTargets := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: GtSpotterCandidateElement)]
		ifFound: [:aChild | aChild childAt: 3].
	contextTarget := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'GtABAddressBook' asString]]
		ifFound: [:aChild | aChild].
	
	contextTarget
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #context);
				relocate:
					(-2 @ contextTarget extent y / 2)).
	arrowTargets 
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #blackArrow);
				relocate:
					(-2 @ arrowTargets extent y / 2))."
	^ spotter.
]

{ #category : #slides }
GtSpotterSlideshow >> spotterDiveInExplanationSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 15;
		newTextWithFormat: (self spotterDiveInExplanationText);
		element: [ self spotterDiveInExplanation ];
		elementWeight: 0.6.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterDiveInExplanationText [
	| text |
	text := 'Another important feature in the spotter is the dive in option. Let''s open a spotter in the same ' asRopedText,
('context' asRopedText glamorousExplanationFor: #context),
' as before and perform a simple search. So now, if we want to explore a result further we can dive in either by clicking the ' asRopedText,
('black arrow' asRopedText glamorousExplanationFor: #blackArrow),
' on the right of the selected result, or by pressing the Command + Right key combination.
There is also a dive out action, similar to a back button. It can be action by pressing the Command + Left key combination.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #'private - scripting' }
GtSpotterSlideshow >> spotterElement: aSpotterElement withSelectedPosition: aNumber [
	| aScripter |
	aScripter := BlScripter new.
	aScripter element: aSpotterElement.

	aScripter
		clickStep: [ :s | 
			s
				id: GtSpotterCandidateElementId index: aNumber ].

	^ aScripter elementWithoutParent
]

{ #category : #'private - scripting' }
GtSpotterSlideshow >> spotterElementDiveIn: aSpotterElement [
	| aScripter |
	
	aScripter := BlScripter new.
	aScripter element: aSpotterElement.
	
	aScripter shortcut
		combination: BlKeyCombination primaryArrowRight;
		play.

	^ aScripter elementWithoutParent
]

{ #category : #'private - scripting' }
GtSpotterSlideshow >> spotterElementInContextOf: anObject withSearch: aSearchString [
	| spotter spotterElement scripter |
	
	spotter := GtSpotter on: anObject.
	spotter steps first searchQuery: aSearchString.
	
	spotterElement := GtStreamingSpotterElement new
		spotter: spotter;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 20).
	
	scripter := BlScripter new.
	scripter element: spotterElement.

	^ scripter elementWithoutParent
]

{ #category : #'private - scripting' }
GtSpotterSlideshow >> spotterElementOn: aSearchString [
	^ self spotterElementInContextOf: GtSpotterStart new withSearch: aSearchString.
]

{ #category : #slides }
GtSpotterSlideshow >> spotterExampleSlide: aSlide [
	"<gtSlide>"
	^ aSlide labelAndElement
		priority: 17;
		newFadedText: ('You can play around with the spotter below to better understand how it works.' asRopedText);
		element: [self spotterButtonStencil].
]

{ #category : #slides }
GtSpotterSlideshow >> spotterInLocalContextExplanationSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 8;
		newTextWithFormat: self spotterInLocalContextExplanationText;
		element: [ self spotterInLocalContextExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterInLocalContextExplanationText [
	| text |
	text := 'To open the spotter in a local context you can simply click on the ' asRopedText,
('search button' asRopedText glamorousExplanationFor: #search),
' inside a coder or an inspector.' asRopedText.

	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #examples }
GtSpotterSlideshow >> spotterInLocalContextExplanationWithLinks [
	<gtExample>
	| coderElement inspectorElement searchButtonTargets coderLabel inspectorLabel |
	
	searchButtonTargets := OrderedCollection new.
	
	coderLabel := BrLabel new
		text: ('Coder example' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 5 left: 5);
		aptitude: BrGlamorousLabelAptitude new.
	inspectorLabel := BrLabel new
		text: ('Inspector example' asRopedText glamorousRegularFont; fontSize: 15; foreground: Color gray);
		margin: (BlInsets top: 20 right: 0 bottom: 5 left: 5);
		aptitude: BrGlamorousLabelAptitude new.
		
	coderElement := BlElement new
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent ];
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild: (GtCoderElement forClass: GtABAddressBook) asElement.
	inspectorElement := BlElement new
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent ];
		background: Color white;
		aptitude: BrShadowAptitude;
		margin: (BlInsets all: 5);
		addChild:(((GtABAddressBookExample new myContactsAddressBook) 
				gtViewsFor: GtPhlowView empty)
					asElementDo: [:e | e]).
	BlScripter new element: inspectorElement; elementWithoutParent.
	
	coderElement 
		allChildrenBreadthFirstDetect: [:aChild | (aChild isKindOf: BrToolbar) and: [ aChild parent isKindOf: GtCoderToolbarElement ] ] 
		ifFound: [:aChild | searchButtonTargets add: (aChild childAt: 1)].
	inspectorElement 
		allChildrenBreadthFirstDetect: [:aChild | (aChild isKindOf: BrToolbar)] 
		ifFound: [:aChild | searchButtonTargets add: (aChild childAt: 3)].
	
	searchButtonTargets do: [:eachTarget |
		eachTarget
			addChild: 
				(BrButton new
					constraintsDo: [ :c | c ignoreByLayout ];
					size: 3 @ 3;
					elevation: (BlRelativeElevation elevation: 10);
					geometry: BlCircleGeometry new;
					aptitude: (GtExplainerTargetAptitude new explanationModel: #search);
					relocate:
						(5 @ 10))].
	
	^ BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent];
		margin: (BlInsets all: 5);
		padding: (BlInsets all: 5);
		addChildren: {coderLabel. coderElement. inspectorLabel. inspectorElement}.
]

{ #category : #examples }
GtSpotterSlideshow >> spotterInLocalContextForCoderExample [
	<gtExample>
	^ (GtCoderElement forClass: GtABAddressBook) createInPager maximized.
]

{ #category : #examples }
GtSpotterSlideshow >> spotterInLocalContextForInspectorExample [
	<gtExample>

	^ (GtInspector createOn: (GtABAddressBookExample new myContactsAddressBook)) maximized
]

{ #category : #slides }
GtSpotterSlideshow >> spotterInLocalContextInCoderExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide labelAndElement
		priority: 9;
		newFadedText: 'Below you can see the spotter opened in a local context inside a coder.' asRopedText;
		element: [ self spotterInLocalContextForCoderExample ];
		onEveryAddToSceneGraphDo:
			[:anElement |
				| spotterElement button |
				spotterElement := anElement childAt: 2.
				spotterElement enqueueTask: (BlTaskAction new
					action: [
						button := spotterElement
							allChildrenBreadthFirstDetect: [:aChild |
								(aChild isKindOf: BrToolbar) and: [aChild parent isKindOf: GtCoderToolbarElement]] 
							ifFound: [:aChild |
								aChild childAt: 2].
						BlSpace simulateClickOn: button.
						BlSpace simulateClickOn: button])].
]

{ #category : #slides }
GtSpotterSlideshow >> spotterInLocalContextInInspectorExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide labelAndElement
		priority: 10;
		newFadedText: 'And here, the spotter is opened in a local context inside the inspector.' asRopedText;
		element: [ self spotterInLocalContextForInspectorExample ];
		onEveryAddToSceneGraphDo:
			[:anElement |
				| inspectorElement button |
				inspectorElement := anElement childAt: 2.
				inspectorElement enqueueTask: (BlTaskAction new
					action: [
						button := inspectorElement
							allChildrenBreadthFirstDetect: [:aChild | 
								(aChild isKindOf: BrToolbar) 
									and: [aChild parent parent parent isKindOf: BrTabGroup]] 
							ifFound: [:aChild | aChild childAt: 3].
							BlSpace simulateClickOn: button.
							BlSpace simulateClickOn: button])].
]

{ #category : #slides }
GtSpotterSlideshow >> spotterInterfaceExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 6;
		newTextWithFormat: self spotterInterfaceExplanationText;
		element: [ self spotterInterfaceExplanationWithLinks ];
		elementWeight: 0.6.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterInterfaceExplanationText [
	| text |
	text := 'Opening the spotter you are presented with the following interface. A ' asRopedText,
('search bar' asRopedText glamorousExplanationFor: #searchBar),
' where you can type your search, a ' asRopedText,
('results' asRopedText glamorousExplanationFor: #results),
' section where the information is sorted in categories. For example, in this case, you can see ' asRopedText,
('classes' asRopedText glamorousExplanationFor: #classes),
' and ' asRopedText,
('methods' asRopedText glamorousExplanationFor: #messages),
' that matched your search. And finally, there is a ' asRopedText,
('preview' asRopedText glamorousExplanationFor: #preview),
' pane where you can see a preview of the result that is currently selected.' asRopedText.
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #examples }
GtSpotterSlideshow >> spotterInterfaceExplanationWithLinks [
	<gtExample>
	| spotterElement searchBarTarget resultsTarget previewTarget classesTarget implementorsTarget |

	spotterElement := self spotterElementOn: 'GtCoder'.
	
	searchBarTarget := (spotterElement query // GtStreamingSpotterHeaderElement) anyOne.
	resultsTarget := (spotterElement query // GtStreamingSpotterPager) anyOne.
	previewTarget := (spotterElement query // GtStreamingSpotterPreviewElement) anyOne.
	
	classesTarget := (spotterElement query
		// GtSpotterCategoryElementId
		@ [ :eachCategoryElement | eachCategoryElement search title = 'Classes' ])
		anyOne.
	
	implementorsTarget := (spotterElement query
		// GtSpotterCategoryElementId
		@ [ :eachCategoryElement | eachCategoryElement search title = 'Implementors' ])
		anyOne.


	searchBarTarget addChild: (self
		newExplainerButton: #searchBar
		position: 5 @ ((searchBarTarget extent y / 2) + 20)).

	resultsTarget addChild: (self
		newExplainerButton: #results
		position: 5@5). 
	
	previewTarget addChild: (self
		newExplainerButton: #preview
		position: 5 @ (previewTarget extent y / 2)).

	classesTarget addChild: (self
		newExplainerButton: #classes
		position: 5 @ (classesTarget extent y / 2)).

	implementorsTarget
		addChild: (self
		newExplainerButton: #messages
		position: 5 @ (implementorsTarget extent y / 2)).

	^ spotterElement.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterLocalContextExplanationText [
	| text |
	text := '' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #slides }
GtSpotterSlideshow >> spotterMashExampleSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 5;
		newTextWithFormat: (
			'Spotter is the moldable search interface. One of its main use cases is navigating through code and the file system.' asRopedText
				glamorousRegularFont; 
				fontSize: 20);
		element: [ self spottersMashExample ];
		elementWeight: 0.6.
]

{ #category : #slides }
GtSpotterSlideshow >> spotterNavigationIntroductionSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide text
		priority: 13;
		newTextWithFormat: (
			'Now let''s take a look at how we navigate through spotter.' asRopedText
				glamorousRegularFont;
				fontSize: 20).
]

{ #category : #slides }
GtSpotterSlideshow >> spotterOpeningExplanationSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: self spotterOpeningExplanationText;
		element: [ self spotterElementOn: '' ];
		elementWeight: 0.6.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterOpeningExplanationText [
	^ 'A search always happens in the context of an object. The default spotter opens in a default context. To open it you can either click the search button in the top right corner of the GT window or you can press the key combination Shift + Return.' asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #examples }
GtSpotterSlideshow >> spotterProcessorsExample [
	<gtExample>
	| inspector scripter  |

	inspector := GtInspector
		createOn: (GtSpotter on: GtWorldSpotterSearchStart new).

	scripter := BlScripter new.
	scripter element: inspector.
	scripter doubleClick
		// GtPhlowCellElement;
		@ 1;
		play.

	^ scripter elementWithoutParent maximized.
]

{ #category : #slides }
GtSpotterSlideshow >> spotterProcessorsExplanationSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: self spotterProcessorsExplanationText;
		element: [self spotterProcessorsExample];
		elementWeight: 0.6.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterProcessorsExplanationText [
	| text |
	text := 'A spotter search query is executed through a search. Each search has a name and is presented as a category in the actual results. So a search can yield results in multiple categories. Here you can see the searches in the default context.' asRopedText.
	
	^ text 
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #examples }
GtSpotterSlideshow >> spotterSearchFilterExplanation [
	<gtExample>
	<noTest>
	| spotter keywordTarget filterTarget contextTarget |
	spotter := self spotterElementInContextOf: GtABAddressBook withSearch: 'contacts'.
	
	keywordTarget := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString includesSubstring: 'contacts' ]]
		ifFound: [:aChild | aChild]. 
	filterTarget := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString includesSubstring: '#instancemethods' ]]
		ifFound: [:aChild | aChild].
	contextTarget := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'GtABAddressBook' asString]]
		ifFound: [:aChild | aChild].
	
	keywordTarget
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #keyword);
				relocate:
					(-2 @ keywordTarget extent y / 2)).
	filterTarget
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #filter);
				relocate:
					(-2 @ filterTarget extent y / 2)).
	contextTarget
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircleGeometry new;
				aptitude: (GtExplainerTargetAptitude new explanationModel: #context);
				relocate:
					(-2 @ contextTarget extent y / 2)).
	^ spotter.
]

{ #category : #slides }
GtSpotterSlideshow >> spotterSearchFilterExplanationSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 14;
		newTextWithFormat: (self spotterSearchFilterExplanationText);
		element: [ self spotterSearchFilterExplanation ];
		elementWeight: 0.6.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterSearchFilterExplanationText [
	| text |
	text := 'A first thing to look at is the filtering of the results. You can choose to only see the results from a certain category thus fitting more results from that category on the screen. For example, here, we are in the context of ' asRopedText,
('GtABAddressBook' asRopedText glamorousExplanationFor: #context),
' and we search using the ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #keyword),
' keyword, but we also filter the results to only display those that are ' asRopedText,
('instance methods' asRopedText glamorousExplanationFor: #filter),
'.' asRopedText.

	^ text asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #examples }
GtSpotterSlideshow >> spotterSearchMethodExample [
	<gtExample>
	| selectors coder coderViewModel coderElement |
	
	selectors := GtSelectorExplanationLinkStyler new.
	selectors addSelectors: #(allClassesAndTraits priority: title: filter: keyBinding:).
	selectors addSelector: #gtSearch withIdentifier: #annotation.
	selectors addSelector: #wantsToDisplayOnEmptyQuery: withIdentifier: #display.

	coder := GtPharoMethodCoder forMethod: GtSpotterStart>>#gtSearchForClassesFor:.
	coderViewModel := coder asCoderViewModel.
	coderViewModel addStyler: selectors.
	coderElement := coderViewModel asElement.
	coderElement margin: (BlInsets all: 10).
	coderElement vMatchParent.
	
	^ coderElement.
]

{ #category : #slides }
GtSpotterSlideshow >> spotterSearchMethodExplanationSlideFor: aSlide [
	"<gtSlide>"
	^ aSlide textAndElement
		priority: 12;
		newTextWithFormat: self spotterSearchMethodExplanationText;
		element: [self spotterSearchMethodExample];
		elementWeight: 0.6.
]

{ #category : #descriptions }
GtSpotterSlideshow >> spotterSearchMethodExplanationText [
	| text |
	text := 'Implementing a Spotter search is similar to implementing an inspector view. It is a method ' asRopedText,
('annotated' asRopedText glamorousExplanationFor: #annotation),
' with the specific pragma and implemented in the class of the object in the context of which we want to perform a search.

For example, the global, default, spotter is an instance of GtSpotterStart, which has the following method responsible for searching ' asRopedText,
('classes and traits' asRopedText glamorousExplanationFor: #allClassesAndTraits),
' in the image.

The ' asRopedText,
('priority' asRopedText glamorousExplanationFor: #priority:),
' is the order of the categories and the ' asRopedText,
('title' asRopedText glamorousExplanationFor: #title:),
' represents the name of the categories in the result section. We also mention the ' asRopedText,
('filter' asRopedText glamorousExplanationFor: #filter:),
' used in the search, the ' asRopedText,
('key binding' asRopedText glamorousExplanationFor: #keyBinding:),
' for the keyboard shortcut to open the spotter on a particular object, and if the category ' asRopedText,
('displays' asRopedText glamorousExplanationFor: #display),
' for an empty query.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #examples }
GtSpotterSlideshow >> spottersMashExample [
	<gtExample>
	^ (GtMashExampleLiveSlide new
		leftElement: (self spotterElementOn: 'GtSpotter');
		centerElement: (self spotterElementOn: 'size:');
		rightElement: (self spotterElementOn: 'Playground')) asElement.
]

{ #category : #slides }
GtSpotterSlideshow >> title: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Spotter' asRopedText
			fontSize: 50;
			bold;
			glamorousRegularFont);
		subtitleWithFormat: ('tool' asRopedText
			fontSize: 40;
			thin;
			glamorousRegularFont).
]
