Class {
	#name : #TDClient,
	#superclass : #Object,
	#category : #'GToolkit-Demo-TodosAPI-Client'
}

{ #category : #accessing }
TDClient >> getAllComments [
	| dictionaries |
	dictionaries := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/comments').
	^ dictionaries collect: [:dict |
			TDComment rawData: dict].
]

{ #category : #accessing }
TDClient >> getAllPosts [
	| dictionaries |
	dictionaries := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/posts').
	^ TDPostsGroup new
		posts: (dictionaries collect: [:dict |
			TDPost rawData: dict]).
]

{ #category : #accessing }
TDClient >> getAllTodos [
	| dictionaries |
	dictionaries := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/todos').
	^ TDTodosGroup new
		todos: (dictionaries collect: [:dict |
			TDTodo rawData: dict]).
]

{ #category : #accessing }
TDClient >> getCommentWithId: anInteger [
	| dictionary |
	dictionary := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/comments/', anInteger asString).
	^ dictionary
		ifEmpty: [TDComment empty]
		ifNotEmpty: [TDComment rawData: dictionary].
]

{ #category : #accessing }
TDClient >> getCommentsForPostId: anInteger [
	| dictionaries |
	dictionaries := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/comments?postId=', anInteger asString).
	^ dictionaries collect: [:dict |
			TDComment rawData: dict].
]

{ #category : #accessing }
TDClient >> getPostWithId: anInteger [
	| dictionary |
	dictionary := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/posts/', anInteger asString).
	^ dictionary
		ifEmpty: [TDPost empty]
		ifNotEmpty: [TDPost rawData: dictionary].
]

{ #category : #accessing }
TDClient >> getPostsForUserId: anInteger [
	| dictionaries |
	dictionaries := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/posts?userId=', anInteger asString).
	^ TDPostsGroup new
		posts: (dictionaries collect: [:dict |
			TDPost rawData: dict]).
]

{ #category : #accessing }
TDClient >> getTodoWithId: anInteger [
	| dictionary |
	dictionary := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/todos/', anInteger asString).
	^ dictionary
		ifEmpty: [TDTodo empty]
		ifNotEmpty: [TDTodo rawData: dictionary].
]

{ #category : #accessing }
TDClient >> getTodosForUserId: anInteger [
	| dictionaries |
	dictionaries := STON fromString: 
		(self requestForUrl: 'https://jsonplaceholder.typicode.com/todos?userId=', anInteger asString).
	^ TDTodosGroup new
		todos: (dictionaries collect: [:dict |
			TDTodo rawData: dict]).
]

{ #category : #accessing }
TDClient >> getUserWithId: anInteger [
	^ TDUser new
		id: anInteger.
]

{ #category : #accessing }
TDClient >> initialize [
	super initialize.
]

{ #category : #accessing }
TDClient >> requestForUrl: anUrl [
	^ ZnClient new
		url: anUrl;
		get.
]
