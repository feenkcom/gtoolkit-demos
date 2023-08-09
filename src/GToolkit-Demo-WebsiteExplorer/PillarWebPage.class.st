Class {
	#name : #PillarWebPage,
	#superclass : #Object,
	#instVars : [
		'website',
		'pillarFile'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #path }
PillarWebPage class >> emailRegexString [
	^ '^[\w._%+-]+@[\w_%+-]+\.[\w._%+-]+$'
]

{ #category : #creation }
PillarWebPage class >> for: aFileReference in: aPillarWebsite [
	^ self new
		website: aPillarWebsite;
		pillarFile: aFileReference;
		yourself
]

{ #category : #accessing }
PillarWebPage >> childrenPages [
	"Pages that can be reached directly from links on this page."
	^ (self links select: #isPage) collect: #page
]

{ #category : #accessing }
PillarWebPage >> contents [
	^ self pillarFile contents
]

{ #category : #action }
PillarWebPage >> gtActionWebBrowseFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Open in browser';
		priority: 10;
		icon: BrGlamorousIcons go;
		action: [ WebBrowser openOn: self url ]
]

{ #category : #view }
PillarWebPage >> gtContentsFor: aView [
	<gtView>
	^ aView forward
		title: 'Contents';
		priority: 10;
		object: [ self pillarFile ];
		view: #gtContentsFor:
]

{ #category : #links }
PillarWebPage >> gtLinksFor: aView [
	<gtView>
	^ aView forward
		title: 'Links';
		priority: 30;
		object: [ PillarWebLinkGroup withAll: self links ];
		view: #gtLinksFor:
]

{ #category : #view }
PillarWebPage >> gtMapFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Map';
		priority: 43;
		painting: [ :aMondrian | self mapFor: aMondrian ]
]

{ #category : #links }
PillarWebPage >> gtPillarlinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pillar links';
		priority: 20;
		items: [ self pillarLinks ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: '# Pages'
			text: [ :item | (self linkForPath: item  value) pages size ]
			width: 60;
		column: 'Text'
			text: [ :item | item key ]
			width: 200;
		column: 'Link'
			text: [ :item | item value ]
			width: 400;
		send: [ :item | self linkForPath: item value ];
		actionUpdateButton
]

{ #category : #links }
PillarWebPage >> gtReachablePagesFor: aView [
	<gtView>
	^ aView forward
		title: 'Reachable pages';
		priority: 40;
		object: [ self reachable ];
		view: #gtPagesFor:
]

{ #category : #links }
PillarWebPage >> linkForPath: aPath [
	^ self website linkForPath: (self normalize: aPath)
]

{ #category : #links }
PillarWebPage >> links [
	"Lookup the PillarWebLink instances for each link."

	^ self pillarLinks collect: [ :assoc | self linkForPath: assoc value ]
]

{ #category : #links }
PillarWebPage >> mapFor: aMondrian [
	aMondrian nodes
		stencil: [ :each | 
			BlElement new
				size: 5 @ 5;
				geometry: BlCircleGeometry new;
				background: (each = self
						ifTrue: [ Color orange ]
						ifFalse: [ (self website rootPages includes: each)
								ifTrue: [ Color blue ]
								ifFalse: [ (self website reachable includes: each)
										ifTrue: [ Color green ]
										ifFalse: [ Color red ] ] ]);
				aptitude: (BrGlamorousWithTooltipAptitude content: each tooltip) ];
		with: self reachable.

	aMondrian edges
		stencil: [ :each | 
			BlLineElement new
				zIndex: -1;
				border: (BlBorder paint: (Color veryVeryLightGray alpha: 0.5)) ];
		connectToAll: [ :each | each childrenPages asSet ].
	aMondrian layout force.
	^ aMondrian
]

{ #category : #accessing }
PillarWebPage >> markdownLinks [
	^ (MicLinkVisitor new
		visit: (MicrodownParser parse: self contents);
		yourself) links
]

{ #category : #links }
PillarWebPage >> mondrianMap [
	^ self mapFor: GtMondrian new
]

{ #category : #path }
PillarWebPage >> normalize: aPath [
	| path |
	path := aPath.
	(path beginsWith: 'http') ifTrue: [ ^ path ].
	(path beginsWith: '/') ifTrue: [ ^ path ].
	(path matchesRegex: self class emailRegexString) ifTrue: [ ^ path ].
	path := self pathPrefix , '/' , path.
	[ path matchesRegex: '.*/[^/]+/\.\./.*' ]
		whileTrue: [ path := path copyWithRegex: '/[^/]+/\.\./' matchesReplacedWith: '/' ].
	^ path
]

{ #category : #accessing }
PillarWebPage >> path [
	"My path relative to the root of the repo."

	| path |
	path := pillarFile pathString withoutPrefix: website repoDir pathString.
	self assert: (path beginsWith: '/').
	^ path
]

{ #category : #path }
PillarWebPage >> pathPrefix [
	^ self path copyUpToLast: $/
]

{ #category : #accessing }
PillarWebPage >> pillarFile [
	^ pillarFile
]

{ #category : #accessing }
PillarWebPage >> pillarFile: anObject [
	pillarFile := anObject
]

{ #category : #accessing }
PillarWebPage >> pillarLinks [
	^ PillarLinkSeaParser parse: self contents
]

{ #category : #printing }
PillarWebPage >> printOn: aStream [
	aStream nextPutAll: self path
]

{ #category : #links }
PillarWebPage >> reachable [
	^ PillarWebPageGroup withAll: (self reachableFrom: {self})
]

{ #category : #links }
PillarWebPage >> reachableFrom: rootPages [
	| reachable pagesToCheck |
	reachable := OrderedCollection new.
	pagesToCheck := OrderedCollection withAll: rootPages.
	[ pagesToCheck notEmpty ]
		whileTrue: [ | aPage |
			aPage := pagesToCheck removeFirst.
			reachable addLast: aPage.
			aPage childrenPages
				do: [ :each | 
					(reachable includes: each)
						ifFalse: [ (pagesToCheck includes: each) ifFalse: [ pagesToCheck addLast: each ] ] ] ].
	^ reachable
]

{ #category : #links }
PillarWebPage >> registerLinks [
	^ self links do: [ :link | link addPage: self ]
]

{ #category : #links }
PillarWebPage >> tooltip [
	^ [ BrLabel new
		aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
		padding: (BlInsets all: 2);
		text: self path;
		alignCenter ] asStencil
]

{ #category : #accessing }
PillarWebPage >> url [
	^ self website url , self path removeSuffix: '.pillar'
]

{ #category : #accessing }
PillarWebPage >> website [
	^ website
]

{ #category : #accessing }
PillarWebPage >> website: aPillarWebsite [
	website := aPillarWebsite
]
