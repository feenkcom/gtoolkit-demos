"
I am an assignment expression node.

{{gtExample:name=SPLParserExamples>>#cascadedAssignment}}
"
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
	aStream
		print: self variable;
		nextPutAll: ' = ';
		print: self expression
]

{ #category : #stepping }
SPLAssignment >> stepInContext: aContext [
	^ self expression isReduced
		ifTrue: [ aContext environment setVariable: self variable to: self expression.
			self expression ]
		ifFalse: [ self class
				variable: self variable
				expression: (self expression stepInContext: aContext) ]
]

{ #category : #accessing }
SPLAssignment >> variable [
	^ variable
]

{ #category : #accessing }
SPLAssignment >> variable: aVariable [
	variable := aVariable
]
