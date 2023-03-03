Class {
	#name : #SPLBinary,
	#superclass : #SPLOperatorExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLBinary class >> left: anExpression operator: anOperator right: anExpression2 [
	^ self new
		left: anExpression;
		operator: anOperator;
		right: anExpression2;
		yourself
]

{ #category : #accessing }
SPLBinary >> left [
	^ left
]

{ #category : #accessing }
SPLBinary >> left: anExpression [
	left := anExpression
]

{ #category : #constants }
SPLBinary >> operators [
	^ {'*'.
		'/'.
		'+'.
		'-'}
]

{ #category : #printing }
SPLBinary >> printOn: aStream [
	"Generate parentheses, even if not needed, to make the parse order clear."

	aStream nextPut: $(.
	self left printOn: aStream.
	aStream nextPutAll: self operator.
	self right printOn: aStream.
	aStream nextPut: $)
]

{ #category : #accessing }
SPLBinary >> right [
	^ right
]

{ #category : #accessing }
SPLBinary >> right: anExpression [
	right := anExpression
]
