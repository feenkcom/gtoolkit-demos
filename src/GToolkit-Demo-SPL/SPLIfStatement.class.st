"
I am an if statement with a then block but no else block.

{{gtExample:name=SPLParserExamples>>#ifNoElseStmt}} 

"
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
		space.
	self thenPart printOn: aStream indentBy: indentlevel
]

{ #category : #stepping }
SPLIfStatement >> stepInContext: aContext [
	^ self expression isReduced
		ifTrue: [ self assert: self expression isSPLBoolean.
			self expression value
				ifTrue: [ self thenPart ]
				ifFalse: [ SPLBlockStatement new ] ]
		ifFalse: [ self class
				if: (self expression stepInContext: aContext)
				then: self thenPart ]
]

{ #category : #accessing }
SPLIfStatement >> subNodes [
	^ super subNodes
		add: self thenPart;
		yourself
]

{ #category : #printing }
SPLIfStatement >> summary [
	^ 'if ', self expression printString
]

{ #category : #accessing }
SPLIfStatement >> thenPart [
	^ thenPart
]

{ #category : #accessing }
SPLIfStatement >> thenPart: aStatement [
	thenPart := aStatement
]
