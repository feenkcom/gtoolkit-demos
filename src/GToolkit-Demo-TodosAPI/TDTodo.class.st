Class {
	#name : #TDTodo,
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
TDTodo class >> empty [
	^ TDNullTodo uniqueInstance. 
]

{ #category : #accessing }
TDTodo class >> rawData: aDictionary [
	^ self new
		completed: (aDictionary at: 'completed' value);
		id: (aDictionary at: 'id' value);
		title: (aDictionary at: 'title' value);
		userId: (aDictionary at: 'userId' value).
]

{ #category : #accessing }
TDTodo >> completed [
	^ completed.
]

{ #category : #accessing }
TDTodo >> completed: aBoolean [
	completed := aBoolean.
]

{ #category : #accessing }
TDTodo >> gtTodoInforFor: aView [
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
TDTodo >> id [
	^ id.
]

{ #category : #accessing }
TDTodo >> id: anInteger [
	id := anInteger.
]

{ #category : #accessing }
TDTodo >> initialize [
	super initialize.
	id := 0.
	user := TDUser empty.
	title := ''.
	completed := nil.
]

{ #category : #accessing }
TDTodo >> title [
	^ title.
]

{ #category : #accessing }
TDTodo >> title: aString [
	title := aString.
]

{ #category : #accessing }
TDTodo >> user [
	^ user.
]

{ #category : #accessing }
TDTodo >> user: anObject [
	user := anObject.
]

{ #category : #accessing }
TDTodo >> userId [
	^ self user id.
]

{ #category : #accessing }
TDTodo >> userId: anInteger [
	self user: (TDUser new id: anInteger).
]
