Class {
	#name : #SPLString,
	#superclass : #SPLValue,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLString >> isSPLString [
	^ true
]

{ #category : #testing }
SPLString >> isString [
	self
		deprecated: 'Use isSPLString'
		transformWith: '`@receiver isString' -> '`@receiver isSPLString'.
	^ true
]

{ #category : #printing }
SPLString >> printOn: aStream [
	aStream
		nextPut: $";
		nextPutAll: self value;
		nextPut: $"
]
