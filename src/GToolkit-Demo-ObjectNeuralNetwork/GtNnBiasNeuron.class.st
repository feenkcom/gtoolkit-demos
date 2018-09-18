Class {
	#name : #GtNnBiasNeuron,
	#superclass : #GtNnNeuron,
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #evaluating }
GtNnBiasNeuron >> defaultActivator [
	^ GtNnConstantActivator value: 1
]

{ #category : #testing }
GtNnBiasNeuron >> isBias [
	^ true
]

{ #category : #printing }
GtNnBiasNeuron >> name [
	^ 'Bias'
]
