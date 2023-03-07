Class {
	#name : #SPLExpressionStatement,
	#superclass : #SPLAbstractExpressionStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLExpressionStatement >> isReduced [
	^ self expression isReduced
]

{ #category : #printing }
SPLExpressionStatement >> printOn: aStream indentBy: indentlevel [
	aStream
		nextPutAll: (self indent: indentlevel);
		print: self expression;
		nextPut: $;
]

{ #category : #stepping }
SPLExpressionStatement >> stepInContext: aContext [
	^ self isReduced
		ifTrue: [ self ]
		ifFalse: [ self class for: (self expression stepInContext: aContext) ]
]
