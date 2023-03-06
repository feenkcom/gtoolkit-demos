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
SPLIfStatement >> printOn: aStream indentBy: indentlevel [
	aStream
		nextPutAll: (self indent: indentlevel);
		nextPutAll: 'if ';
		print: self expression;
		space;
		print: self thenPart
]

{ #category : #stepping }
SPLIfStatement >> stepIn: aContext [
	^ self expression isReduced
		ifTrue: [ self assert: self expression isSPLBoolean.
			self expression value
				ifTrue: [ self thenPart ]
				ifFalse: [ SPLSkipStatement new ] ]
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
