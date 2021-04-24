Class {
	#name : #TDClient,
	#superclass : #Object,
	#category : #'GToolkit-Demo-TodosAPI-Client'
}

{ #category : #accessing }
TDClient >> getAlbumWithId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/albums/', anInteger asString
		ifSuccessDo: [ :result |
			| dictionary |
			dictionary := STON fromString: result.
			dictionary
				ifEmpty: [ TDAlbum empty ]
				ifNotEmpty: [ TDAlbum new rawData: dictionary ] ]
		ifErrorDo: [ TDAlbum empty ].
]

{ #category : #accessing }
TDClient >> getAlbumsForUserId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/albums?userId=', anInteger asString
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			^ TDAlbumsGroup new
				albums: (dictionaries collect: [:dict |
					TDAlbum new rawData: dict]) ]
		ifErrorDo: [ TDAlbumsGroup new ]
]

{ #category : #accessing }
TDClient >> getAllAlbums [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/albums'
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			^ TDAlbumsGroup new
				albums: (dictionaries collect: [:dict |
					TDAlbum new rawData: dict]) ]
		ifErrorDo: [ TDAlbumsGroup new ]
]

{ #category : #accessing }
TDClient >> getAllComments [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/comments'
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			TDCommentsGroup new
				comments: (dictionaries collect: [:dict |
					TDComment new rawData: dict]). ]
		ifErrorDo: [ TDCommentsGroup new ]
]

{ #category : #accessing }
TDClient >> getAllImages [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/photos'
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			TDImagesGroup new
				images: (dictionaries collect: [:dict |
					TDImage new rawData: dict]) ]
		ifErrorDo: [ TDImagesGroup new ]
]

{ #category : #accessing }
TDClient >> getAllPosts [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/posts'
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			^ TDPostsGroup new
				posts: (dictionaries collect: [:dict |
					TDPost new rawData: dict]) ]
		ifErrorDo: [ TDPostsGroup new ]
]

{ #category : #accessing }
TDClient >> getAllTodos [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/todos'
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			TDTodosGroup new
				todos: (dictionaries collect: [:dict |
					TDTodo  new rawData: dict]) ]
		ifErrorDo: [ TDTodosGroup new ]
]

{ #category : #accessing }
TDClient >> getCommentWithId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/comments/', anInteger asString
		ifSuccessDo: [ :result |
			| dictionary |
			dictionary := STON fromString: result.
			dictionary
				ifEmpty: [TDComment empty]
				ifNotEmpty: [TDComment new rawData: dictionary]]
		ifErrorDo: [ TDComment empty ]
]

{ #category : #accessing }
TDClient >> getCommentsForPostId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/comments?postId=', anInteger asString
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			^ TDCommentsGroup new
				comments: (dictionaries collect: [:dict |
					TDComment new rawData: dict]) ]
		ifErrorDo: [ TDCommentsGroup new ]
]

{ #category : #accessing }
TDClient >> getImageWithId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/comments?postId=', anInteger asString
		ifSuccessDo: [ :result |
			| dictionary |
			dictionary := STON fromString: 
			(self requestForUrl: 'https://jsonplaceholder.typicode.com/comments?postId=', anInteger asString).
			dictionary
				ifEmpty: [TDImage empty]
				ifNotEmpty: [TDImage new rawData: dictionary] ]
		ifErrorDo: [ TDImage empty ]
]

{ #category : #accessing }
TDClient >> getImagesForAlbumId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/photos?albumId=', anInteger asString
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			TDImagesGroup new
				images: (dictionaries collect: [:dict |
					TDImage new rawData: dict]) ]
		ifErrorDo: [ TDImagesGroup new ]
]

{ #category : #accessing }
TDClient >> getPostWithId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/posts/', anInteger asString
		ifSuccessDo: [ :result |
			| dictionary |
			dictionary := STON fromString: result.
			dictionary
				ifEmpty: [ TDPost empty ]
				ifNotEmpty: [ TDPost new rawData: dictionary ] ]
		ifErrorDo: [ TDPost empty ]
]

{ #category : #accessing }
TDClient >> getPostsForUserId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/posts?userId=', anInteger asString
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			TDPostsGroup new
				posts: (dictionaries collect: [:dict |
					TDPost new rawData: dict]) ]
		ifErrorDo: [ TDPostsGroup new ]
]

{ #category : #accessing }
TDClient >> getTodoWithId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/todos/', anInteger asString
		ifSuccessDo: [ :result |
			| dictionary |
			dictionary := STON fromString: result.
			dictionary
				ifEmpty: [TDTodo empty]
				ifNotEmpty: [TDTodo new rawData: dictionary] ] 
		ifErrorDo: [ TDTodo empty ]
]

{ #category : #accessing }
TDClient >> getTodosForUserId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/todos?userId=', anInteger asString
		ifSuccessDo: [ :result |
			| dictionaries |
			dictionaries := STON fromString: result.
			TDTodosGroup new
				todos: (dictionaries collect: [:dict |
					TDTodo new rawData: dict]) ]
		ifErrorDo: [ TDTodosGroup new ]
]

{ #category : #accessing }
TDClient >> getUserWithId: anInteger [
	^ self 
		requestForUrl: 'https://jsonplaceholder.typicode.com/users/', anInteger asString
		ifSuccessDo: [ :result |
			| dictionary |
			dictionary := STON fromString: result.
			dictionary
				ifEmpty: [TDUser empty]
				ifNotEmpty: [TDUser new rawData: dictionary] ]
		ifErrorDo: [ TDUser empty ]
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

{ #category : #accessing }
TDClient >> requestForUrl: anUrl ifSuccessDo: aSuccessBlock ifErrorDo: anErrorBlock [
	| result client |
	client := ZnClient new.
	result := client get: anUrl.
	^ client isSuccess 
		ifTrue: [ aSuccessBlock value: result ]
		ifFalse: [ anErrorBlock value ]
]
