Class {
	#name : #SimpleExpressionInterpreter,
	#superclass : #SimpleExpressionParser,
	#category : #'GToolkit-Demo-PetitParser-PetitParser'
}

{ #category : #accessing }
SimpleExpressionInterpreter >> add [
	^ super add
		==> [ :node | 
			node isNumber 
				ifTrue: [ node ] 
				ifFalse: [ node first + node third ] ]
]

{ #category : #accessing }
SimpleExpressionInterpreter >> dec [
	^ super dec ==> [ :node | node asString asNumber ]
]

{ #category : #'as yet unclassified' }
SimpleExpressionInterpreter >> goal [ ^ super goal
]

{ #category : #accessing }
SimpleExpressionInterpreter >> mul [
	^ super mul
		==> [ :node | 
			node isNumber 
				ifTrue: [ node ] 
				ifFalse: [ node first * node third ] ]
]

{ #category : #accessing }
SimpleExpressionInterpreter >> prim [
	^ super prim
		==> [ :node | 
			node isNumber 
				ifTrue: [ node ] 
				ifFalse: [ node second ] ]
]

{ #category : #'as yet unclassified' }
SimpleExpressionInterpreter >> start [ ^ super start
]
