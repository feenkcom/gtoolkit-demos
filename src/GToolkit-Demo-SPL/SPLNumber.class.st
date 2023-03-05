Class {
	#name : #SPLNumber,
	#superclass : #SPLValue,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLNumber >> isNumber [
	self
		deprecated: 'Use isSPLNumber'
		transformWith: '`@receiver isNumber' -> '`@receiver isSPLNumber'.
	^ true
]

{ #category : #testing }
SPLNumber >> isSPLNumber [
	^ true
]
