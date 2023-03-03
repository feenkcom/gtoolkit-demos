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
