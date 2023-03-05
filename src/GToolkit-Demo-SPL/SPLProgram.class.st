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

{ #category : #testing }
SPLProgram >> isReduced [
	^ self statements isEmpty
		or: [ self statements size = 1 and: [ self statements first isReduced ] ]
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

{ #category : #stepping }
SPLProgram >> stepIn: aContext [
	"Take a step in the first statement that is not stopped."

	^ self isReduced
		ifTrue: [ SPLStopStatement new ]
		ifFalse: [ statements first isReduced
				ifTrue: [ self class for: self statements allButFirst ]
				ifFalse: [ self class
						for: (self statements allButFirst
								addFirst: (self statements first stepIn: aContext);
								yourself) ] ]
]
