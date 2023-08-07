"
This is a demo of a Pillar website explorer.

To load a demo, inspect

{{gtMethod:name=PillarWebsiteExamples>>#esug2014}}

To explore the full ESUG website (repo will be cloned), inspect

{{gtMethod:name=PillarWebsite class>>#esug}}

Eventually this could be a subclass of a more generic website explorer for other formats than Pillar (eg markdown-based websites like Pico and GitHub Pages).
"
Class {
	#name : #PillarWebsite,
	#superclass : #APillarWebLinkGroup,
	#instVars : [
		'repoDir',
		'url',
		'pages',
		'linkDict'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
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
	self inform: 'Cloning ' , aRepoUrl , ' into ' , aRepoDir basename.
	proc := GtSubprocessWithInMemoryOutput new
			workingDirectory: FileLocator imageDirectory;
			command: 'git';
			arguments: {'clone'.
					aRepoUrl};
			errorBlock: [ :theProc | self error: 'Git clone failed: ' , aRepoUrl printString ].
	proc runAndWait.
	^ aRepoDir
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

{ #category : #accessing }
PillarWebsite >> gtReachablePagesFor: aView [
	<gtView>
	^ aView forward
		title: 'Reachable pages';
		priority: 60;
		object: [ PillarWebPageGroup withAll: self reachable ];
		view: #gtPagesFor:
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

{ #category : #accessing }
PillarWebsite >> gtUnreachablePagesFor: aView [
	<gtView>
	self unreachable ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Unreachable pages';
		priority: 61;
		object: [ PillarWebPageGroup withAll: self unreachable ];
		view: #gtPagesFor:
]

{ #category : #testing }
PillarWebsite >> hasPageNamed: aString [
	^ self pages
		detect: [ :page | page path = aString ]
		ifFound: [ true ]
		ifNone: [ false ]
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

{ #category : #links }
PillarWebsite >> reachable [
	^ self root reachable
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

{ #category : #links }
PillarWebsite >> unreachable [
	^ self pages difference: self reachable
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
