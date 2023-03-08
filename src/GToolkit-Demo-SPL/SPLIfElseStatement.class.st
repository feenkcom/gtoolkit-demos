"
I am an if statement with an else block.

{{gtExample:name=SPLParserExamples>>#ifElseStmt}}

"
Class {
	#name : #SPLIfElseStatement,
	#superclass : #SPLIfStatement,
	#instVars : [
		'elsePart'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLIfElseStatement class >> if: anExpression then: aStatement else: aStatement2 [
	^ self new
		expression: anExpression;
		thenPart: aStatement;
		elsePart: aStatement2;
		yourself
]

{ #category : #accessing }
SPLIfElseStatement >> elsePart [
	^ elsePart
]

{ #category : #accessing }
SPLIfElseStatement >> elsePart: aStatement2 [
	elsePart := aStatement2
]

{ #category : #printing }
SPLIfElseStatement >> printOn: aStream indentBy: indentlevel [
	super printOn: aStream indentBy: indentlevel.
	aStream
		cr;
		nextPutAll: (self indent: indentlevel);
		nextPutAll: 'else';
		space.
	self elsePart printOn: aStream indentBy: indentlevel
]

{ #category : #stepping }
SPLIfElseStatement >> stepInContext: aContext [
	^ self expression isReduced
		ifTrue: [ self assert: self expression isSPLBoolean.
			self expression value ifTrue: [ self thenPart ] ifFalse: [ self elsePart ] ]
		ifFalse: [ self class
				if: (self expression stepInContext: aContext)
				then: self thenPart
				else: self elsePart ]
]
