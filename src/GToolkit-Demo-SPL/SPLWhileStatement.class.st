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
SPLWhileStatement >> printOn: aStream [
	"todo:handle indentation"

	aStream nextPutAll: 'while '.
	self expression printOn: aStream.
	aStream nextPut: Character cr.
	self doPart printOn: aStream
]

{ #category : #accessing }
SPLWhileStatement >> stepIn: aContext [
	"We translate a while statement to an if statement with a block."

	^ SPLIfStatement
		if: self expression
		then: (SPLBlockStatement
				for: {self doPart.
						self} asOrderedCollection)
]
