Class {
	#name : #SPLIfElseStatement,
	#superclass : #SPLIfStatement,
	#instVars : [
		'elsePart'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLIfElseStatement class >> if: anExpression then: aStatement else: aStatement2 [
	^ self new
		expression: anExpression;
		thenPart: aStatement;
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

{ #category : #stepping }
SPLIfElseStatement >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ self assert: self expression isSPLBoolean.
			self expression value ifTrue: [ self thenPart ] ifFalse: [ self elsePart ] ]
		ifFalse: [ self class
				if: (self expression stepIn: aContext)
				then: self thenPart
				else: self elsePart ]
]
