Class {
	#name : #EsugPage,
	#superclass : #Object,
	#instVars : [
		'pillarFile'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Demo'
}

{ #category : #accessing }
EsugPage class >> for: aFileReference [
	^ self new
		webPageFile: aFileReference;
		yourself
]

{ #category : #accessing }
EsugPage >> printOn: aStream [
	aStream print: pillarFile basename
]

{ #category : #accessing }
EsugPage >> webPageFile: aFileReference [
	pillarFile := aFileReference
]
