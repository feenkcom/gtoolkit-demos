"
I encapsulate an object used as an element in an FCA Context.
"
Class {
	#name : #FCAElement,
	#superclass : #Object,
	#instVars : [
		'element'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #accessing }
FCAElement class >> for: anObject [
	^ self new
		element: anObject;
		yourself
]

{ #category : #accessing }
FCAElement >> element [
	^ element
]

{ #category : #accessing }
FCAElement >> element: anObject [
	element := anObject
]

{ #category : #printing }
FCAElement >> gtDisplayOn: stream [
	stream nextPutAll: element printString
]

{ #category : #accessing }
FCAElement >> value [
	^ self element
]
