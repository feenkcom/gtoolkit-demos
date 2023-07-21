Class {
	#name : #EsugWebLink,
	#superclass : #Object,
	#instVars : [
		'path',
		'website',
		'pages'
	],
	#category : #'GToolkit-Demo-EsugWebsite-Model'
}

{ #category : #accessing }
EsugWebLink class >> for: aPath in: aWebsite [
	^ self new
		path: aPath;
		website: aWebsite;
		yourself
]

{ #category : #accessing }
EsugWebLink >> addPage: aPage [
	self pages add: aPage
]

{ #category : #initialization }
EsugWebLink >> initialize [
	super initialize.
	pages := Set new
]

{ #category : #accessing }
EsugWebLink >> pages [
	^ pages
]

{ #category : #accessing }
EsugWebLink >> pages: anObject [
	pages := anObject
]

{ #category : #accessing }
EsugWebLink >> path [
	^ path
]

{ #category : #accessing }
EsugWebLink >> path: aPath [
	path := aPath
]

{ #category : #accessing }
EsugWebLink >> printOn: aStream [
	self path printOn: aStream
]

{ #category : #accessing }
EsugWebLink >> website [
	^ website
]

{ #category : #accessing }
EsugWebLink >> website: aWebsite [
	website := aWebsite
]
