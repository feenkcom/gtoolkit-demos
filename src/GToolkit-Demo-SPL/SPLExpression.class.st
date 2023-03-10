"
I am the root of classes that represent SPL expressions.
"
Class {
	#name : #SPLExpression,
	#superclass : #SPLNode,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLExpression >> isSPLBoolean [
	^ false
]

{ #category : #testing }
SPLExpression >> isSPLNil [
	^ false
]

{ #category : #testing }
SPLExpression >> isSPLNumber [
	^ false
]

{ #category : #testing }
SPLExpression >> isSPLString [
	^ false
]

{ #category : #testing }
SPLExpression >> isSPLValue [
	^ false
]

{ #category : #stepping }
SPLExpression >> stepInContext: aContext [
	"I take a reduction step in the environment and return a new, step-reduced node."

	self subclassResponsibility
]
