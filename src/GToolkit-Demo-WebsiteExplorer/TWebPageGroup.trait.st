"
I provide spotter searchers for classes that hold a collection of web pages.
"
Trait {
	#name : #TWebPageGroup,
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #requirement }
TWebPageGroup >> contentAvailable [
	^ self explicitRequirement
]

{ #category : #view }
TWebPageGroup >> gtPagesFor: aView [
	<gtView>
	self contentAvailable ifFalse: [ ^ aView empty ].
	^ aView columnedList
		title: 'Pages';
		priority: 10;
		items: [ self pages ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Title'
			text: [ :item | item title ]
			width: 150;
		column: 'Path'
			text: [ :item | item path ]
			width: 300;
		column: 'Links'
			text: [ :item | 
				| size |
				size := item links size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: self pages ]
]

{ #category : #view }
TWebPageGroup >> gtReachablePagesFor: aView [
	"<gtView>"
	self contentAvailable ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Reachable pages';
		priority: 60;
		object: [ self reachable ];
		view: #gtPagesFor:
]

{ #category : #searching }
TWebPageGroup >> gtSpotterForPageContents: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page content';
		priority: 20;
		items: [ self pages items ];
		itemsLimit: Float infinity;
		itemName: #contents;
		sendCategory: [ :aCategory :aStep :thisSearch | self webPageGroupClass withAll: aCategory items contents ];
		filterBySubstring
]

{ #category : #searching }
TWebPageGroup >> gtSpotterForPageNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page names';
		priority: 10;
		items: [ self pages items ];
		itemsLimit: Float infinity;
		itemName: #path;
		sendCategory: [ :aCategory :aStep :thisSearch | self webPageGroupClass withAll: aCategory items contents ];
		filterBySubstring
]

{ #category : #view }
TWebPageGroup >> gtUnreachablePagesFor: aView [
	"<gtView>"
	self contentAvailable ifFalse: [ ^ aView empty ].
	self unreachable ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Unreachable pages';
		priority: 61;
		object: [ self unreachable ];
		view: #gtPagesFor:
]

{ #category : #requirement }
TWebPageGroup >> pages [
	^ self explicitRequirement
]

{ #category : #requirement }
TWebPageGroup >> reachable [
	^ self explicitRequirement
]

{ #category : #requirement }
TWebPageGroup >> unreachable [
	^ self explicitRequirement
]

{ #category : #constant }
TWebPageGroup >> webPageGroupClass [
	"Which class should be used to instantiate groups of web pages."

	^ PillarWebPageGroup
]
