Class {
	#name : #PillarWebPage,
	#superclass : #Object,
	#instVars : [
		'website',
		'pillarFile'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
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
PillarWebPage >> gtPillarlinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pillar links';
		priority: 20;
		items: [ self pillarLinks ];
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
PillarWebPage >> linkForPath: aPath [
	^ self website linkForPath: (self normalize: aPath)
]

{ #category : #links }
PillarWebPage >> links [
	"Lookup the PillarWebLink instances for each link."

	^ self pillarLinks collect: [ :assoc | self linkForPath: assoc value ]
]

{ #category : #accessing }
PillarWebPage >> markdownLinks [
	^ (MicLinkVisitor new
		visit: (MicrodownParser parse: self contents);
		yourself) links
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
PillarWebPage >> registerLinks [
	^ self links do: [ :link | link addPage: self ]
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
