Class {
	#name : #TDDownloadPostsListCommand,
	#superclass : #TDDownloadCommand,
	#instVars : [
		'list'
	],
	#category : #'GToolkit-Demo-TodosAPI-Command'
}

{ #category : #accessing }
TDDownloadPostsListCommand >> execute [
	| aResponse |
	aResponse := self getResponse.
	aResponse isSuccess
		ifFalse: [ ^ self list ].
	aResponse := aResponse contents.
	self client rawJSON: aResponse.
	self list: (TDJsonMapping readPostsInfo: aResponse).
	^ self list
]

{ #category : #accessing }
TDDownloadPostsListCommand >> initialize [
	super initialize.
	list := #().
]

{ #category : #accessing }
TDDownloadPostsListCommand >> list [
	^ list.
]

{ #category : #accessing }
TDDownloadPostsListCommand >> list: anObject [
	list := anObject.
]
