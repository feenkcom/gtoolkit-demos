"
I am an abstract parent of classes  with a collection of web links, namely Pillar WebLinkGroupand PillarWebsite.
"
Class {
	#name : #APillarWebLinkGroup,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'process'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #announcements }
APillarWebLinkGroup >> announcer [
	^ announcer
]

{ #category : #announcements }
APillarWebLinkGroup >> announcer: anAnnouncement [
	announcer := anAnnouncement
]

{ #category : #links }
APillarWebLinkGroup >> brokenLinks [
	^ self links select: #isBroken
]

{ #category : #links }
APillarWebLinkGroup >> checkStatusWhereMissing [
	process
		ifNotNil: [ process isTerminated
				ifFalse: [ ^ self inform: 'There is already a background check running.' ] ].
	self missingStatusLinks
		ifEmpty: [ self inform: 'Nothing to do' ]
		ifNotEmpty: [ self inform: 'Starting background checks'.
			process := [ self missingStatusLinks do: [ :aWebsite | aWebsite checkStatus ] ]
					fork ]
]

{ #category : #action }
APillarWebLinkGroup >> gtActionCheckStatusFor: anAction [
	<gtAction>
	self missingStatusLinks ifEmpty: [ ^ anAction noAction ].
	^ anAction button
		tooltip: 'Check status';
		priority: 10;
		icon: BrGlamorousIcons accept;
		action: [ self checkStatusWhereMissing ]
]

{ #category : #action }
APillarWebLinkGroup >> gtActionStopCheckStatusFor: anAction [
	<gtAction>
	self missingStatusLinks ifEmpty: [ ^ anAction noAction ].
	^ anAction button
		tooltip: 'Stop background status check';
		priority: 11;
		icon: BrGlamorousIcons close;
		action: [ self killBackgroundCheck ]
]

{ #category : #view }
APillarWebLinkGroup >> gtBrokenLinksFor: aView [
	<gtView>
	self brokenLinks ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'Broken HTTP links';
		priority: 50;
		items: [ self brokenLinks ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages' text: [ :item | item pages size ] width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton;
		updateWhen: PillarWebLinkStatusUpdated in: self announcer;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (PillarWebLinkGroup withAll: self missingLinks) ];
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
APillarWebLinkGroup >> gtHttpLinksFor: aView [
	<gtView>
	self httpLinks ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'HTTP links';
		priority: 40;
		items: [ self httpLinks ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (PillarWebLinkGroup withAll: self httpLinks) ];
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
APillarWebLinkGroup >> gtLinksFor: aView [
	<gtView>
	self links ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'Links';
		priority: 30;
		items: [ self links ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Link'
			text: [ :item | item path ]
			width: 300;
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (PillarWebLinkGroup withAll: self links) ];
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
APillarWebLinkGroup >> gtMissingLinksFor: aView [
	<gtView>
	self missingLinks ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'Missing links';
		priority: 35;
		items: [ self missingLinks ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Link'
			text: [ :item | item path ]
			width: 300;
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status'
			text: [ :item | item status ]
			width: 100;
		actionUpdateButton;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (PillarWebLinkGroup withAll: self missingLinks) ];
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
APillarWebLinkGroup >> gtMissingStatusLinksFor: aView [
	<gtView>
	self missingStatusLinks ifEmpty: [ ^ aView empty ].
	^ aView columnedList
		title: 'Missing status';
		priority: 55;
		items: [ self missingStatusLinks ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton;
		updateWhen: PillarWebLinkStatusUpdated in: self announcer;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (PillarWebLinkGroup withAll: self missingLinks) ];
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #accessing }
APillarWebLinkGroup >> gtSpotterForLinkNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Link names';
		priority: 30;
		items: [ self links ];
		itemsLimit: Float infinity;
		itemName: #path;
		sendCategory: [ :aCategory :aStep :thisSearch | PillarWebLinkGroup withAll: aCategory items contents ];
		filterBySubstring
]

{ #category : #links }
APillarWebLinkGroup >> httpLinks [
	^  self links select: #isHttp
]

{ #category : #initialization }
APillarWebLinkGroup >> initialize [
	super initialize.
	self announcer: Announcer new 
]

{ #category : #links }
APillarWebLinkGroup >> killBackgroundCheck [
	process
		ifNil: [ self inform: 'Nothing to do' ]
		ifNotNil: [ process terminate.
			process := nil.
			self inform: 'Background check terminated' ]
]

{ #category : #abstract }
APillarWebLinkGroup >> links [
	self subclassResponsibility
]

{ #category : #links }
APillarWebLinkGroup >> missingLinks [
	((self links select: #isInternal) select: #statusMissing) do: #checkStatus.
	^ self links select: [ :link | link isInternal and: [ link isMissing ] ]
]

{ #category : #links }
APillarWebLinkGroup >> missingStatusLinks [
	^ self links select: #statusMissing
]
