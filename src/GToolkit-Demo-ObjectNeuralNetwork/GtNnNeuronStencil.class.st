Class {
	#name : #GtNnNeuronStencil,
	#superclass : #BrStencil,
	#instVars : [
		'neuron'
	],
	#category : #'GToolkit-Demo-ObjectNeuralNetwork'
}

{ #category : #'api - instantiation' }
GtNnNeuronStencil >> create [
	| incomingNodes outgoingNodes incomingContainer outgoingContainer neuronElement container incomingEdges outgoingEdges |

	incomingNodes := self neuron neuronsAlongIncomingSynapses collect: [ :aNeuron |
		BlTextElement new
			in: [ :anElement | anElement graph model: aNeuron ];
			text: (aNeuron value printShowingDecimalPlaces: 1) asRopedText;
			margin: (BlInsets all: 10);
			padding: (BlInsets all: 5) ].

	outgoingNodes := self neuron neuronsAlongOutgoingSynapses collect: [ :aNeuron |
		BlTextElement new
			in: [ :anElement | anElement graph model: aNeuron ];
			text: (aNeuron value printShowingDecimalPlaces: 1) asRopedText;
			margin: (BlInsets all: 10);
			padding: (BlInsets all: 5) ].

	incomingContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ];
		addChildren: incomingNodes.

	outgoingContainer := BlElement new
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ];
		addChildren: outgoingNodes.

	neuronElement := BlTextElement new
		text: (self neuron value printShowingDecimalPlaces: 2) asRopedText;
		padding: (BlInsets all: 30);
		margin: (BlInsets top: 40 left: 120 bottom: 40 right: 120);
		geometry: BlCircleGeometry new;
		background: Color white;
		border: (BlBorder paint: Color gray width: 3).

	incomingEdges := incomingNodes collect: [ :aNode |
		| aBorderBuilder |

		aBorderBuilder := BlBorder builder
			paint: Color gray;
			width: 1.

		aNode graph model isBias
			ifTrue: [ aBorderBuilder dashed ].

		BlLineElement new
			border: aBorderBuilder build;
			constraintsDo: [ :c | c ignoreByLayout ];
			fromAnchor: (BlElementCenterRightAnchor element: aNode);
			toAnchor: (BlNearestPositionTightCircleAnchor nearestTo: aNode from: neuronElement);
			toHead: (BlArrowheadSimpleArrow new border: aBorderBuilder solid build; arrowLengthFraction: 12);
			addChild: (BlTextElement new
				text: (aNode graph model value asRopedText italic foreground: Color darkGray; fontSize: 10);
				padding: (BlInsets all: 1);
				background: (Color white alpha: 0.9);
				constraintsDo: [ :c |
					c ignoreByLayout.
					c ignored horizontal alignCenter.
					c ignored vertical alignCenter ])  ].

	outgoingEdges := outgoingNodes collect: [ :aNode |
		| aBorderBuilder |
		
		aBorderBuilder := BlBorder builder
			paint: Color gray;
			width: 1.
		
		aNode graph model isBias
			ifTrue: [ aBorderBuilder dashed ].

		BlLineElement new
			border: aBorderBuilder build;
			constraintsDo: [ :c | c ignoreByLayout ];
			fromAnchor: (BlNearestPositionTightCircleAnchor nearestTo: aNode from: neuronElement);
			toAnchor: (BlElementCenterLeftAnchor element: aNode);
			toHead: (BlArrowheadSimpleArrow new border: aBorderBuilder solid build; arrowLengthFraction: 12);
			addChild: (BlTextElement new
				text: (aNode graph model value asRopedText italic foreground: Color darkGray; fontSize: 10);
				padding: (BlInsets all: 1);
				background: (Color white alpha: 0.9);
				constraintsDo: [ :c |
					c ignoreByLayout.
					c ignored horizontal alignCenter.
					c ignored vertical alignCenter ]) ].

	container := BlElement new
		layout: BlLinearLayout horizontal alignCenter;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical fitContent ];
		addChildren: { incomingContainer . neuronElement . outgoingContainer }, incomingEdges, outgoingEdges.
		
	^ container


]

{ #category : #accessing }
GtNnNeuronStencil >> neuron [
	<return: #GtNnNeuron>

	^ neuron
]

{ #category : #accessing }
GtNnNeuronStencil >> neuron: aGtNnNeuron [
	neuron := aGtNnNeuron
]
