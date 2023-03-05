Class {
	#name : #SPLAssignment,
	#superclass : #SPLExpression,
	#instVars : [
		'variable',
		'expression'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
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

{ #category : #stepping }
SPLAssignment >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ aContext environment at: self variable value put: self expression.
			self expression ]
		ifFalse: [ self class
				variable: self variable
				expression: (self expression stepIn: aContext) ]
]

{ #category : #accessing }
SPLAssignment >> variable [
	^ variable
]

{ #category : #accessing }
SPLAssignment >> variable: aVariable [
	variable := aVariable
]
