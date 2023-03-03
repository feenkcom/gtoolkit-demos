"
I represent a complete SPL program made up of declarations and statements.
For simplicity, we call them all statements.
"
Class {
	#name : #SPLProgram,
	#superclass : #SPLNode,
	#instVars : [
		'statements'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLProgram class >> for: aDeclarationAndStatementCollection [ 
^ self new
	statements: aDeclarationAndStatementCollection;
	yourself
]

{ #category : #printing }
SPLProgram >> printOn: aStream [
	"todo:handle indentation"

	aStream nextPut: Character cr.
	self statements
		do: [ :each | 
			each printOn: aStream.
			aStream nextPut: Character cr ]
]

{ #category : #accessing }
SPLProgram >> statements [
	^ statements
]

{ #category : #'instance creation' }
SPLProgram >> statements: aDeclarationAndStatementCollection [
	statements := aDeclarationAndStatementCollection
]
