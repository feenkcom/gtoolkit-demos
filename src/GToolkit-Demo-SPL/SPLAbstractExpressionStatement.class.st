"
I am an abstract superclass for statements that contain an expression.
"
Class {
	#name : #SPLAbstractExpressionStatement,
	#superclass : #SPLStatement,
	#instVars : [
		'expression'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLAbstractExpressionStatement class >> for: anExpression [
	"Used for expression statements and print statements"
	^ self new
		expression: anExpression;
		yourself
]

{ #category : #accessing }
SPLAbstractExpressionStatement >> children [
	^ super children
		add: self expression;
		yourself
]

{ #category : #accessing }
SPLAbstractExpressionStatement >> expression [
	^ expression
]

{ #category : #accessing }
SPLAbstractExpressionStatement >> expression: anExpression [
	expression := anExpression
]
