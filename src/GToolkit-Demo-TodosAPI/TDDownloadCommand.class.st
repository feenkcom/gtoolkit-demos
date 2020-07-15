Class {
	#name : #TDDownloadCommand,
	#superclass : #Object,
	#instVars : [
		'signalProgress',
		'znClient',
		'url',
		'result'
	],
	#category : #'GToolkit-Demo-TodosAPI-Command'
}

{ #category : #accessing }
TDDownloadCommand >> initialize [
	super initialize.
	url := 'https://jsonplaceholder.typicode.com/'
]

{ #category : #accessing }
TDDownloadCommand >> requestAllComments [
	| aResponse |
	url := self url, 'comments'.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readCommentsInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestAllPosts [
	| aResponse |
	url := self url, 'posts'.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readPostsInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestAllTodos [
	| aResponse |
	url := self url, 'todos'.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readTodosInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestCommentWithId: anInteger [
	| aResponse |
	url := self url, 'comments/', anInteger asString.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readCommentInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestCommentsForPostId: anInteger [
	| aResponse |
	url := self url, 'comments?postId=', anInteger asString.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readCommentsInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestPostWithId: anInteger [
	| aResponse |
	url := self url, 'posts/', anInteger asString.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readPostInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestPostsForUserId: anInteger [
	| aResponse |
	url := self url, 'posts?userId=', anInteger asString.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readPostsInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestTodoWithId: anInteger [
	| aResponse |
	url := self url, 'todos/', anInteger asString.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readTodoInfo: aResponse).
	^ self result.
]

{ #category : #accessing }
TDDownloadCommand >> requestTodosForUserId: anInteger [
	| aResponse |
	url := self url, 'todos?userId=', anInteger asString.
	aResponse := self response.
	aResponse isSuccess
		ifFalse: [^ self result ].
	aResponse := aResponse contents.
	self result: (TDJsonMapping readTodosInfo: aResponse).
	^ self result.
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
