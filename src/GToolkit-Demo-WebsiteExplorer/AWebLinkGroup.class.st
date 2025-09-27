"
I am an abstract parent of classes  holding a collection of web links.

Subclasses should implement `links`, returning `WebLink` instances.

I offer a number of views, and actions to start or stop a process to check the status of links whose status is missing.

"
Class {
	#name : #AWebLinkGroup,
	#superclass : #Object,
	#instVars : [
		'announcer',
		'process'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #announcements }
AWebLinkGroup >> announcer [
	^ announcer
]

{ #category : #announcements }
AWebLinkGroup >> announcer: anAnnouncement [
	announcer := anAnnouncement
]

{ #category : #view }
AWebLinkGroup >> basicOverview [
	"Fallback in case the content is not yet available."

	^ self gtOverview
]

{ #category : #links }
AWebLinkGroup >> brokenLinks [
	^ self links select: #isBroken
]

{ #category : #links }
AWebLinkGroup >> checkStatusWhereMissing [
	process
		ifNotNil: [ process isTerminated
				ifFalse: [ ^ self inform: 'There is already a background check running.' ] ].
	self missingStatusLinks
		ifEmpty: [ self inform: 'Nothing to do' ]
		ifNotEmpty: [ process := [ UIManager default
					informUser: 'Running HTTP checks'
					during: [ self missingStatusLinks do: [ :aWebsite | aWebsite checkStatus ] ] ]
					fork ]
]

{ #category : #testing }
AWebLinkGroup >> contentAvailable [
	^ self subclassResponsibility
]

{ #category : #view }
AWebLinkGroup >> contentUnavailableOverview [
	"Fallback in case the content is not yet available."

	^ self gtOverview
]

{ #category : #action }
AWebLinkGroup >> gtActionCheckStatusFor: anAction [
	<gtAction>
	self contentAvailable ifFalse: [ ^ anAction noAction ].
	self missingStatusLinks ifEmpty: [ ^ anAction noAction ].
	^ anAction button
		tooltip: 'Check status';
		priority: 10;
		icon: BrGlamorousVectorIcons accept;
		action: [ self checkStatusWhereMissing ]
]

{ #category : #action }
AWebLinkGroup >> gtActionStopCheckStatusFor: anAction [
	<gtAction>
	self contentAvailable ifFalse: [ ^ anAction noAction ].
	self missingStatusLinks ifEmpty: [ ^ anAction noAction ].
	^ anAction button
		tooltip: 'Stop background status check';
		priority: 11;
		icon: BrGlamorousVectorIcons close;
		action: [ self killBackgroundCheck ]
]

{ #category : #view }
AWebLinkGroup >> gtBrokenLinksFor: aView [
	"<gtView>"
	self contentAvailable ifFalse: [ ^ aView empty ].
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
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton;
		updateWhen: WebLinkStatusUpdated in: self announcer;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: self missingLinks ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtHttpLinksFor: aView [
	"<gtView>"
	self contentAvailable ifFalse: [ ^ aView empty ].
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
			action: [ :aButton :aTab | aButton phlow spawnObject: self httpLinks ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtLinksFor: aView [
	<gtView>
	self contentAvailable ifFalse: [ ^ aView empty ].
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
			action: [ :aButton :aTab | aButton phlow spawnObject: self links ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtMissingLinksFor: aView [
	"<gtView>"
	self contentAvailable ifFalse: [ ^ aView empty ].
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
			action: [ :aButton :aTab | aButton phlow spawnObject: self missingLinks ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtMissingStatusLinksFor: aView [
	"<gtView>"
	self contentAvailable ifFalse: [ ^ aView empty ].
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
		updateWhen: WebLinkStatusUpdated in: self announcer;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: self missingLinks ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtOverview [
	"This is the list of values to show in the overview.
	NB: An (ordered) Association list, not a Dictionary."

	^ {{'# Links'.
			self links size.
			[ self links ]}.
		{'# External (HTTP) links'.
			self httpLinks size.
			[ self httpLinks ]}.
		{'# Internal links'.
			self internalLinks size.
			[ self internalLinks ]}.
		{'# Email links'.
			(self links select: #isEmail) size.
			[ self links select: #isEmail ]}.
		{'# Missing links'.
			self missingLinks size.
			[ self missingLinks ]}.
		{'# Broken links'.
			self brokenLinks size.
			[ self brokenLinks ]}.
		{'# Missing status'.
			self missingStatusLinks size.
			[ self missingStatusLinks ]}}
]

{ #category : #view }
AWebLinkGroup >> gtOverviewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Overview';
		priority: 5;
		items: [ self contentAvailable
				ifTrue: [ self gtOverview ]
				ifFalse: [ self contentUnavailableOverview ] ];
		column: 'Attribute'
			text: [ :item | item first ]
			width: 200;
		column: 'Value'
			text: [ :item | item second ]
			width: 400;
		send: [ :item | "(self overviewSend at: item key)"item last onErrorDo: [ '?' ] ];
		actionUpdateButton;
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #accessing }
AWebLinkGroup >> gtSpotterForLinkNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Link names';
		priority: 30;
		items: [ self links items ];
		itemsLimit: Float infinity;
		itemName: #path;
		sendCategory: [ :aCategory :aStep :thisSearch | aCategory items contents asWebLinkGroup ];
		filterBySubstring
]

{ #category : #links }
AWebLinkGroup >> httpLinks [
	^  self links select: #isHttp
]

{ #category : #initialization }
AWebLinkGroup >> initialize [
	super initialize.
	self announcer: Announcer new 
]

{ #category : #links }
AWebLinkGroup >> internalLinks [
	^ self links select: #isInternal
]

{ #category : #links }
AWebLinkGroup >> killBackgroundCheck [
	process
		ifNil: [ self inform: 'Nothing to do' ]
		ifNotNil: [ process terminate.
			process := nil ]
]

{ #category : #abstract }
AWebLinkGroup >> links [
	self subclassResponsibility
]

{ #category : #links }
AWebLinkGroup >> missingLinks [
	((self links select: #isInternal) select: #statusMissing) do: #checkStatus.
	^ self links select: [ :link | link isInternal and: [ link isMissing ] ]
]

{ #category : #links }
AWebLinkGroup >> missingStatusLinks [
	^ self links select: #statusMissing
]

{ #category : #view }
AWebLinkGroup >> overview [
	"This is the list of values to show in the overview.
	NB: An (ordered) Association list, not a Dictionary."

	self deprecated: 'Use gtOverview instead'.

	^ {'# Links' -> self links size.
		'# External (HTTP) links' -> self httpLinks size.
		'# Internal links' -> self internalLinks size.
		'# Email links' -> (self links select: #isEmail) size.
		'# Missing links' -> self missingLinks size.
		'# Broken links' -> self brokenLinks size.
		'# Missing status' -> self missingStatusLinks size}
]

{ #category : #accessing }
AWebLinkGroup >> overviewSend [
	"Used by the view to send clicks to the right group.
	NB: This is a Dictionary, not an Association list."
	
	self deprecated: 'Use gtOverview instead'.

	^ {'# Links' -> [ self links ].
		'# External (HTTP) links' -> [ self httpLinks ].
		'# Internal links' -> [ self internalLinks ].
		'# Email links' -> [ self links select: #isEmail ].
		'# Missing links' -> [ self missingLinks ].
		'# Broken links' -> [ self brokenLinks ].
		'# Missing status' -> [ self missingStatusLinks ]} asDictionary
]
