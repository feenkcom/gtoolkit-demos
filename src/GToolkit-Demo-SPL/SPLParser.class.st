"
SPL is the toy language for the [compiler construction course](https://seg.inf.unibe.ch/teaching/current/cc/) at UniBE.
I implement a parser for SPL that builds an interpreter.
"
Class {
	#name : #SPLParser,
	#superclass : #SPLGrammar,
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #'as yet unclassified' }
SPLParser >> assignment [ ^ super assignment
]

{ #category : #accessing }
SPLParser >> binaryNodeFor: node [
	| result |
	result := node first.
	node second
		do: [ :each | 
			result := SPLBinary
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

{ #category : #'as yet unclassified' }
SPLParser >> comparison [ ^ super comparison
]

{ #category : #'as yet unclassified' }
SPLParser >> declaration [ ^ super declaration
]

{ #category : #'as yet unclassified' }
SPLParser >> equality [ ^ super equality
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

{ #category : #'as yet unclassified' }
SPLParser >> identifier [ ^ super identifier
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

{ #category : #'as yet unclassified' }
SPLParser >> logicAnd [ ^ super logicAnd
]

{ #category : #'as yet unclassified' }
SPLParser >> logicOr [ ^ super logicOr
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

{ #category : #'as yet unclassified' }
SPLParser >> primary [ ^ super primary
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
