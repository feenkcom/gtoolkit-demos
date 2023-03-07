"
I am a Facade to facilitate parsing, running and stepping through SPL programs.

SPL is a simple programming language designed by Timo Kehrer for his Compiler Construction course at the University of Bern.
The language has variables, expressions and statements, but no functions or classes.

This package contains an implementation of the grammar, a parser that produces an AST, and an interpreter.
The grammar is implemented in PetitParser, a framework for producing top-down PEG parsers.
See {{gtClass:name=SPLGrammar}} for the grammar rules and {{gtClass:name=SPLGrammarExamples}} for examples and tests.
The subclass {{gtClass:name=SPLParser}} implements the parser that produces the AST.
{{gtClass:name=SPLNode}} is the root of the AST hierarchy.

The interpreter uses a small-step operational semantics by transforming the AST in reduction steps.
The state of a running program consists of three parts: 
(1) the current continuation represented as an AST,
(2) the current environment of variable bindings (see {{gtClass:name=SPLEnvironment}}), and
(3) the output stream.
The state of a program is managed by an instance of {{gtClass:name=SPLContext}}.

See {{gtClass:name=SPLInterpreterExamples}} for examples of running programs.

To parse and interpret a program , use `SPL>>#run:`:
```
SPL run: 'print ""Hello world!"";'.
```

To step through a program, inspect the result of `SPL>>#contextFor:`.
```
SPL contextFor: 'print ""Hello world"";'
```

Then use `self step` to step through the execution, or `self reduce` to run to the end.
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
