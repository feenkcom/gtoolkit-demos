Class {
	#name : #GtNnLayer,
	#superclass : #Object,
	#instVars : [
		'neurons'
	],
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #accessing }
GtNnLayer class >> size: aNumberOfNeurons [
	^ self new
		addBias;
		addAll: (aNumberOfNeurons timesCollect: [ GtNnNeuron new ])
]

{ #category : #accessing }
GtNnLayer >> add: aNeuron [
	self neurons add: aNeuron
]

{ #category : #accessing }
GtNnLayer >> addAll: aCollectionOfNeurons [
	self neurons addAll: aCollectionOfNeurons
]

{ #category : #initialization }
GtNnLayer >> addBias [
	self add: GtNnBiasNeuron new
]

{ #category : #connection }
GtNnLayer >> connectToLayer: aLayer [
	self neurons do: [ :myNeuron |
		aLayer neuronsWithoutBias
			do: [ :otherNeuron | myNeuron ==> otherNeuron ] ]
]

{ #category : #'gt-inspector-extension' }
GtNnLayer >> gtInspectorNeuronsIn: aComposite [
	<gtInspectorPresentationOrder: 10>

	^ aComposite list
		title: 'Neurons';
		display: [ self neurons ]
]

{ #category : #initialization }
GtNnLayer >> initialize [
	super initialize.
	
	neurons := OrderedCollection new
]

{ #category : #accessing }
GtNnLayer >> neurons [
	^ neurons
]

{ #category : #accessing }
GtNnLayer >> neuronsWithoutBias [
	^ self neurons reject: [ :each | each isBias ]
]
