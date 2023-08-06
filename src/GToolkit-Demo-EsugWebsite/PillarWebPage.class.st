Class {
	#name : #PillarWebPage,
	#superclass : #Object,
	#instVars : [
		'website',
		'pillarFile'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

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

{ #category : #view }
PillarWebPage >> gtContentsFor: aView [
	<gtView>
	^ aView forward
		title: 'Contents';
		priority: 10;
		object: [ self pillarFile ];
		view: #gtContentsFor:
]

{ #category : #accessing }
PillarWebPage >> path [
	"My path relative to the root of the repo."

	| path |
	path := pillarFile pathString withoutPrefix: website repoDir pathString.
	self assert: (path beginsWith: '/').
	^ path
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

{ #category : #accessing }
PillarWebPage >> website [
	^ website
]

{ #category : #accessing }
PillarWebPage >> website: aPillarWebsite [
	website := aPillarWebsite
]
