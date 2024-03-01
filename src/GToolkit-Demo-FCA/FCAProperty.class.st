"
I encapsulate aproperty of an element in an FCA Context.
"
Class {
	#name : #FCAProperty,
	#superclass : #Object,
	#instVars : [
		'property'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #accessing }
FCAProperty class >> for: anObject [
	^ self new
		property: anObject;
		yourself
]

{ #category : #printing }
FCAProperty >> gtDisplayOn: stream [
	stream nextPutAll: property printString
]

{ #category : #accessing }
FCAProperty >> property [
	^ property
]

{ #category : #accessing }
FCAProperty >> property: anObject [
	property := anObject
]

{ #category : #accessing }
FCAProperty >> value [
	^ self property
]
