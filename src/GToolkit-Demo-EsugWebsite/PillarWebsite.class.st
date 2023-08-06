Class {
	#name : #PillarWebsite,
	#superclass : #Object,
	#instVars : [
		'repoDir',
		'url',
		'pages'
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

{ #category : #accessing }
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

{ #category : #accessing }
PillarWebsite >> initializePages [
	^ pages := ((self repoDir allChildrenMatching: '*.pillar')
			collect: [ :each | PillarWebPage for: each in: self ])
			sort: [ :a :b | 
				(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
					or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
							and: [ a path < b path ] ] ]
]

{ #category : #accessing }
PillarWebsite >> pageNamed: aString [
	^ self pages detect: [ :page | page path = aString ]
]

{ #category : #accessing }
PillarWebsite >> pages [
^ pages ifNil: [ self initializePages ]
]

{ #category : #accessing }
PillarWebsite >> repoDir [
	^ repoDir
]

{ #category : #accessing }
PillarWebsite >> repoDir: anObject [
	repoDir := anObject
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
