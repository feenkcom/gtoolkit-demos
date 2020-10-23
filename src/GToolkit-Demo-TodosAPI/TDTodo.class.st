Class {
	#name : #TDTodo,
	#superclass : #TDModel,
	#instVars : [
		'rawData'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #requirements }
TDTodo class >> empty [
	^ TDNullTodo uniqueInstance. 
]

{ #category : #accessing }
TDTodo >> completed [
	^ self rawData at: #completed.
]

{ #category : #accessing }
TDTodo >> gtTodoInforFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details' translated;
		priority: 5;
		items: [ {('Title: ' -> self title).
			('Id: ' -> self id).
			('User: ' -> self user).
			('Completed: ' -> self completed)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ];
		send: [:association | association value].
]

{ #category : #accessing }
TDTodo >> id [
	^ self rawData at: #id.
]

{ #category : #accessing }
TDTodo >> rawData [
	^ rawData.
]

{ #category : #accessing }
TDTodo >> rawData: aDictionary [
	rawData := aDictionary.
]

{ #category : #accessing }
TDTodo >> title [
	^ self rawData at: #title.
]

{ #category : #accessing }
TDTodo >> user [
	^ TDClient new getUserWithId: self userId.
]

{ #category : #accessing }
TDTodo >> userId [
	^ self rawData at: #userId.
]
