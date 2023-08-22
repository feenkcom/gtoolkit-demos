"
I serve as an abstract superclass of website classes. 

My subclasses may have different notions of which files in the website represent pages (i.e., files ending with `.md` or `.pillar`), and where to find these files.
They may also use different classes to instantiate the page objects.

Concrete subclasses should implement: `initializePages`  `rootPath` `webLinkClass`

Subclasses may want to override: `webPageGroupClass` `navigationRoots`
"
Class {
	#name : #AWebsite,
	#superclass : #AWebLinkGroup,
	#traits : 'TWebPageGroup',
	#classTraits : 'TWebPageGroup classTrait',
	#instVars : [
		'pages',
		'repoDir',
		'url',
		'linkDict',
		'reachable',
		'rootPages',
		'links'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #view }
AWebsite >> gtMapFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Map';
		priority: 62;
		painting: [ :aMondrian | self mapFor: aMondrian ]
]

{ #category : #view }
AWebsite >> gtPagesFor: aView [
	<gtView>
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
		column: 'Markdown links'
			text: [ :item | 
				| size |
				size := item markdownLinks size.
				size = 0 ifTrue: [ '' ] ifFalse: [ size ] ]
			width: 80
]

{ #category : #accessing }
AWebsite >> gtReachablePagesFor: aView [
	<gtView>
	^ aView forward
		title: 'Reachable pages';
		priority: 60;
		object: [ self reachable ];
		view: #gtPagesFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: self reachable ]
]

{ #category : #accessing }
AWebsite >> gtUnreachablePagesFor: aView [
	<gtView>
	self unreachable ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Unreachable pages';
		priority: 61;
		object: [ self unreachable ];
		view: #gtPagesFor:;
		actionButtonIcon: BrGlamorousVectorIcons inspect
			tooltip: 'Inspect  value'
			action: [ :aButton :aTab | aButton phlow spawnObject: self unreachable ]
]

{ #category : #testing }
AWebsite >> hasPageNamed: aString [
	^ self pages
		detect: [ :page | page path = aString ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{ #category : #initialization }
AWebsite >> initializeLinkDict [
	linkDict := Dictionary new.
	self pages do: [ :each | each registerLinks ].
	^ linkDict
]

{ #category : #accessing }
AWebsite >> initializePages [
	self subclassResponsibility
]

{ #category : #initialization }
AWebsite >> initializeRepoDir: aRepoDir fromRepoUrl: aRepoUrl [
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

{ #category : #links }
AWebsite >> linkDict [
	^ linkDict
]

{ #category : #links }
AWebsite >> linkForPath: aPath [
	^ linkDict at: aPath ifAbsentPut: [ self webLinkClass for: aPath in: self ]
]

{ #category : #links }
AWebsite >> links [
	"Cache it"

	^ links
		ifNil: [ links := self linkDict values
					sort: [ :a :b | 
						(a path occurrencesOf: $/) < (b path occurrencesOf: $/)
							or: [ (a path occurrencesOf: $/) = (b path occurrencesOf: $/)
									and: [ a path < b path ] ] ] ]
]

{ #category : #links }
AWebsite >> mapFor: aMondrian [
	aMondrian nodes
		stencil: [ :each | 
			BlElement new
				size: 5 @ 5;
				geometry: BlCircleGeometry new;
				background: ((self rootPages includes: each)
						ifTrue: [ Color blue ]
						ifFalse: [ (self reachable includes: each) ifTrue: [ Color green ] ifFalse: [ Color red ] ]);
				aptitude: (BrGlamorousWithTooltipAptitude content: each tooltip) ];
		with: self pages.

	aMondrian edges
		stencil: [ :each | 
			BlLineElement new
				zIndex: -1;
				border: (BlBorder paint: (Color veryVeryLightGray alpha: 0.5)) ];
		connectToAll: [ :each | each childrenPages asSet ].
	aMondrian layout force.
	^ aMondrian
]

{ #category : #links }
AWebsite >> mondrianMap [
	^ self mapFor: GtMondrian new
]

{ #category : #links }
AWebsite >> navigationRoots [
	"Subclasses may want to add additional pages from the navigation menu."
	^ {}
]

{ #category : #announcements }
AWebsite >> notifyStatusUpdate [
	self announcer announce: WebLinkStatusUpdated new
]

{ #category : #accessing }
AWebsite >> pageNamed: aString [
	^ self pages detect: [ :page | page path = aString ]
]

{ #category : #accessing }
AWebsite >> pages [
	^ pages
]

{ #category : #printing }
AWebsite >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: ' (';
		nextPutAll: self url;
		nextPut: $)
]

{ #category : #links }
AWebsite >> reachable [
	"Expensive to compute and won't change, so we cache it."

	^ reachable
		ifNil: [ reachable := self webPageGroupClass
					withAll: (self root reachableFrom: self rootPages) ]
]

{ #category : #accessing }
AWebsite >> repoDir [
	^ repoDir
]

{ #category : #accessing }
AWebsite >> repoDir: aFileReference [
	repoDir := aFileReference.
	self initializePages.
	self initializeLinkDict
]

{ #category : #accessing }
AWebsite >> root [
	^ self pages detect: [ :page | page path = self rootPath ]
]

{ #category : #links }
AWebsite >> rootPages [
	^ rootPages
		ifNil: [ rootPages := {self root} asOrderedCollection.
			rootPages addAll: self navigationRoots.
			rootPages ]
]

{ #category : #abstract }
AWebsite >> rootPath [
	"Path to the root file of the website."

	^ self subclassResponsibility
]

{ #category : #links }
AWebsite >> unreachable [
	^ self webPageGroupClass withAll: (self pages difference: self reachable items)
]

{ #category : #accessing }
AWebsite >> url [
	"The actual URL of the website"

	^ url
]

{ #category : #accessing }
AWebsite >> url: anObject [
	url := anObject
]

{ #category : #links }
AWebsite >> webLinkClass [
	self subclassResponsibility
]

{ #category : #constant }
AWebsite >> webPageGroupClass [
	"Which class should be used to instantiate groups of web pages."

	^ WebPageGroup
]
