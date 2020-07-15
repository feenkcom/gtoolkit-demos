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
		items: [ {('Title: ' -> self title).
			('Id: ' -> self id).
			('User ID: ' -> self userId).
			('Completed: ' -> self completed)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ]
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
	^ self user id.
]

{ #category : #accessing }
TDTodoPost >> userId: anInteger [
	self user: (TDUser new id: anInteger).
]
