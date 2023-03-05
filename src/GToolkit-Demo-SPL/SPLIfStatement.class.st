Class {
	#name : #SPLIfStatement,
	#superclass : #SPLConditionStatement,
	#instVars : [
		'thenPart'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLIfStatement class >> if: anExpression then: aStatement [ 
^ self new	
	expression: anExpression;
	thenPart: aStatement;
	yourself
]

{ #category : #printing }
SPLIfStatement >> printOn: aStream [
	"todo:handle indentation"

	aStream nextPutAll: 'if '.
	self expression printOn: aStream.
	aStream nextPut: Character cr.
	self thenPart printOn: aStream
]

{ #category : #stepping }
SPLIfStatement >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ self assert: self expression isSPLBoolean.
			self expression value
				ifTrue: [ self thenPart ]
				ifFalse: [ SPLStopStatement new ] ]
		ifFalse: [ self class
				if: (self expression stepIn: aContext)
				then: self thenPart ]
]

{ #category : #accessing }
SPLIfStatement >> thenPart [
	^ thenPart
]

{ #category : #accessing }
SPLIfStatement >> thenPart: aStatement [
	thenPart := aStatement
]
