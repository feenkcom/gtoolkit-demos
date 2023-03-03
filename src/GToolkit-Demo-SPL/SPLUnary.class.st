Class {
	#name : #SPLUnary,
	#superclass : #SPLOperatorExpression,
	#instVars : [
		'expression'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLUnary class >> negate: anOperator expression: anExpression [
	^ self new
		operator: anOperator;
		expression: anExpression;
		yourself 
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
	aStream nextPutAll: self operator.
	self expression printOn: aStream
]
