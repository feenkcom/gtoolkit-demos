Class {
	#name : #TDUser,
	#superclass : #TDModel,
	#instVars : [
		'id',
		'todosGroup',
		'postsGroup'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDUser class >> empty [
	^ TDNullUser uniqueInstance.
]

{ #category : #accessing }
TDUser >> gtPostsListFor: aView [
	<gtView>
	postsGroup := self requestPostsFromThisUser.
	postsGroup posts ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Posts';
		object: [ self postsGroup ];
		view: #gtPostsListFor:
]

{ #category : #accessing }
TDUser >> gtTodosListFor: aView [
	<gtView>
	todosGroup := self requestTodosFromThisUser.
	todosGroup todos ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Todos';
		object: [ self todosGroup ];
		view: #gtTodosListFor:
]

{ #category : #accessing }
TDUser >> id [
	^ id.
]

{ #category : #accessing }
TDUser >> id: anInteger [
	id := anInteger.
]

{ #category : #accessing }
TDUser >> initialize [
	super initialize.
	id := 0.
]

{ #category : #accessing }
TDUser >> postsGroup [
	^ postsGroup "ifNil: [OrderedCollection new]".
]

{ #category : #accessing }
TDUser >> requestPostsFromThisUser [
	^ TDPostsGroup new
		posts: (TDClient new request requestPostsForUserId: self id).
]

{ #category : #accessing }
TDUser >> requestTodosFromThisUser [
	^ TDTodosGroup new
		todos: (TDClient new request requestTodosForUserId: self id).
]

{ #category : #accessing }
TDUser >> todosGroup [
	^ todosGroup "ifNil: [OrderedCollection new]".
]
