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

{ #category : #stepping }
SPLBlockStatement >> stepIn: aContext [
	"Take a step in the first statement that is not stopped."

	^ self statements isEmpty
		ifTrue: [ SPLStopStatement new ]
		ifFalse: [ self statements size = 1
				ifTrue: [ self statements first ]
				ifFalse: [ statements first isReduced
						ifTrue: [ self class for: self statements allButFirst ]
						ifFalse: [ self class
								for: (self statements allButFirst
										addFirst: (self statements first stepIn: aContext);
										yourself) ] ] ]
]
