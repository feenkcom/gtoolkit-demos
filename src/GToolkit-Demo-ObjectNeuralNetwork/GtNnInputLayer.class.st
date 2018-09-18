Class {
	#name : #GtNnInputLayer,
	#superclass : #GtNnLayer,
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #accessing }
GtNnInputLayer >> input: aCollectionOfNumbers [
	self neuronsWithoutBias
		with: aCollectionOfNumbers
		do: [ :aNeuron :anInput | aNeuron constant: anInput ]
]
