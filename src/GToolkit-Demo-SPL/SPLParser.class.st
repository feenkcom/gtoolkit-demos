"
SPL is the toy language for the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.
I implement a parser for SPL that builds an interpreter.
"
Class {
	#name : #SPLParser,
	#superclass : #SPLGrammar,
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #accessing }
SPLParser >> assignment [
	^ super assignment
]

{ #category : #accessing }
SPLParser >> assignmentExpression [
	^ super assignmentExpression
		==> [ :node | SPLAssignment variable: node first expression: node third ]
]

{ #category : #accessing }
SPLParser >> binaryNodeFor: node [
	^ self binaryNodeFor: node usingClass: SPLBinary
]

{ #category : #accessing }
SPLParser >> binaryNodeFor: node usingClass: aNodeClass [
	| result |
	result := node first.
	node second
		do: [ :each | 
			result := aNodeClass
					left: result
					operator: each first
					right: each second ].
	^ result
]

{ #category : #'as yet unclassified' }
SPLParser >> block [ ^ super block
]

{ #category : #accessing }
SPLParser >> boolean [
	^ super boolean ==> [ :node | SPLBoolean for: node = 'true' ]
]

{ #category : #accessing }
SPLParser >> comparison [
	^ super comparison ==> [ :node | self binaryNodeFor: node ]
]

{ #category : #'as yet unclassified' }
SPLParser >> declaration [ ^ super declaration
]

{ #category : #accessing }
SPLParser >> equality [
	^ super equality ==> [ :node | self binaryNodeFor: node ]
]

{ #category : #'as yet unclassified' }
SPLParser >> exprStmt [ ^ super exprStmt
]

{ #category : #'as yet unclassified' }
SPLParser >> expression [ ^ super expression
]

{ #category : #accessing }
SPLParser >> factor [
	^ super factor ==> [ :node | self binaryNodeFor: node ]
]

{ #category : #accessing }
SPLParser >> float [
	^ super float flatten ==> [ :node | SPLNumber for: node asNumber ]
]

{ #category : #accessing }
SPLParser >> identifier [
	^ super identifier flatten ==> [ :node | SPLVariable for: node ]
]

{ #category : #'as yet unclassified' }
SPLParser >> ifStmt [ ^ super ifStmt
]

{ #category : #accessing }
SPLParser >> integer [
	^ super integer flatten ==> [ :node | SPLNumber for: node asInteger ]
]

{ #category : #'as yet unclassified' }
SPLParser >> keyword [ ^ super keyword
]

{ #category : #accessing }
SPLParser >> logicAnd [
	^ super logicAnd
		==> [ :node | self binaryNodeFor: node usingClass: SPLLogicalBinary ]
]

{ #category : #accessing }
SPLParser >> logicOr [
	^ super logicOr
		==> [ :node | self binaryNodeFor: node usingClass: SPLLogicalBinary ]
]

{ #category : #accessing }
SPLParser >> negatedUnary [
	^ super negatedUnary
		==> [ :node | SPLUnary negate: node first expression: node second ]
]

{ #category : #'as yet unclassified' }
SPLParser >> number [ ^ super number
]

{ #category : #accessing }
SPLParser >> parenthesizedExpression [
	^ super parenthesizedExpression ==> #second
]

{ #category : #accessing }
SPLParser >> primary [
	^ super primary
]

{ #category : #'as yet unclassified' }
SPLParser >> printStmt [ ^ super printStmt
]

{ #category : #'as yet unclassified' }
SPLParser >> program [ ^ super program
]

{ #category : #'as yet unclassified' }
SPLParser >> start [ ^ super start
]

{ #category : #'as yet unclassified' }
SPLParser >> statement [ ^ super statement
]

{ #category : #accessing }
SPLParser >> string [
	^ super string ==> [ :node | SPLString for: ('' join: node second) ]
]

{ #category : #accessing }
SPLParser >> term [
	^ super term ==> [ :node | self binaryNodeFor: node ]
]

{ #category : #accessing }
SPLParser >> unary [
	^ super unary
]

{ #category : #'as yet unclassified' }
SPLParser >> varDecl [ ^ super varDecl
]

{ #category : #'as yet unclassified' }
SPLParser >> whileStmt [ ^ super whileStmt
]
