"
I am an abstract superclass for building concept lattices.
"
Class {
	#name : #FCAConceptBuilder,
	#superclass : #Object,
	#instVars : [
		'context',
		'bottom'
	],
	#category : #'GToolkit-Demo-FCA'
}

{ #category : #testing }
FCAConceptBuilder class >> isAbstract [
	^ self = FCAConceptBuilder
]

{ #category : #accessing }
FCAConceptBuilder >> bottom [
	^ bottom
		ifNil: [ | bottomProps bottomElts |
			bottomProps := self context sigma: BitSet empty.
			bottomElts := self context tau: bottomProps.
			bottom := FCAConcept
					context: self context
					extent: bottomElts
					intent: bottomProps ]
]

{ #category : #accessing }
FCAConceptBuilder >> context [
	^ context
]

{ #category : #accessing }
FCAConceptBuilder >> context: anObject [
	context := anObject
]
