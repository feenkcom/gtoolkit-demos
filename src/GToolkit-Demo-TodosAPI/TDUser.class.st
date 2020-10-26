Class {
	#name : #TDUser,
	#superclass : #TDModel,
	#instVars : [
		'todosGroup',
		'postsGroup',
		'rawData',
		'albumsGroup'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDUser class >> empty [
	^ TDNullUser uniqueInstance.
]

{ #category : #accessing }
TDUser >> albumsGroup [
	^ albumsGroup ifNil: [ albumsGroup := self requestAlbumsFromThisUser ].
]

{ #category : #accessing }
TDUser >> email [
	^ self rawData at: #email.
]

{ #category : #accessing }
TDUser >> gtAlbumsListFor: aView [
	<gtView>
	self albumsGroup albums ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Albums';
		priority: 9;
		object: [ self albumsGroup ];
		view: #gtAlbumsListFor:
]

{ #category : #accessing }
TDUser >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		priority: 2;
		items: [ {('Name: ' -> self name).
			('Username: ' -> self username).
			('ID: ' -> self id).
			('Email: ' -> self email).
			('Phone: ' -> self phone)} ];
		column: 'Key' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ];
		send: [:association | association value].
]

{ #category : #accessing }
TDUser >> gtPostsListFor: aView [
	<gtView>
	self postsGroup posts ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Posts';
		priority: 6;
		object: [ self postsGroup ];
		view: #gtPostsListFor:
]

{ #category : #accessing }
TDUser >> gtTodosListFor: aView [
	<gtView>
	self todosGroup todos ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Todos';
		priority: 5;
		object: [ self todosGroup ];
		view: #gtTodosListFor:
]

{ #category : #accessing }
TDUser >> id [
	^ self rawData at: #id.
]

{ #category : #accessing }
TDUser >> name [
	^ self rawData at: #name.
]

{ #category : #accessing }
TDUser >> phone [
	^ self rawData at: #phone.
]

{ #category : #accessing }
TDUser >> postsGroup [
	^ postsGroup ifNil: [ postsGroup := self requestPostsFromThisUser ].
]

{ #category : #accessing }
TDUser >> rawData [
	^ rawData.
]

{ #category : #accessing }
TDUser >> rawData: aDictionary [
	rawData := aDictionary.
]

{ #category : #accessing }
TDUser >> requestAlbumsFromThisUser [
	^ TDClient new getAlbumsForUserId: self id.
]

{ #category : #accessing }
TDUser >> requestPostsFromThisUser [
	^ TDClient new getPostsForUserId: self id.
]

{ #category : #accessing }
TDUser >> requestTodosFromThisUser [
	^ TDClient new getTodosForUserId: self id.
]

{ #category : #accessing }
TDUser >> todosGroup [
	^ todosGroup ifNil: [ todosGroup := self requestTodosFromThisUser ].
]

{ #category : #accessing }
TDUser >> username [
	^ self rawData at: #username.
]
