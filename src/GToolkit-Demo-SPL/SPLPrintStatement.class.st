Class {
	#name : #SPLPrintStatement,
	#superclass : #SPLAbstractExpressionStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLPrintStatement >> printOn: aStream [
	aStream nextPutAll: 'print '.
	self expression printOn: aStream.
	aStream nextPut: $;
]

{ #category : #evaluating }
SPLPrintStatement >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ aContext output nextPutAll: self expression value asString.
			SPLStopStatement new ]
		ifFalse: [ self class for: (self expression stepIn: aContext) ]
]
