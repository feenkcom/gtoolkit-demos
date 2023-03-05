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
	self
		deprecated: 'Use isSPLBoolean'
		transformWith: '`@receiver isBoolean' -> '`@receiver isSPLBoolean'.
	^ false
]

{ #category : #testing }
SPLExpression >> isNil [
	^ false
]

{ #category : #testing }
SPLExpression >> isNumber [
	self
		deprecated: 'Use isSPLNumber'
		transformWith: '`@receiver isNumber' -> '`@receiver isSPLNumber'.
	^ false
]

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

{ #category : #testing }
SPLExpression >> isString [
	self
		deprecated: 'Use isSPLString'
		transformWith: '`@receiver isString' -> '`@receiver isSPLString'.
	^ false
]

{ #category : #testing }
SPLExpression >> isValue [
	self
		deprecated: 'Use isSPLValue'
		transformWith: '`@receiver isValue' -> '`@receiver isSPLValue'.
	^ false
]

{ #category : #stepping }
SPLExpression >> stepIn: aContext [
	"I take a reduction step in the environment and return a new, step-reduced node."

	self subclassResponsibility
]
