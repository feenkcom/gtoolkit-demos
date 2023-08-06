Class {
	#name : #PillarWebsite,
	#superclass : #Object,
	#instVars : [
		'repoDir',
		'url',
		'pages',
		'linkDict',
		'announcer'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

{ #category : #creation }
PillarWebsite class >> esug [
	^ self new
		repoDir: self esugRepoDir;
		url: self esugUrl;
		yourself
]

{ #category : #creation }
PillarWebsite class >> esugRepoDir [
	^ self
		initializeRepoDir: 'esug.github.io' asFileReference
		fromRepoUrl: 'https://github.com/ESUG/esug.github.io'
]

{ #category : #constant }
PillarWebsite class >> esugUrl [
	^ 'https://esug.github.io'
]

{ #category : #initialization }
PillarWebsite class >> initializeRepoDir: aRepoDir fromRepoUrl: aRepoUrl [
	"Clone the repo unless it already exists."

	| proc |
	aRepoDir exists ifTrue: [ ^ aRepoDir ].
	proc := GtSubprocessWithInMemoryOutput new
			workingDirectory: FileLocator imageDirectory;
			command: 'git';
			arguments: {'clone'.
					aRepoUrl};
			errorBlock: [ :theProc | self error: 'Git clone failed: ' , aRepoUrl printString ].
	proc runAndWait.
	^ aRepoDir
]

{ #category : #announcements }
PillarWebsite >> announcer [
	^ announcer
]

{ #category : #announcements }
PillarWebsite >> announcer: anAnnouncement [
	announcer := anAnnouncement
]

{ #category : #links }
PillarWebsite >> brokenLinks [
	^ self links select: #isBroken
]

{ #category : #view }
PillarWebsite >> gtBrokenLinksFor: aView [
	<gtView>
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
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
PillarWebsite >> gtHttpLinksFor: aView [
	<gtView>
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
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
PillarWebsite >> gtLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Links';
		priority: 30;
		items: [ self links ];
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
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
PillarWebsite >> gtMissingLinksFor: aView [
	<gtView>
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
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
PillarWebsite >> gtMissingStatusLinksFor: aView [
	<gtView>
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
		updateWhen: PillarWebLinkStatusUpdated in: self announcer
]

{ #category : #view }
PillarWebsite >> gtPagesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pages';
		priority: 10;
		items: [ self pages ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Page'
			text: [ :item | item path ]
			width: 400;
		column: 'Pillar links'
			text: [ :item | 
				| size |
				size := item pillarLinks size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80;
		column: 'Markdown links'
			text: [ :item | 
				| size |
				size := item markdownLinks size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80
]

{ #category : #searching }
PillarWebsite >> gtSpotterForPageContents: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page content';
		priority: 20;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #contents;
		filterBySubstring
]

{ #category : #searching }
PillarWebsite >> gtSpotterForPageNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page names';
		priority: 10;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #path;
		filterBySubstring
]

{ #category : #testing }
PillarWebsite >> hasPageNamed: aString [
	^ self pages
		detect: [ :page | page path = aString ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #links }
PillarWebsite >> httpLinks [
	^  self links select: #isHttp
]

{ #category : #initializations }
PillarWebsite >> initialize [
	self announcer: Announcer new
]

{ #category : #initialization }
PillarWebsite >> initializeLinkDict [
	linkDict := Dictionary new.
	self pages do: [ :each | each registerLinks ].
	^ linkDict
]

{ #category : #accessing }
PillarWebsite >> initializePages [
	^ pages := ((self repoDir allChildrenMatching: '*.pillar')
			collect: [ :each | PillarWebPage for: each in: self ])
			sort: [ :a :b | 
				(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
					or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
							and: [ a path < b path ] ] ]
]

{ #category : #links }
PillarWebsite >> linkDict [
	^ linkDict
]

{ #category : #links }
PillarWebsite >> linkForPath: aPath [
	^ linkDict at: aPath ifAbsentPut: [ PillarWebLink for: aPath in: self ]
]

{ #category : #links }
PillarWebsite >> links [
	^ self linkDict values
		sort: [ :a :b | 
			(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
				or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
						and: [ a path < b path ] ] ]
]

{ #category : #links }
PillarWebsite >> missingLinks [
	(self links select: #isInternal) do: #checkStatus.
	^ self links select: [ :link | link isInternal and: [ link isMissing ] ]
]

{ #category : #links }
PillarWebsite >> missingStatusLinks [
	^ self httpLinks select: #statusMissing
]

{ #category : #announcements }
PillarWebsite >> notifyStatusUpdate [
	self announcer announce: PillarWebLinkStatusUpdated new
]

{ #category : #accessing }
PillarWebsite >> pageNamed: aString [
	^ self pages detect: [ :page | page path = aString ]
]

{ #category : #accessing }
PillarWebsite >> pages [
	^ pages
]

{ #category : #accessing }
PillarWebsite >> repoDir [
	^ repoDir
]

{ #category : #accessing }
PillarWebsite >> repoDir: aFileReference [
	repoDir := aFileReference.
	self initializePages.
	self initializeLinkDict
]

{ #category : #accessing }
PillarWebsite >> root [
	^ self pages detect: [ :page | page path = self rootPath ]
]

{ #category : #constant }
PillarWebsite >> rootPath [
	"Assume this is the root of any pillar website."

	^ '/index.pillar'
]

{ #category : #accessing }
PillarWebsite >> url [
	"The actual URL of the website"

	^ url
]

{ #category : #accessing }
PillarWebsite >> url: anObject [
	url := anObject
]
