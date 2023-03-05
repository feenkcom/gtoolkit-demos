Class {
	#name : #SPLBoolean,
	#superclass : #SPLValue,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLBoolean >> isBoolean [
	self
		deprecated: 'Use isSPLBoolean'
		transformWith: '`@receiver isBoolean' -> '`@receiver isSPLBoolean'.
	^ true
]

{ #category : #testing }
SPLBoolean >> isSPLBoolean [
	^ true
]
