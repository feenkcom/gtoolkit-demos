Class {
	#name : #SPLUnary,
	#superclass : #SPLOperatorExpression,
	#instVars : [
		'expression'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLUnary class >> negate: anOperator expression: anExpression [
	^ self new
		operator: anOperator;
		expression: anExpression;
		yourself 
]

{ #category : #stepping }
SPLUnary >> evaluateIn: aContext [
	self assert: self expression isReduced.
	self operator = '!'
		ifTrue: [ self assert: self expression isSPLBoolean.
			^ SPLBoolean for: self expression value not ].
	self operator = '-'
		ifTrue: [ self assert: self expression isSPLNumber.
			^ SPLNumber for: self expression value negated ]
]

{ #category : #accessing }
SPLUnary >> expression [
	^ expression
]

{ #category : #accessing }
SPLUnary >> expression: anExpression [
	expression := anExpression
]

{ #category : #constants }
SPLUnary >> operators [
	^ {'!'.
		'-'}
]

{ #category : #printing }
SPLUnary >> printOn: aStream [
	aStream
		nextPutAll: self operator;
		print: self expression
]

{ #category : #stepping }
SPLUnary >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ self evaluateIn: aContext ]
		ifFalse: [ self class
				negate: self operator
				expression: (self expression stepIn: aContext) ]
]
