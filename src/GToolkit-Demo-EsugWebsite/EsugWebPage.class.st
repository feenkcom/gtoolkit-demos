Class {
	#name : #EsugWebPage,
	#superclass : #Object,
	#instVars : [
		'website',
		'pillarFile'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

{ #category : #path }
EsugWebPage class >> emailRegexString [
	^ '^[\w._%+-]+@[\w_%+-]+\.[\w._%+-]+$'
]

{ #category : #accessing }
EsugWebPage class >> for: aFileReference in: anEsugWebsite [
	^ self new
		website: anEsugWebsite;
		pillarFile: aFileReference;
		yourself
]

{ #category : #accessing }
EsugWebPage >> contents [
	^ self pillarFile contents
]

{ #category : #accessing }
EsugWebPage >> gtContentsFor: aView [
	<gtView>
	^ aView forward
		title: 'Contents';
		priority: 10;
		object: [ self pillarFile ];
		view: #gtContentsFor:
]

{ #category : #accessing }
EsugWebPage >> gtLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Links';
		priority: 30;
		items: [ self links ];
		column: 'Link'
			text: [ :item | item path ]
			width: 400;
		column: '# Pages' text: [ :item | item pages size ];
		actionUpdateButton
]

{ #category : #accessing }
EsugWebPage >> gtPillarlinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pillar links';
		priority: 20;
		items: [ self pillarLinks ];
		column: 'Text'
			text: [ :item | item key ]
			width: 300;
		column: 'Link'
			text: [ :item | item value ]
			width: 400;
		send: [ :item | self linkForPath: item value ];
		actionUpdateButton
]

{ #category : #accessing }
EsugWebPage >> linkForPath: aPath [
	^ self website linkForPath: (self normalize: aPath)
]

{ #category : #accessing }
EsugWebPage >> links [
	"Lookup the EsugWebLink instances for each link."

	^ self pillarLinks collect: [ :assoc | self linkForPath: assoc value ]
]

{ #category : #accessing }
EsugWebPage >> markdownLinks [
	^ (MicLinkVisitor new
		visit: (MicrodownParser parse: self contents);
		yourself) links
]

{ #category : #path }
EsugWebPage >> normalize: aPath [
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
EsugWebPage >> path [
	"My path relative to the root of the repo."

	| path |
	path := pillarFile pathString withoutPrefix: website repo pathString.
	self assert: (path beginsWith: '/').
	^ path
]

{ #category : #path }
EsugWebPage >> pathPrefix [
	^ self path copyUpToLast: $/
]

{ #category : #accessing }
EsugWebPage >> pillarFile [
	^ pillarFile
]

{ #category : #accessing }
EsugWebPage >> pillarFile: aFileReference [
	pillarFile := aFileReference
]

{ #category : #accessing }
EsugWebPage >> pillarLinks [
	^ PillarLinkSeaParser parse: self contents
]

{ #category : #accessing }
EsugWebPage >> printOn: aStream [
	aStream nextPutAll: self path
]

{ #category : #accessing }
EsugWebPage >> registerLinks [
	^ self links do: [ :link | link addPage: self ]
]

{ #category : #accessing }
EsugWebPage >> website [
	^ website
]

{ #category : #accessing }
EsugWebPage >> website: anEsugWebsite [
	website := anEsugWebsite
]
