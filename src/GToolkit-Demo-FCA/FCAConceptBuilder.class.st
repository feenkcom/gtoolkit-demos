"
I am an abstract superclass for building concept lattices.
"
Class {
	#name : #FCAConceptBuilder,
	#superclass : #Object,
	#instVars : [
		'context',
		'bottom',
		'concepts'
	],
	#category : #'GToolkit-Demo-FCA-Algorithms'
}

{ #category : #testing }
FCAConceptBuilder class >> isAbstract [
	^ self = FCAConceptBuilder
]

{ #category : #accessing }
FCAConceptBuilder >> bottom [
	^ bottom ifNil: [ self context closureFor: BitSet empty ]
]

{ #category : #accessing }
FCAConceptBuilder >> concepts [
	^ concepts ifNil: [ concepts := {self bottom} asSet ]
]

{ #category : #accessing }
FCAConceptBuilder >> context [
	^ context
]

{ #category : #accessing }
FCAConceptBuilder >> context: anFCAContext [
	context := anFCAContext
]
