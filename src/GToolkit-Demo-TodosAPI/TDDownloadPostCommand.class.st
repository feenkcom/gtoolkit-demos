Class {
	#name : #TDDownloadPostCommand,
	#superclass : #TDDownloadCommand,
	#instVars : [
		'post'
	],
	#category : #'GToolkit-Demo-TodosAPI-Command'
}

{ #category : #accessing }
TDDownloadPostCommand >> execute [
	| aResponse |
	aResponse := self getResponse.
	aResponse isSuccess
		ifFalse: [ ^ self post ].
	aResponse := aResponse contents.
	self client rawJSON: aResponse.
	self post: (TDJsonMapping readPostInfo: aResponse).
	^ self post
]

{ #category : #accessing }
TDDownloadPostCommand >> initialize [
	super initialize.
	post := TDSimplePost empty.
]

{ #category : #accessing }
TDDownloadPostCommand >> post [
	^ post.
]

{ #category : #accessing }
TDDownloadPostCommand >> post: anObject [
	post := anObject.
]
