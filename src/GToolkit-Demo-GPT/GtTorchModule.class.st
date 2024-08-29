Class {
	#name : #GtTorchModule,
	#superclass : #PBProxyObject,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-Demo-GPT-Proxies'
}

{ #category : #'as yet unclassified' }
GtTorchModule class >> pythonClass [
	^ 'torch.nn.modules.module.Module'
]

{ #category : #'as yet unclassified' }
GtTorchModule >> gtDependenciesGraphFor: aView [
	<gtView>
	| standardEdge |
	standardEdge := BlBorder paint: (Color gray alpha: 0.2) width: 2.
	^ aView mondrian
		title: 'Modules';
		priority: 10;
		painting: [ :m | 
			m nodes
				stencil: [ :each | 
					| element |
					element := BlTextElement new.
					element
						text: each name asRopedText;
						zIndex: 1;
						when: BlClickEvent
							do: [ :e | 
								e consumed: true.
								element phlow spawnObject: each ];
						when: BlMouseEnterEvent
							do: [ :anEvent | 
								anEvent currentTarget graph connectedEdges incoming
									do: [ :inner | 
										inner element border: (BlBorder paint: (Color blue alpha: 0.5) width: 3).
										inner fromElement background: (Color blue alpha: 0.2) ].
								anEvent currentTarget graph connectedEdges outgoing
									do: [ :inner | 
										inner element border: (BlBorder paint: (Color red alpha: 0.5) width: 3).
										inner toElement background: (Color red alpha: 0.2) ] ];
						when: BlMouseLeaveEvent
							do: [ :anEvent | 
								anEvent currentTarget graph connectedEdges
									do: [ :inner | 
										inner element border: standardEdge.
										inner fromElement background: Color transparent.
										inner toElement background: Color transparent ] ] ];
				with: ((self deepCollect: #namedChildrenList) asSet
						add: self;
						yourself).
			m edges
				shape: [ :each | 
					BlManhattanLineElement new
						zIndex: 0;
						beFixedTo;
						fixedDistance: 10;
						cornerRadius: 10;
						border: standardEdge;
						toHead: (BlArrowheadSimpleArrow new
								border: (BlBorder builder
										paint: (Color gray alpha: 0.2);
										width: 2;
										build)) ];
				fromRightCenter;
				toLeftCenter;
				connectToAll: #namedChildrenList.
			m layout
				custom: (GtGradHorizontalDominanceTreeLayout new
						levelDistance: 10;
						nodeDistance: 10) ]
]

{ #category : #accessing }
GtTorchModule >> name [
	^ name
]

{ #category : #accessing }
GtTorchModule >> name: anObject [
	name := anObject
]

{ #category : #'as yet unclassified' }
GtTorchModule >> namedChildrenList [
	^ (self newCommandStringFactory
		bindingAt: #self put: self;
		script: '';
		resultExpression: 'list(self.named_children())';
		sendAndWait) collect: [ :aPair | aPair second name: aPair first ]
]
