"
I am a Facade to facilitate parsing, running and stepping through SPL programs.
"
Class {
	#name : #SPL,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-SPL'
}

{ #category : #accessing }
SPL class >> contextFor: anSPLProgramSource [
	"Return a runnable SPLContext for the SPL program"
	^ SPLContext for: anSPLProgramSource
]

{ #category : #accessing }
SPL class >> contextForExpression: anSPLExpressionString [
	"Return a runnable SPLContext for the SPL expression"
	^ SPLContext forExpression: anSPLExpressionString
]

{ #category : #accessing }
SPL class >> examples [
	"Return all the examples in this package.
	Send runAll to run them all."

	^ GtExplicitExampleGroup withAll: self package gtExamplesAllContained
]

{ #category : #accessing }
SPL class >> factorial [
	^ SPLInterpreterExamples new factorialSource
]

{ #category : #accessing }
SPL class >> fibonacci [
	^ SPLGrammarExamples new fibonacciSource
]

{ #category : #parsing }
SPL class >> grammarCheck: anSPLProgram [
	^ self grammarClass parse: anSPLProgram
]

{ #category : #constants }
SPL class >> grammarClass [
	^ SPLGrammar
]

{ #category : #parsing }
SPL class >> parse: anSPLProgram [
	"Return the SPLNode for the program"
	^ self parserClass parse: anSPLProgram
]

{ #category : #parsing }
SPL class >> parseExpression: anSPLExpression [
	"Return the SPLNode for the expression"
	^ self parserClass new expression end parse: anSPLExpression
]

{ #category : #constants }
SPL class >> parserClass [
	^ SPLParser
]

{ #category : #accessing }
SPL class >> reduce: anSPLProgramSource [
	"Reduce the program and return the context in the reduced state"
	^ (self contextFor: anSPLProgramSource)
		reduce;
		yourself
]

{ #category : #accessing }
SPL class >> run: anSPLProgramSource [
	"Reduce the program and return the output"
	^ (self reduce: anSPLProgramSource) output
]
