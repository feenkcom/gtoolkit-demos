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

{ #category : #printing }
SPLValue >> printOn: aStream [
	self value printOn: aStream
]

{ #category : #accessing }
SPLValue >> value [
	^ value
]

{ #category : #accessing }
SPLValue >> value: aValue [
	value := aValue
]
