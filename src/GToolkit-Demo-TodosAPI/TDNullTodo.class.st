Class {
	#name : #TDNullTodo,
	#superclass : #TDNullModel,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDNullTodo >> completed [
	^ nil.
]

{ #category : #accessing }
TDNullTodo >> id [
	^ 0.
]

{ #category : #accessing }
TDNullTodo >> title [
	^ ''.
]

{ #category : #accessing }
TDNullTodo >> user [
	^ nil.
]

{ #category : #accessing }
TDNullTodo >> userId [
	^ 0.
]
