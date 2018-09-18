Class {
	#name : #GtNnSigmoidActivator,
	#superclass : #GtNnActivator,
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #'as yet unclassified' }
GtNnSigmoidActivator >> valueWithSynapses: aCollectionOfSynapses [
	| aLinearCombination |
	
	aLinearCombination := aCollectionOfSynapses inject: 0 into: [ :memo :each |
		memo + (each weight * each from value) ].
	
	^ 1.0 / (1 + (Float e raisedTo: (aLinearCombination negated)))
]
