"
```
x0 := GtNnNeuron new constant: 1.
x1 := GtNnNeuron new constant: 0.
x2 := GtNnNeuron new constant: 1.

y := GtNnNeuron new.

(x0 `> y) weight: 10.
(x1 `> y) weight: -15.
(x2 ==> y) weight: 10.

y
```


"
Class {
	#name : #GtNnNeuron,
	#superclass : #Object,
	#instVars : [
		'synapses',
		'activator'
	],
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #synapses }
GtNnNeuron >> ==> aNeuron [
	| aSynapse |
	
	aSynapse := GtNnSynapse new.
	aSynapse from: self.
	aSynapse to: aNeuron.

	self synapses add: aSynapse.
	aNeuron synapses add: aSynapse.
	^ aSynapse
]

{ #category : #accessing }
GtNnNeuron >> activator [
	^ activator
]

{ #category : #accessing }
GtNnNeuron >> activator: anObject [
	activator := anObject
]

{ #category : #synapses }
GtNnNeuron >> connectedNeurons [
	"Neurons along outgoing synapses"

	^ self neuronsAlongOutgoingSynapses
]

{ #category : #accessing }
GtNnNeuron >> constant: aNumber [
	self activator: (GtNnConstantActivator value: aNumber)
]

{ #category : #initialization }
GtNnNeuron >> defaultActivator [
	^ GtNnSigmoidActivator new
]

{ #category : #'gt-inspector-extension' }
GtNnNeuron >> gtInspectorNeuronIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	^ aComposite bloc
		title: 'Neuron';
		display: [ (GtNnNeuronStencil new neuron: self) asElement ]
]

{ #category : #'gt-inspector-extension' }
GtNnNeuron >> gtViewNeuronFor: aView [
	<gtView>
	^ aView explicit
		title: 'Neuron';
		priority: 50;
		stencil: [ GtNnNeuronStencil new neuron: self ]
]

{ #category : #synapses }
GtNnNeuron >> incomingSynapses [
	^ self synapses select: [ :each | each to == self ]
]

{ #category : #initialization }
GtNnNeuron >> initialize [
	super initialize.
	
	synapses := OrderedCollection new.
	activator := self defaultActivator
]

{ #category : #testing }
GtNnNeuron >> isBias [
	^ false
]

{ #category : #printing }
GtNnNeuron >> name [
	^ 'Neuron'
]

{ #category : #synapses }
GtNnNeuron >> neuronsAlongIncomingSynapses [
	"Return neurons along incoming synapses"
	<return: #Collection of: #GtNnNeuron>

	^ self incomingSynapses collect: #from
]

{ #category : #synapses }
GtNnNeuron >> neuronsAlongOutgoingSynapses [
	"Return neurons along outgoing synapses"
	<return: #Collection of: #GtNnNeuron>

	^ self outgoingSynapses collect: #to
]

{ #category : #synapses }
GtNnNeuron >> outgoingSynapses [
	^ self synapses select: [ :each | each from == self ]
]

{ #category : #printing }
GtNnNeuron >> printOn: aStream [
	aStream
		nextPutAll: self name;
		nextPutAll: ' (';
		print: (self value printShowingDecimalPlaces: 2);
		nextPutAll: ')'
]

{ #category : #accessing }
GtNnNeuron >> synapses [
	^ synapses
]

{ #category : #evaluating }
GtNnNeuron >> value [
	^ self activator valueWithSynapses: self incomingSynapses
]
