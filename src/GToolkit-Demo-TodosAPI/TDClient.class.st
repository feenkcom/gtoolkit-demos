Class {
	#name : #TDClient,
	#superclass : #Object,
	#instVars : [
		'signalProgress'
	],
	#category : #'GToolkit-Demo-TodosAPI-Client'
}

{ #category : #accessing }
TDClient >> getAllPosts [
	^TDNullUser new
		posts: self request requestAllPosts.
]

{ #category : #accessing }
TDClient >> getAllTodos [
	^ TDNullUser new
		todos: self request requestAllTodos.
]

{ #category : #accessing }
TDClient >> getCommentWithId: anInteger [
	^ (self request
		requestCommentWithId: anInteger) ifNil: [TDComment empty].
]

{ #category : #accessing }
TDClient >> getPostWithId: anInteger [
	^ (self request
		requestPostWithId: anInteger) ifNil: [TDPost empty].
]

{ #category : #accessing }
TDClient >> getTodoWithId: anInteger [
	^ (self request
		requestTodoWithId: anInteger) ifNil: [TDTodo empty].
]

{ #category : #accessing }
TDClient >> getUserWithId: anInteger [
	^ TDUser new
		id: anInteger.
]

{ #category : #accessing }
TDClient >> initialize [
	super initialize.
	signalProgress := false.
]

{ #category : #accessing }
TDClient >> request [
	^ TDDownloadCommand new
		signalProgress: self signalProgress.
]

{ #category : #accessing }
TDClient >> signalProgress [
	^ signalProgress.
]

{ #category : #accessing }
TDClient >> signalProgress: aBoolean [
	signalProgress := aBoolean.
]
