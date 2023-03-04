Class {
	#name : #SPLBlockStatement,
	#superclass : #SPLStatement,
	#instVars : [
		'statements'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLBlockStatement class >> for: aStatementCollection [
	^ self new
		statements: aStatementCollection;
		yourself
]

{ #category : #printing }
SPLBlockStatement >> printOn: aStream [
	"todo:handle indentation"

	aStream nextPut: ${.
	aStream nextPut: Character cr.
	self statements
		do: [ :each | 
			each printOn: aStream.
			aStream nextPut: Character cr ].
	aStream nextPut: $}
]

{ #category : #accessing }
SPLBlockStatement >> statements [
	^ statements
]

{ #category : #accessing }
SPLBlockStatement >> statements: aStatementCollection [
	statements := aStatementCollection
]
