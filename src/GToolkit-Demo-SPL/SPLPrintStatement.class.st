Class {
	#name : #SPLPrintStatement,
	#superclass : #SPLAbstractExpressionStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLPrintStatement >> printOn: aStream [
	aStream
		nextPutAll: 'print ';
		print: self expression;
		nextPut: $;
]

{ #category : #stepping }
SPLPrintStatement >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ aContext printLn: self expression value asString.
			SPLSkipStatement new ]
		ifFalse: [ self class for: (self expression stepIn: aContext) ]
]
