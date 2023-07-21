Class {
	#name : #EsugWebsite,
	#superclass : #Object,
	#instVars : [
		'repo',
		'pages',
		'repoUrl',
		'repoDir',
		'linkDict'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

{ #category : #creation }
EsugWebsite class >> instance [
	"Default instance from actual ESUG repo"

	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
EsugWebsite class >> pageNamed: aString [
	^ self instance pageNamed: aString
]

{ #category : #acccessing }
EsugWebsite class >> pages [
	^ self instance pages
]

{ #category : #creation }
EsugWebsite class >> reset [
	^ instance := nil
]

{ #category : #acccessing }
EsugWebsite class >> root [
	^ self instance root
]

{ #category : #accessing }
EsugWebsite >> brokenLinks [
	(self links select: #isHttp) do: #checkStatus.
	^ self links select: [ :link | link isHttp and: [ link isMissing ] ]
]

{ #category : #accessing }
EsugWebsite >> gtBrokenLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Broken external links';
		priority: 50;
		items: [ self brokenLinks ];
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages' text: [ :item | item pages size ];
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton
]

{ #category : #accessing }
EsugWebsite >> gtHttpLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'HTTP links';
		priority: 40;
		items: [ self httpLinks ];
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages' text: [ :item | item pages size ];
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton
]

{ #category : #accessing }
EsugWebsite >> gtLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Links';
		priority: 30;
		items: [ self links ];
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages' text: [ :item | item pages size ];
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton
]

{ #category : #accessing }
EsugWebsite >> gtMissingLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Missing links';
		priority: 35;
		items: [ self missingLinks ];
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages' text: [ :item | item pages size ];
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton
]

{ #category : #accessing }
EsugWebsite >> gtPagesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pages';
		priority: 10;
		items: [ self pages ];
		column: 'Page' text: [ :item | item path ] width: 400;
		column: 'Pillar links' text: [ :item | item pillarLinks size ] width: 80;
		column: 'Markdown links' text: [ :item | item markdownLinks size ] width: 80
]

{ #category : #accessing }
EsugWebsite >> gtSpotterForPageContents: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Page content';
		priority: 20;
		items: [ self pages ];
		itemsLimit: Float infinity;
		itemName: #contents;
		filterBySubstring
]

{ #category : #accessing }
EsugWebsite >> gtSpotterForPageNames: aSearch [
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
EsugWebsite >> hasPageNamed: aString [
	^ self pages
		detect: [ :page | page path = aString ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #accessing }
EsugWebsite >> httpLinks [
	^  self links select: #isHttp
]

{ #category : #initialization }
EsugWebsite >> initialize [
	self repoUrl: 'https://github.com/ESUG/esug.github.io'.
	self repoDir: FileLocator imageDirectory / 'esug.github.io'
]

{ #category : #initialization }
EsugWebsite >> initializeLinkDict [
	linkDict := Dictionary new.
	self pages do: [ :each | each registerLinks ].
	^ linkDict
]

{ #category : #initialization }
EsugWebsite >> initializePages [
	^ ((self repo allChildrenMatching: '*.pillar')
		collect: [ :each | EsugWebPage for: each in: self ])
		sort: [ :a :b | 
			(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
				or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
						and: [ a path < b path ] ] ]
]

{ #category : #initialization }
EsugWebsite >> initializeRepo [
	"Clone the repo unless it already exists."

	| proc  |
	repoDir exists ifTrue: [ ^ repoDir ].
	proc := GtSubprocessWithInMemoryOutput new
			workingDirectory: FileLocator imageDirectory;
			command: 'git';
			arguments: {'clone'.
					self repoUrl};
			errorBlock: [ :theProc | self error: 'Git clone failed: ' , self repoUrl printString ].
	proc runAndWait.
	^ repoDir
]

{ #category : #accessing }
EsugWebsite >> linkDict [
	^ linkDict ifNil: [ linkDict := self initializeLinkDict ]
]

{ #category : #accessing }
EsugWebsite >> linkDict: anObject [
	linkDict := anObject
]

{ #category : #accessing }
EsugWebsite >> linkForPath: aPath [
	^ linkDict at: aPath ifAbsentPut: [ EsugWebLink for: aPath in: self ]
]

{ #category : #accessing }
EsugWebsite >> links [
	^ self linkDict values
		sort: [ :a :b | 
			(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
				or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
						and: [ a path < b path ] ] ]
]

{ #category : #accessing }
EsugWebsite >> missingLinks [
	(self links select: #isInternal) do: #checkStatus.
	^ self links select: [ :link | link isInternal and: [ link isMissing ] ]
]

{ #category : #accessing }
EsugWebsite >> pageNamed: aString [
	^ self pages detect: [ :page | page path = aString ]
]

{ #category : #accessing }
EsugWebsite >> pages [
	^ pages ifNil: [ pages := self initializePages ]
]

{ #category : #accessing }
EsugWebsite >> repo [
	^ repo ifNil: [ repo := self initializeRepo ]
]

{ #category : #accessing }
EsugWebsite >> repoDir [
	^ repoDir
]

{ #category : #accessing }
EsugWebsite >> repoDir: anObject [
	repoDir := anObject
]

{ #category : #constant }
EsugWebsite >> repoUrl [
	^ repoUrl
]

{ #category : #accessing }
EsugWebsite >> repoUrl: anObject [
	repoUrl := anObject
]

{ #category : #accessing }
EsugWebsite >> root [
	^ self pages detect: [ :page | page path = self rootPath ]
]

{ #category : #constant }
EsugWebsite >> rootPath [
	^ '/index.pillar'
]
