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
		ifNotEmpty: [ self inform: 'Starting background checks'.
			process := [ self missingStatusLinks do: [ :aWebsite | aWebsite checkStatus ] ]
					fork ]
]

{ #category : #action }
AWebLinkGroup >> gtActionCheckStatusFor: anAction [
	<gtAction>
	self missingStatusLinks ifEmpty: [ ^ anAction noAction ].
	^ anAction button
		tooltip: 'Check status';
		priority: 10;
		icon: BrGlamorousIcons accept;
		action: [ self checkStatusWhereMissing ]
]

{ #category : #action }
AWebLinkGroup >> gtActionStopCheckStatusFor: anAction [
	<gtAction>
	self missingStatusLinks ifEmpty: [ ^ anAction noAction ].
	^ anAction button
		tooltip: 'Stop background status check';
		priority: 11;
		icon: BrGlamorousIcons close;
		action: [ self killBackgroundCheck ]
]

{ #category : #view }
AWebLinkGroup >> gtBrokenLinksFor: aView [
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
		updateWhen: WebLinkStatusUpdated in: self announcer;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (WebLinkGroup withAll: self missingLinks) ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtHttpLinksFor: aView [
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
			action: [ :aButton :aTab | aButton phlow spawnObject: (WebLinkGroup withAll: self httpLinks) ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtLinksFor: aView [
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
			width: 200;
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (WebLinkGroup withAll: self links) ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtMissingLinksFor: aView [
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
			action: [ :aButton :aTab | aButton phlow spawnObject: (WebLinkGroup withAll: self missingLinks) ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtMissingStatusLinksFor: aView [
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
		updateWhen: WebLinkStatusUpdated in: self announcer;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: (WebLinkGroup withAll: self missingLinks) ];
		updateWhen: WebLinkStatusUpdated in: self announcer
]

{ #category : #view }
AWebLinkGroup >> gtOverviewFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Overview';
		priority: 5;
		items: [ self overview ];
		column: 'Attribute'
			text: [ :item | item key ]
			width: 200;
		column: 'Value'
			text: [ :item | item value ]
			width: 400;
		send: [ :item | self overviewSend at: item key ];
		actionUpdateButton
]

{ #category : #accessing }
AWebLinkGroup >> gtSpotterForLinkNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Link names';
		priority: 30;
		items: [ self links ];
		itemsLimit: Float infinity;
		itemName: #path;
		sendCategory: [ :aCategory :aStep :thisSearch | WebLinkGroup withAll: aCategory items contents ];
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
			process := nil.
			self inform: 'Background check terminated' ]
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
	^ {'# Links' -> self links size.
		'# External (HTTP) links' -> self httpLinks size.
		'# Internal links' -> self internalLinks size.
		'# Email links' -> (self links select: #isEmail) size.
		'# Missing links' -> self missingLinks size}
]

{ #category : #accessing }
AWebLinkGroup >> overviewSend [
	"Used by the view to send clicks to the right group."

	^ {'# Links' -> self links asWebLinkGroup.
		'# External (HTTP) links' -> self httpLinks asWebLinkGroup.
		'# Internal links' -> self internalLinks asWebLinkGroup.
		'# Email links' -> (self links select: #isEmail) asWebLinkGroup.
		'# Missing links' -> self missingLinks asWebLinkGroup} asDictionary
]
