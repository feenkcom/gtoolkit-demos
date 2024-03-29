"
I represent a while statement with a condition and a while block.

{{gtExample:name=SPLParserExamples>>#whileStmt}}


"
Class {
	#name : #SPLWhileStatement,
	#superclass : #SPLConditionStatement,
	#instVars : [
		'doPart'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLWhileStatement class >> while: anExpression do: aStatement [ 
^ self new	
	expression: anExpression;
	doPart: aStatement;
	yourself
]

{ #category : #accessing }
SPLWhileStatement >> doPart [
	^ doPart
]

{ #category : #accessing }
SPLWhileStatement >> doPart: aStatement [
	doPart := aStatement
]

{ #category : #printing }
SPLWhileStatement >> printOn: aStream indentBy: indentlevel [
	aStream
		nextPutAll: (self indent: indentlevel);
		nextPutAll: 'while ';
		print: self expression;
		space.
	self doPart printOn: aStream indentBy: indentlevel
]

{ #category : #accessing }
SPLWhileStatement >> stepInContext: aContext [
	"We translate a while statement to an if statement with a block."

	^ SPLIfStatement
		if: self expression
		then: (SPLBlockStatement
				for: {self doPart.
						self} asOrderedCollection)
]

{ #category : #accessing }
SPLWhileStatement >> subNodes [
	^ super subNodes
		add: self doPart;
		yourself
]

{ #category : #accessing }
SPLWhileStatement >> summary [
	^ 'while ', self expression printString
]
