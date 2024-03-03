"
I am an abstract superclass of entities in a given FCA context.
"
Class {
	#name : #FCAInContext,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #accessing }
FCAInContext >> context [
	^ context
]

{ #category : #accessing }
FCAInContext >> context: anObject [
	context := anObject
]

{ #category : #printing }
FCAInContext >> gtDisplayOn: stream [
	stream nextPutAll: self value printString
]

{ #category : #printing }
FCAInContext >> printOn: stream [
	stream nextPutAll: self value printString
]

{ #category : #accessing }
FCAInContext >> value [
	^ self subclassResponsibility
]
