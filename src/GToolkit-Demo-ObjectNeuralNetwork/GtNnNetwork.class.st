"
[[[
network := GtNnNetwork new.
network inputs: 2.
network outputs: 2.
network hidden: 0 of: 5.
network connectAll.

network input: { 1 . 2 }
]]]
"
Class {
	#name : #GtNnNetwork,
	#superclass : #Object,
	#instVars : [
		'inputLayer',
		'hiddenLayers',
		'outputLayer'
	],
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #generated }
GtNnNetwork class >> constant: aNumber [
	^ self new
		activator: (GtNnConstantActivator value: aNumber)
]

{ #category : #conencting }
GtNnNetwork >> connectAll [
	self layers overlappingPairsDo: [ :aLayer :anotherLayer |
		aLayer connectToLayer: anotherLayer ]
]

{ #category : #'gt-inspector-extension' }
GtNnNetwork >> gtInspectorLayersIn: aComposite [
	<gtInspectorPresentationOrder: 2>

	^ aComposite list
		title: 'Layers';
		display: [ self layers ]
]

{ #category : #'gt-inspector-extension' }
GtNnNetwork >> gtInspectorNetworkGraphIn: aComposite [
	<gtInspectorPresentationOrder: 1>
	
	^ aComposite blocMondrian
		title: 'Graph';
		painting: [ :view | self gtInspectorPaintNetworkIn: view ] 
]

{ #category : #'gt-inspector-extension' }
GtNnNetwork >> gtInspectorPaintNetworkIn: aMondrianView [
	| nodes |

	nodes := self neurons.
	
	aMondrianView nodes
		shape: [ :each |
			| aBorder |
			
			aBorder := each isBias
				ifTrue: [ BlBorder builder dashed paint: Color lightGray; width: 1; build  ]
				ifFalse: [ BlBorder paint: Color lightGray width: 1 ].
			
			BlElement new
				geometry: BlEllipseGeometry new;
				size: 20@20;
				layout: BlLinearLayout horizontal alignCenter;
				border: aBorder;
				addChild: (BlTextElement new
					clipChildren: false;
					preventMouseEvents;
					text: (each value asString asRopedText monospace fontSize: 7)) ];
		with: nodes.

	aMondrianView edges 
		fromRightCenter;
		toLeftCenter;
		connectToAll: #connectedNeurons.
	
	aMondrianView layout horizontalTree nodesAlignment: GtGradTreeNodesCenterAlignment new.
]

{ #category : #accessing }
GtNnNetwork >> hidden: aNumber of: aSize [
	aNumber timesRepeat: [ hiddenLayers add: (GtNnHiddenLayer size: aSize) ]
]

{ #category : #initialization }
GtNnNetwork >> initialize [
	super initialize.
	
	hiddenLayers := OrderedCollection new
]

{ #category : #accessing }
GtNnNetwork >> input: aCollection [
	inputLayer input: aCollection
]

{ #category : #accessing }
GtNnNetwork >> inputs: aNumber [
	inputLayer := GtNnInputLayer size: aNumber
]

{ #category : #accessing }
GtNnNetwork >> layers [
	^ { inputLayer }, hiddenLayers, { outputLayer }
]

{ #category : #accessing }
GtNnNetwork >> neurons [
	^ self layers flatCollect: #neurons
]

{ #category : #accessing }
GtNnNetwork >> outputs: aNumber [
	outputLayer := GtNnOutputLayer size: aNumber
]
