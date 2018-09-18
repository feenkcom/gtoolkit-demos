Class {
	#name : #GtNnConstantActivator,
	#superclass : #GtNnActivator,
	#instVars : [
		'value'
	],
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #generated }
GtNnConstantActivator class >> value: aNumber [
	^ self new value: aNumber
]

{ #category : #accessing }
GtNnConstantActivator >> value [
	^ value
]

{ #category : #accessing }
GtNnConstantActivator >> value: anObject [
	value := anObject
]

{ #category : #'as yet unclassified' }
GtNnConstantActivator >> valueWithSynapses: aCollectionOfSynapses [
	^ self value
]
