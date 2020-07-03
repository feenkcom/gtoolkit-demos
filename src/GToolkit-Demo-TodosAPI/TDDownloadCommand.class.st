Class {
	#name : #TDDownloadCommand,
	#superclass : #Object,
	#instVars : [
		'client',
		'signalProgress',
		'znClient',
		'url',
		'requestType',
		'result'
	],
	#category : #'GToolkit-Demo-TodosAPI-Command'
}

{ #category : #accessing }
TDDownloadCommand >> client [
	^ client.
]

{ #category : #accessing }
TDDownloadCommand >> client: anObject [
	client := anObject.
]

{ #category : #accessing }
TDDownloadCommand >> execute [
	| aResponse |
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [ ^ self result ].
	aResponse := aResponse contents.
	self client rawJSON: aResponse.
	self result: (self readResponse: aResponse).
	^ self result
]

{ #category : #accessing }
TDDownloadCommand >> initialize [
	super initialize.
	url := 'https://jsonplaceholder.typicode.com/'
]

{ #category : #accessing }
TDDownloadCommand >> readResponse: aResponse [
	(self requestType == #TodosCollection)
		ifTrue: [ ^ TDJsonMapping readTodosInfo: aResponse].
	(self requestType == #TodoSingle)
		ifTrue: [ ^ TDJsonMapping readTodoInfo: aResponse].
	(self requestType == #PostsCollection)
		ifTrue: [ ^ TDJsonMapping readPostsInfo: aResponse].
	(self requestType == #PostSingle)
		ifTrue: [ ^ TDJsonMapping readPostInfo: aResponse].
]

{ #category : #accessing }
TDDownloadCommand >> requestAllPosts [
	url := self url, 'posts'.
	requestType := #PostsCollection.
]

{ #category : #accessing }
TDDownloadCommand >> requestAllTodos [
	url := self url, 'todos'.
	requestType := #TodosCollection.
]

{ #category : #accessing }
TDDownloadCommand >> requestPostWithId: anInteger [
	url := self url, 'posts/', anInteger asString.
	requestType := #PostSingle.
]

{ #category : #accessing }
TDDownloadCommand >> requestPostsForUserId: anInteger [
	url := self url, 'posts?userId=', anInteger asString.
	requestType := #PostsCollection.
]

{ #category : #accessing }
TDDownloadCommand >> requestTodoWithId: anInteger [
	url := self url, 'todos/', anInteger asString.
	requestType := #TodoSingle.
]

{ #category : #accessing }
TDDownloadCommand >> requestTodosForUserId: anInteger [
	url := self url, 'todos?userId=', anInteger asString.
	requestType := #TodosCollection.
]

{ #category : #accessing }
TDDownloadCommand >> requestType [
	^ requestType.
]

{ #category : #accessing }
TDDownloadCommand >> response [
	^ ZnClient new
		url: self url;
		signalProgress: self signalProgress;
		get;
		response.
]

{ #category : #accessing }
TDDownloadCommand >> result [
	^ result.
]

{ #category : #accessing }
TDDownloadCommand >> result: anObject [
	result := anObject.
]

{ #category : #accessing }
TDDownloadCommand >> signalProgress [
	^ signalProgress.
]

{ #category : #accessing }
TDDownloadCommand >> signalProgress: aBoolean [
	signalProgress := aBoolean.
]

{ #category : #accessing }
TDDownloadCommand >> url [
	^ url.
]
