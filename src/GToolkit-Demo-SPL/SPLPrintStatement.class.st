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
