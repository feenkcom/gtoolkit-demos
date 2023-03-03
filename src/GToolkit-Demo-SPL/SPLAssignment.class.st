Class {
	#name : #SPLAssignment,
	#superclass : #SPLExpression,
	#instVars : [
		'variable',
		'expression'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLAssignment class >> variable: aVariable expression: anExpression [
	^ self new
		variable: aVariable;
		expression: anExpression;
		yourself
]

{ #category : #accessing }
SPLAssignment >> expression [
	^ expression
]

{ #category : #accessing }
SPLAssignment >> expression: anExpression [
	expression := anExpression
]

{ #category : #accessing }
SPLAssignment >> printOn: aStream [
	self variable printOn: aStream.
	aStream nextPutAll: ' = '.
	self expression printOn: aStream
]

{ #category : #accessing }
SPLAssignment >> variable [
	^ variable
]

{ #category : #accessing }
SPLAssignment >> variable: aVariable [
	variable := aVariable
]
