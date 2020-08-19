Class {
	#name : #GtSpotterSlideshow,
	#superclass : #BrStencil,
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #accessing }
GtSpotterSlideshow >> create [
	| slideshow |
	slideshow := GtSlideShow new.
	slideshow
		slides:
			{(GtTitleSlide new
				titleText: ('Spotter' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
			(GtTextAndElementSlide new
				newTextWithFormat: ('Spotter is the moldable search interface. One of its main use cases is navigating through code and the file system.' asRopedText glamorousRegularFont; fontSize: 20);
				element: [ self spottersMashExample ];
				elementWeight: 0.6).
			(GtTextAndElementSlide new
				newTextWithFormat: self spotterInterfaceExplanationText;
				element: [ self spotterInterfaceExplanationWithLinks ];
				elementWeight: 0.6).
			(GtTextAndElementSlide new
				newTextWithFormat: self spotterOpeningExplanationText;
				element: [ self spotterElementOn: '' ];
				elementWeight: 0.6).
			(GtLabelAndElementSlide new
				newFadedText: 'Below you can see a search in the context of GtABAddressBook class.' asRopedText;
				element: [self spotterElementInContextOf: (GtABAddressBook) withSearch: 'contacts:']).
			(GtLabelAndElementSlide new
				newFadedText: 'And here is a spotter opened in the context of an instance of GtABAddressBook.' asRopedText;
				element: [self spotterElementInContextOf: (GtABAddressBookExample new myContactsAddressBook) withSearch: '']).
			(GtTextAndElementSlide new
				newTextWithFormat: self spotterProcessorsExplanationText;
				element: [self spotterProcessorsExample];
				elementWeight: 0.6).
			(GtLabelAndElementSlide new
				newFadedText: 'For example you can even search for icons.' asRopedText;
				element: [self spotterElementOn: 'play #icon']).
			(GtTextAndElementSlide new
				newTextWithFormat: self spotterSearchMethodExplanationText;
				element: [self spotterSearchMethodExample];
				elementWeight: 0.6).
			(GtTextSlide new
				newTextWithFormat: ('Now let''s take a look at how we navigate through spotter.' asRopedText
					glamorousRegularFont;
					fontSize: 20)).
			(GtLabelAndElementSlide new
				newFadedText: ('Let''s start by opening a spotter in the context of GtABAddressBook class and search by contacts.' asRopedText);
				element: [self spotterElementInContextOf: GtABAddressBook withSearch: 'contacts']).
			(GtTextAndElementSlide new
				newTextWithFormat: (self spotterDiveInExplanationText);
				element: [ self spotterDiveInExplanation ]).
			(GtLabelAndElementSlide new
				newFadedText: ('Now we are in the context of the respective method.' asRopedText);
				element: [self spotterElementInContextOf: GtABAddressBook>>#allContacts withSearch: '']).
			(GtLabelAndElementSlide new
				newFadedText: ('Next, we can filter to only see the senders of the method in whose context we are in.' asRopedText);
				newFadedText: ('So now we can dive in further into the context of GtABCategory>>#allContacts.' asRopedText);
				element: [self selectResultForSendersFilter]).
			(GtLabelAndElementSlide new
				newFadedText: ('Now we are in the context of the respective method.' asRopedText);
				element: [self spotterElementInContextOf: GtABCategory>>#allContacts withSearch: '']).
			(GtLabelAndElementSlide new
				newFadedText: ('Here we can filter to see the class of this method, namely GtABCategory.' asRopedText);
				element: [self spotterElementInContextOf: GtABCategory>>#allContacts withSearch: '#class']).
			(GtLabelAndElementSlide new
				newFadedText: ('Diving into the context of that class now we can perform searches related to it.' asRopedText);
				element: [self spotterElementInContextOf: GtABCategory withSearch: '']).
			(GtTextSlide new
				newTextWithFormat: ('As you can see, by searching, filtering and diving in we can easily navigate through various parts of the system.' asRopedText
					glamorousRegularFont;
					fontSize: 20)).
			"(GtTextAndElementSlide new
				newTextWithFormat: self spotterLocalContextExplanationText;
				element: [ self localSpotterExplanationWithLinks ];
				elementWeight: 0.6)"
			}.
	^ slideshow.
]

{ #category : #accessing }
GtSpotterSlideshow >> localSpotterExplanationWithLinks [
	| container coderSpotterElement inspectorSpotterElement aScript |
	
	container := BlElement new
		layout: BlLinearLayout new;
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		margin: (BlInsets all: 10).
	
	coderSpotterElement := nil.
	^ BlElement new.
]

{ #category : #accessing }
GtSpotterSlideshow >> selectResultForSendersFilter [
	| spotter aScripter |
	
	spotter := self spotterElementInContextOf: GtABAddressBook>>#allContacts withSearch: '#senders'.
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Add Spotter Element'
		do: [ :aStep | 
			aStep set
				label: 'Spotter';
				element: [ spotter ] ].
	aScripter
		substep: 'Wait'
		do: [ :aStep | 
			aStep wait forEmptySpaceTaskQueue ].
	aScripter
		substep: 'click spotter result'
		do: [ :aStep | 
			aStep click
				label: 'Click on spotter result';
				onBreadthFirstChildOfClass: BrPager;
				onBreadthFirstChildOfClass: GtSpotterPager;
				onBreadthFirstChildOfClass: BrInfiniteTreeElement;
				onChildAt: 6.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	
	^ aScripter elementWithoutParent.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterDiveInExplanation [
	| spotter keywordTarget filterTarget selectedResultTarget arrowTargets aScripter |
	spotter := self spotterElementInContextOf: GtABAddressBook withSearch: 'contacts #instancemethods'.
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Add Spotter Element'
		do: [ :aStep | 
			aStep set
				label: 'Spotter';
				element: [ spotter ] ].
	aScripter
		substep: 'Wait'
		do: [ :aStep | 
			aStep wait forEmptySpaceTaskQueue ].
	aScripter
		substep: 'click spotter result'
		do: [ :aStep | 
			aStep click
				label: 'Click on spotter result';
				onBreadthFirstChildOfClass: BrPager;
				onBreadthFirstChildOfClass: GtSpotterPager;
				onBreadthFirstChildOfClass: BrInfiniteTreeElement;
				onChildAt: 6.
			aStep wait forEmptySpaceTaskQueue ].
	aScripter syncContinue.
	spotter := BlUseAsyncFeatures disableDuring: [ aScripter elementWithoutParent ].
	spotter forceLayout.
	
	keywordTarget := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = 'contacts' asString]]
		ifFound: [:aChild | aChild]. 
	filterTarget := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BrTextElementWithCursors) and: [aChild text asString = '#instancemethods' asString]]
		ifFound: [:aChild | aChild].
	selectedResultTarget := spotter
		allChildrenBreadthFirstDetect: [:aChild |
			(aChild isKindOf: BlTextElement) and: [aChild text asString = 'allContacts' asString]]
		ifFound: [:aChild | aChild].
	arrowTargets := spotter
		allChildrenBreadthFirstSelect: [:aChild |
			(aChild isKindOf: BrButton) and: [aChild parent isKindOf: GtSpotterCandidateElement]].
	
	keywordTarget
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #keyword);
				relocate:
					(-2 @ keywordTarget extent y / 2)).
	filterTarget
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #instanceMethodsFilter);
				relocate:
					(-2 @ filterTarget extent y / 2)).
	selectedResultTarget
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #allContacts);
				relocate:
					(-2 @ selectedResultTarget extent y / 2)).
	(arrowTargets at: 10)
		addChild: (BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #blackArrow);
				relocate:
					(-2 @ (arrowTargets at: 10) extent y / 2)).
	^ spotter.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterDiveInExplanationText [
	| text |
	text := 'When seraching, we can filter the results by different categories. For example, here, we wanted to see only the ' asRopedText,
('instance side methods' asRopedText glamorousExplanationFor: #instanceMethodsFilter),
' that contain the keyword ' asRopedText,
('contacts' asRopedText glamorousExplanationFor: #keyword),
'.
Now we can select the result we want, for example the ' asRopedText,
('allContacts' asRopedText glamorousExplanationFor: #allContacts),
' method, and we can dive in the context of the selected result. We do that either by clicking the ' asRopedText,
('black arrow' asRopedText glamorousExplanationFor: #blackArrow),
' next to the result or by pressing the Command + Right key combination.
You can also dive out by pressing Command + Left key combination.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterElementInContextOf: anObject withSearch: aSearchString [
	| spotterElement aScripter |
	
	spotterElement := GtSpotterElement new
		look: BrShadowLook;
		margin: (BlInsets all: 20).
	spotterElement spotterModel: ((GtSpotter on: anObject) search: aSearchString).
	spotterElement searchField requestFocus.

	aScripter := BlDevScripter new.
		aScripter
			substep: 'Initial Spotter'
			do: [ :aStep | 
				aStep set
					label: 'Spotter';
					element: [ spotterElement ] ].
		aScripter
			substep: 'Typing'
			do: [ :aStep | 
				aStep type: aSearchString.
				aStep wait forEmptySpaceTaskQueue ].
		aScripter syncContinue.
	^ aScripter elementWithoutParent.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterElementOn: aSearchString [
	^ self spotterElementInContextOf: (GtSpotterStart new) withSearch: aSearchString.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterInterfaceExplanationText [
	| text |
	text := 'Opening the spotter you are presented with the following interface. A ' asRopedText,
('search bar' asRopedText glamorousExplanationFor: #searchBar),
' where you can type your search, a ' asRopedText,
('results' asRopedText glamorousExplanationFor: #results),
' section where you can find ' asRopedText,
('classes' asRopedText glamorousExplanationFor: #classes),
' and ' asRopedText,
('methods' asRopedText glamorousExplanationFor: #messages),
' that match your search and a ' asRopedText,
('preview' asRopedText glamorousExplanationFor: #preview),
' pane where you can see a preview of the result that is currently selected.' asRopedText.
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterInterfaceExplanationWithLinks [
	| spotterElement searchBarTarget resultsTarget previewTarget classesTarget implementorsTarget sendersTarget messagesTarget|
	spotterElement := BlUseAsyncFeatures disableDuring: [
		self spotterElementOn: 'GtCoder' ].
	spotterElement forceLayout.
	
	searchBarTarget := spotterElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BrTextEditorSegmentElement)]
		ifFound: [:aChild | aChild].
	resultsTarget := spotterElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: GtSpotterPager)]
		ifFound: [:aChild | aChild].
	previewTarget := spotterElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild parent parent isKindOf: GtSpotterPreviewElement]]
		ifFound: [:aChild | aChild].
	classesTarget := spotterElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild text asString = '#Classes' asString]]
		ifFound: [:aChild | aChild].
	implementorsTarget := spotterElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild text asString = '#Implementors' asString]]
		ifFound: [:aChild | aChild].
	sendersTarget := spotterElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild text asString = '#Senders' asString]]
		ifFound: [:aChild | aChild].
	messagesTarget := spotterElement
		allChildrenBreadthFirstDetect: [:aChild | 
			(aChild isKindOf: BlTextElement) and: [aChild text asString = '#Messages' asString]]
		ifFound: [:aChild | aChild].
	
	searchBarTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #searchBar);
				relocate:
					(-2 @ searchBarTarget extent y / 2)).
	resultsTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #results);
				relocate: 5 @ 5). 
	previewTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #preview);
				relocate:
					(5 @ previewTarget extent y / 2)).
	classesTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #classes);
				relocate:
					(5 @ classesTarget extent y / 2)).
	implementorsTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #messages);
				relocate:
					(5 @ implementorsTarget extent y / 2)).
	sendersTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #messages);
				relocate:
					(5 @ sendersTarget extent y / 2)).
	messagesTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #messages);
				relocate:
					(5 @ messagesTarget extent y / 2)).
	^ spotterElement.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterLocalContextExplanationText [
	| text |
	text := '' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterOpeningExplanationText [
	^ 'A search always happens in the context of an object. The default spotter opens in a default context. To open it you can either click the search button in the top right corner of the GT window or you can press the key combination Shift + Return.' asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterProcessorsExample [
	"^ (GtSpotterStepExamples new defaultStep gtProcessorsFor: GtPhlowView empty) asElementDo: [:e | e]."
	^ BlElement new
		layout: BlLinearLayout vertical alignCenter;
		constraintsDo: [:c |
			c vertical matchParent.
			c horizontal matchParent];
		background: Color white;
		look: BrShadowLook;
		margin: (BlInsets all: 10);
		addChild: (
			(GtSpotterStepExamples new defaultStep
				gtProcessorsFor: GtPhlowView empty)
					asElementDo: [:e | e]).
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterProcessorsExplanationText [
	| text |
	text := 'A search is executed through a processor. Each processor has a name and is presented as a category in the actual results. So a search can yield results in multiple categories. Here you can see the processors in the default context.' asRopedText.
	
	^ text 
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtSpotterSlideshow >> spotterSearchMethodExample [
	| coder coderElement selectors |
	coder := GtMethodCoder forMethod: GtSpotterStart>>#gtSpotterForClassesFor:.
	
	selectors := GtSelectorExplanationLinkStyler new coder: coder.
	selectors
		addSelectors:
			{#allClassesAndTraits}.
	selectors addSelector: #gtSearch withIdentifier: #annotation.
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
GtSpotterSlideshow >> spotterSearchMethodExplanationText [
	| text |
	text := 'Implementing a Spotter search is similar to implementing an inspector view. It is a method ' asRopedText,
('annotated' asRopedText glamorousExplanationFor: #annotation),
' with the specific pragma and implemented in the class of the object in the context of which we want to perform a search.

For example, the global, default, spotter is an instance of GtSpotterStart, which has the following method responsible for searching ' asRopedText,
('classes and traits' asRopedText glamorousExplanationFor: #allClassesAndTraits),
' in the image.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtSpotterSlideshow >> spottersMashExample [
	^ (GtMashExampleSlide new
		leftElement: (self spotterElementOn: 'GtSpotter');
		centerElement: (self spotterElementOn: 'size:');
		rightElement: (self spotterElementOn: 'Playground')) asElement.
]
