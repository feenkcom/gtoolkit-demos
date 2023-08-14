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
		pillarFile: aFileReference;
		yourself
]

{ #category : #accessing }
EsugPage >> pillarFile: aFileReference [
	pillarFile := aFileReference
]

{ #category : #accessing }
EsugPage >> printOn: aStream [
	aStream print: pillarFile basename
]
