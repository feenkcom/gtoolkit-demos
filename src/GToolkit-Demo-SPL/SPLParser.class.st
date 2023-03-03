Class {
	#name : #SPLParser,
	#superclass : #SPLGrammar,
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #'as yet unclassified' }
SPLParser >> assignment [ ^ super assignment
]

{ #category : #'as yet unclassified' }
SPLParser >> block [ ^ super block
]

{ #category : #accessing }
SPLParser >> boolean [
	^ super boolean ==> [ :node | node = 'true' ]
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

{ #category : #'as yet unclassified' }
SPLParser >> factor [ ^ super factor
]

{ #category : #accessing }
SPLParser >> float [
	^ super float flatten ==> [ :node | node asNumber ]
]

{ #category : #'as yet unclassified' }
SPLParser >> identifier [ ^ super identifier
]

{ #category : #'as yet unclassified' }
SPLParser >> ifStmt [ ^ super ifStmt
]

{ #category : #accessing }
SPLParser >> integer [
	^ super integer flatten ==> [ :node | node asInteger ]
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

{ #category : #'as yet unclassified' }
SPLParser >> number [ ^ super number
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
	^ super string ==> [ :node | '' join: node second ]
]

{ #category : #'as yet unclassified' }
SPLParser >> term [ ^ super term
]

{ #category : #'as yet unclassified' }
SPLParser >> unary [ ^ super unary
]

{ #category : #'as yet unclassified' }
SPLParser >> varDecl [ ^ super varDecl
]

{ #category : #'as yet unclassified' }
SPLParser >> whileStmt [ ^ super whileStmt
]
