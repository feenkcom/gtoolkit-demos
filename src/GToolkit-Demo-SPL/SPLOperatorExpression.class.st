"
I am an abstract superclass for expressions with a single character operators.
"
Class {
	#name : #SPLOperatorExpression,
	#superclass : #SPLExpression,
	#instVars : [
		'operator'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLOperatorExpression >> operator [
	^ operator
]

{ #category : #accessing }
SPLOperatorExpression >> operator: anOperator [
	| operatorString |
	operatorString := anOperator asString.
	self
		assert: (self operators includes: operatorString)
		description: 'Unexpected operator: ' , operatorString.
	operator := operatorString
]

{ #category : #accessing }
SPLOperatorExpression >> operators [
	self subclassResponsibility
]
