"
I am the root of classes that represent SPL expressions.
"
Class {
	#name : #SPLExpression,
	#superclass : #SPLNode,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLExpression >> isBoolean [
	^ false
]

{ #category : #testing }
SPLExpression >> isNil [
	^ false
]

{ #category : #testing }
SPLExpression >> isNumber [
	^ false
]

{ #category : #testing }
SPLExpression >> isString [
	^ false
]

{ #category : #testing }
SPLExpression >> isValue [
	^ false
]

{ #category : #stepping }
SPLExpression >> stepIn: aContext [
	"I take a reduction step in the environment and return a new, step-reduced node."

	self subclassResponsibility
]
