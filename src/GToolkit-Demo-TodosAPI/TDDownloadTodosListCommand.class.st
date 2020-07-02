Class {
	#name : #TDDownloadTodosListCommand,
	#superclass : #TDDownloadCommand,
	#instVars : [
		'list'
	],
	#category : #'GToolkit-Demo-TodosAPI-Command'
}

{ #category : #accessing }
TDDownloadTodosListCommand >> execute [
	| aResponse |
	aResponse := self getResponse..
	aResponse isSuccess
		ifFalse: [ ^ self list ].
	aResponse := aResponse contents.
	self client rawJSON: aResponse.
	self list: (TDJsonMapping readTodosInfo: aResponse).
	^ self list
]

{ #category : #accessing }
TDDownloadTodosListCommand >> initialize [
	super initialize.
	list := #().
]

{ #category : #accessing }
TDDownloadTodosListCommand >> list [
	^ list.
]

{ #category : #accessing }
TDDownloadTodosListCommand >> list: anObject [
	list := anObject.
]
