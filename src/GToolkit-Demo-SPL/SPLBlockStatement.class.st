"
I am an SPL block statement, containing zero or more other statements.

{{gtExample:name=SPLParserExamples>>#blockStmt}}


"
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

{ #category : #initialization }
SPLBlockStatement >> initialize [
	super initialize.
	self statements: OrderedCollection new
]

{ #category : #testing }
SPLBlockStatement >> isReduced [
	^ self statements isEmpty
]

{ #category : #printing }
SPLBlockStatement >> printOn: aStream indentBy: indentlevel [
	aStream
		nextPutAll: (self indent: indentlevel);
		nextPut: ${;
		cr.
	self statements
		do: [ :each | 
			each printOn: aStream indentBy: indentlevel + 1.
			aStream cr ].
	aStream
		nextPutAll: (self indent: indentlevel);
		nextPut: $}
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
SPLBlockStatement >> stepInContext: aContext [
	"Take a step in the first statement that is not stopped."

	^ self isReduced
		ifTrue: [ self ]
		ifFalse: [ self statements size = 1
				ifTrue: [ self statements first ]
				ifFalse: [ statements first isReduced
						ifTrue: [ self class for: self statements allButFirst ]
						ifFalse: [ self class
								for: (self statements allButFirst
										addFirst: (self statements first stepInContext: aContext);
										yourself) ] ] ]
]

{ #category : #accessing }
SPLBlockStatement >> summary [
	^ self statements
		ifEmpty: [ '{}' ]
		ifNotEmpty: [ '{' , self statements first summary, '...}' ]
]
