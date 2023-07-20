Class {
	#name : #EsugWebPage,
	#superclass : #Object,
	#instVars : [
		'website',
		'pillarFile'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

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
EsugWebPage >> gtPillarlinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Pillar links';
		priority: 20;
		items: [ self pillarLinks ];
		column: 'Text' text: [ :item | item key ] width: 300;
		column: 'Link' text: [ :item | item value ] width: 400;
		actionUpdateButton
]

{ #category : #accessing }
EsugWebPage >> markdownLinks [
	^ (MicLinkVisitor new
		visit: (MicrodownParser parse: self contents);
		yourself) links
]

{ #category : #path }
EsugWebPage >> normalize: aPath [
	(aPath beginsWith: 'http') ifTrue: [ ^ aPath ].
	(aPath beginsWith: '/') ifTrue: [ ^ aPath ].
	
	
]

{ #category : #path }
EsugWebPage >> pathPrefix [
	^ self pathString
]

{ #category : #accessing }
EsugWebPage >> pathString [
	"My path relative to the root of the repo."

	| pathString |
	pathString := pillarFile pathString withoutPrefix: website repo pathString.
	self assert: (pathString beginsWith: '/').
	^ pathString
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
	aStream nextPutAll: self pathString
]

{ #category : #accessing }
EsugWebPage >> website: anEsugWebsite [
	website := anEsugWebsite
]
