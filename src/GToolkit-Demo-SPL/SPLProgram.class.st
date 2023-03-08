"
I represent a complete SPL program made up of declarations and statements.
For simplicity, we call them all statements.

{{gtExample:name=SPLParserExamples>>#whileProgram}}
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
]

{ #category : #printing }
SPLProgram >> printOn: aStream [
	self statements
		do: [ :each | 
			aStream
				print: each;
				cr ]
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
SPLProgram >> stepInContext: aContext [
	"Take a step in the first statement that is not stopped."

	^ self isReduced
		ifTrue: [ self ]
		ifFalse: [ statements first isReduced
				ifTrue: [ self class for: self statements allButFirst ]
				ifFalse: [ self class
						for: (self statements allButFirst
								addFirst: (self statements first stepInContext: aContext);
								yourself) ] ]
]
