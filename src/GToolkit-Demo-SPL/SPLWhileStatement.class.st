Class {
	#name : #SPLWhileStatement,
	#superclass : #SPLConditionStatement,
	#instVars : [
		'whilePart'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLWhileStatement class >> condition: anExpression whilePart: aStatement [ 
^ self new	
	expression: anExpression;
	whilePart: aStatement;
	yourself
]

{ #category : #printing }
SPLWhileStatement >> printOn: aStream [
	"todo:handle indentation"

	aStream nextPutAll: 'while '.
	self expression printOn: aStream.
	aStream nextPut: Character cr.
	self whilePart printOn: aStream
]

{ #category : #accessing }
SPLWhileStatement >> whilePart [
	^ whilePart
]

{ #category : #accessing }
SPLWhileStatement >> whilePart: aStatement [
	whilePart := aStatement
]
