Class {
	#name : #SPLValue,
	#superclass : #SPLExpression,
	#instVars : [
		'value'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLValue class >> for: aValue [
	^ self new value: aValue
]

{ #category : #testing }
SPLValue >> isReduced [
	^  true
]

{ #category : #printing }
SPLValue >> printOn: aStream [
	self value printOn: aStream
]

{ #category : #stepping }
SPLValue >> stepIn: aContext [
	"Should we raise an error, or just return ourself?"

	^ self
]

{ #category : #accessing }
SPLValue >> value [
	^ value
]

{ #category : #accessing }
SPLValue >> value: aValue [
	value := aValue
]
