Class {
	#name : #SPLIfElseStatement,
	#superclass : #SPLIfStatement,
	#instVars : [
		'elsePart'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLIfElseStatement class >> condition: anExpression ifPart: aStatement elsePart: aStatement2 [
	^ self new
		expression: anExpression;
		ifPart: aStatement;
		elsePart: aStatement2;
		yourself
]

{ #category : #accessing }
SPLIfElseStatement >> elsePart [
	^ elsePart
]

{ #category : #accessing }
SPLIfElseStatement >> elsePart: aStatement2 [
	elsePart := aStatement2
]

{ #category : #printing }
SPLIfElseStatement >> printOn: aStream [
	"todo:handle indentation"

	super printOn: aStream.
	aStream nextPut: Character cr.
	aStream nextPutAll: 'else'.
	aStream nextPut: Character cr.
	self elsePart printOn: aStream
]
