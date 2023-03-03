Class {
	#name : #SPLIfStatement,
	#superclass : #SPLConditionStatement,
	#instVars : [
		'ifPart'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLIfStatement class >> condition: anExpression ifPart: aStatement [ 
^ self new	
	expression: anExpression;
	ifPart: aStatement;
	yourself
]

{ #category : #accessing }
SPLIfStatement >> ifPart [
	^ ifPart
]

{ #category : #accessing }
SPLIfStatement >> ifPart: aStatement [
	ifPart := aStatement
]

{ #category : #printing }
SPLIfStatement >> printOn: aStream [
	"todo:handle indentation"

	aStream nextPutAll: 'if '.
	self expression printOn: aStream.
	aStream nextPut: Character cr.
	self ifPart printOn: aStream
]
