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
			(GtTextAndElementSlide new
				newTextWithFormat: self spotterLocalContextExplanationText;
				element: [ self localSpotterExplanationWithLinks ];
				elementWeight: 0.6)
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
GtSpotterSlideshow >> spotterElementOn: aSearchString [
	| spotterElement aScripter |
	
	spotterElement := GtSpotterElement new
		"size: 800@600;"
		look: BrShadowLook;
		margin: (BlInsets all: 20).
	spotterElement spotterModel: (GtSpotter new search: aSearchString).
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
GtSpotterSlideshow >> spotterInterfaceExplanationText [
	| text |
	text := 'Opening the spotter you are presented with the following interface. A ' asRopedText,
('search bar' asRopedText glamorousExplanationFor: #searchBar),
' where you can type the string you want to search for, a ' asRopedText,
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
		self spotterElementOn: 'GtSpotter' ].
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
				relocate: (resultsTarget extent x / 2) @ 5). 
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
				look: (GtExplainerTargetLook new explanationModel: #classes);
				relocate:
					(5 @ implementorsTarget extent y / 2)).
	sendersTarget
		addChild:
			(BrButton new
				constraintsDo: [ :c | c ignoreByLayout ];
				size: 3 @ 3;
				elevation: (BlRelativeElevation elevation: 10);
				geometry: BlCircle new;
				look: (GtExplainerTargetLook new explanationModel: #classes);
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
	^ 'To open the spotter in a global context you can either click on the search button in the top right corner of the GT window or you can press the key combination Shift + Return. Thus you get presented with the following interface.' asRopedText
		glamorousRegularFont;
		fontSize: 20.
]

{ #category : #accessing }
GtSpotterSlideshow >> spottersMashExample [
	| container |
	container := BlElement new
		constraintsDo: [ :c | 
			c horizontal exact: 1200. 
			c vertical exact: 800. ];
		layout: BlFrameLayout new.
	container addChild: ((self spotterElementOn: 'GtSpotter')
		constraintsDo: [ :c | 
				c frame horizontal alignLeft. 
				c frame vertical alignTop.
				c horizontal exact: 600.
				c vertical exact: 400 ];
		margin: (BlInsets top: 100 right: 10 bottom: 10 left: 10)).
	container addChild: ((self spotterElementOn: 'size:')
		constraintsDo: [ :c | 
				c frame horizontal alignCenter. 
				c frame vertical alignBottom.
				c horizontal exact: 600.
				c vertical exact: 400 ];
		margin: (BlInsets all: 10)).
	container addChild: ((self spotterElementOn: 'Playground')
		constraintsDo: [ :c | 
				c frame horizontal alignRight. 
				c frame vertical alignTop.
				c horizontal exact: 600.
				c vertical exact: 400 ];
		margin: (BlInsets all: 10)).
	
	^ container asScalableElement.
]
