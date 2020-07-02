Class {
	#name : #TDDownloadTodoCommand,
	#superclass : #TDDownloadCommand,
	#instVars : [
		'todo'
	],
	#category : #'GToolkit-Demo-TodosAPI-Command'
}

{ #category : #accessing }
TDDownloadTodoCommand >> execute [
	| aResponse |
	aResponse := self getResponse.
	aResponse isSuccess
		ifFalse: [ ^ self todo ].
	aResponse := aResponse contents.
	self client rawJSON: aResponse.
	self todo: (TDJsonMapping readTodoInfo: aResponse).
	^ self todo
]

{ #category : #accessing }
TDDownloadTodoCommand >> initialize [
	super initialize.
	todo := TDTodoPost empty.
]

{ #category : #accessing }
TDDownloadTodoCommand >> todo [
	^ todo.
]

{ #category : #accessing }
TDDownloadTodoCommand >> todo: anObject [
	todo := anObject.
]
