Class {
	#name : #TDNullTodoPost,
	#superclass : #TDNullModel,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDNullTodoPost >> completed [
	^ nil.
]

{ #category : #accessing }
TDNullTodoPost >> id [
	^ 0.
]

{ #category : #accessing }
TDNullTodoPost >> title [
	^ ''.
]

{ #category : #accessing }
TDNullTodoPost >> userId [
	^ 0.
]
