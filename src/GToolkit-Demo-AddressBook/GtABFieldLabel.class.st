Class {
	#name : #GtABFieldLabel,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #comparing }
GtABFieldLabel >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ id = anObject id
]

{ #category : #printing }
GtABFieldLabel >> gtDisplayOn: aStream [
	super gtDisplayOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: self id;
		nextPutAll: ')'
]

{ #category : #comparing }
GtABFieldLabel >> hash [
	^ self class hash 
		bitXor: id hash
]

{ #category : #accessing }
GtABFieldLabel >> id [
	^ id
]

{ #category : #accessing }
GtABFieldLabel >> id: anId [
	self assert: [ anId notNil ].
	self assert: [ id isNil ].
	
	id := anId
]
