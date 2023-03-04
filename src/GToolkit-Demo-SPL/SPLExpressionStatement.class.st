Class {
	#name : #SPLExpressionStatement,
	#superclass : #SPLAbstractExpressionStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #printing }
SPLExpressionStatement >> printOn: aStream [
	"todo:handle indentation"

	self expression printOn: aStream.
	aStream nextPut: $;
]

{ #category : #stepping }
SPLExpressionStatement >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ SPLStopStatement new ]
		ifFalse: [ self class for: (self expression stepIn: aContext) ]
]
