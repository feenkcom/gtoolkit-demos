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
	^ SPLContext for: anSPLProgramSource
]

{ #category : #accessing }
SPL class >> contextForExpression: anSPLExpressionString [
	^ SPLContext forExpression: anSPLExpressionString
]

{ #category : #accessing }
SPL class >> examples [
	"Return all the examples in this package.
	Send runAll to run them all."

	^ GtExplicitExampleGroup withAll: self package gtExamplesAllContained
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
	^ self parserClass parse: anSPLProgram
]

{ #category : #parsing }
SPL class >> parseExpression: anSPLExpression [
	^ self parserClass new expression end parse: anSPLExpression
]

{ #category : #constants }
SPL class >> parserClass [
	^ SPLParser
]
