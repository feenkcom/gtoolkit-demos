Class {
	#name : #SPLExpressionStatement,
	#superclass : #SPLAbstractExpressionStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #printing }
SPLExpressionStatement >> printOn: aStream indentBy: indentlevel [
	aStream
		nextPutAll: (self indent: indentlevel);
		print: self expression;
		nextPut: $;
]

{ #category : #stepping }
SPLExpressionStatement >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ SPLSkipStatement new ]
		ifFalse: [ self class for: (self expression stepIn: aContext) ]
]
