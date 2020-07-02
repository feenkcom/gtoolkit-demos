Class {
	#name : #TDTodoPost,
	#superclass : #TDModel,
	#instVars : [
		'completed',
		'title',
		'id',
		'user'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDTodoPost class >> empty [
	^ TDNullTodoPost uniqueInstance. 
]

{ #category : #accessing }
TDTodoPost >> completed [
	^ completed.
]

{ #category : #accessing }
TDTodoPost >> completed: aBoolean [
	completed := aBoolean.
]

{ #category : #accessing }
TDTodoPost >> gtTodoInforFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details' translated;
		priority: 5;
		items: [ { 
			'Title: ' -> self title asString.
			'Id: ' -> self id asString.
			'User ID: ' -> self userId asString.
			'Completed: ' -> self completed} ];
		column: 'Property' translated format: [ :assoc | assoc key ];
		column: 'Value' translated format: [ :assoc | assoc value ].
]

{ #category : #accessing }
TDTodoPost >> id [
	^ id.
]

{ #category : #accessing }
TDTodoPost >> id: anInteger [
	id := anInteger.
]

{ #category : #accessing }
TDTodoPost >> initialize [
	super initialize.
	id := 0.
	user := TDUser empty.
	title := ''.
	completed := nil.
]

{ #category : #accessing }
TDTodoPost >> title [
	^ title.
]

{ #category : #accessing }
TDTodoPost >> title: aString [
	title := aString.
]

{ #category : #accessing }
TDTodoPost >> user [
	^ user.
]

{ #category : #accessing }
TDTodoPost >> user: anObject [
	user := anObject.
]

{ #category : #accessing }
TDTodoPost >> userId [
	^ user idValue.
]

{ #category : #accessing }
TDTodoPost >> userId: anInteger [
	self user: (TDUser new 
		idValue: anInteger;
		searchType: #Todo).
]
