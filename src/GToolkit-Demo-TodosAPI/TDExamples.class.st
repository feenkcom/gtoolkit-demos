Class {
	#name : #TDExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-TodosAPI-Examples'
}

{ #category : #accessing }
TDExamples >> requestAllTodos [
	<gtExample>
	| client |
	client := TDClient new
		getAllTodos.
	
	self assert: client todos isNil not.
	
	^ client.
]

{ #category : #accessing }
TDExamples >> requestAllTodosFromUserWithIdFive [
	<gtExample>
	| client |
	client := TDClient new
		getAllTodosForUserId: 5.
	
	self assert:client todos isNil not.
	self assert: (client todos first user idValue) equals: 5.
	self assert: (client todos last user idValue) equals: 5.
	
	^ client.
]

{ #category : #accessing }
TDExamples >> requestTodoWithIdEight [
	<gtExample>
	| client |
	client := TDClient new
		getTodoWithId: 8.
	
	self assert: client todos size equals: 1.
	self assert: client todos first id equals: 8.
	
	^ client.
]
