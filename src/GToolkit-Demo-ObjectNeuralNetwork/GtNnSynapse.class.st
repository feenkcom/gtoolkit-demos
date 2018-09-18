Class {
	#name : #GtNnSynapse,
	#superclass : #Object,
	#instVars : [
		'weight',
		'from',
		'to'
	],
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #accessing }
GtNnSynapse >> from [
	^ from
]

{ #category : #accessing }
GtNnSynapse >> from: anObject [
	from := anObject
]

{ #category : #initialization }
GtNnSynapse >> initialize [
	super initialize.
	
	weight := 10
]

{ #category : #accessing }
GtNnSynapse >> to [
	^ to
]

{ #category : #accessing }
GtNnSynapse >> to: anObject [
	to := anObject
]

{ #category : #accessing }
GtNnSynapse >> weight [
	^ weight
]

{ #category : #accessing }
GtNnSynapse >> weight: anObject [
	weight := anObject
]
