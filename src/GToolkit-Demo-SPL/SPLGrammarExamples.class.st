"
I provide examples to test the SPL grammar class.
"
Class {
	#name : #SPLGrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #example }
SPLGrammarExamples >> blockStmt [
	<gtExample>
	| input |
	input := '{ x = 42; print x * x; }'.
	self parse: input rule: #statement.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #block
]

{ #category : #example }
SPLGrammarExamples >> booleanTrue [
	<gtExample>
	| input |
	input := 'true'.
	self parse: input rule: #expression.
	self parse: input rule: #primary.
	^ self parse: input rule: #boolean
]

{ #category : #example }
SPLGrammarExamples >> cascadedAssignment [
	<gtExample>
	| input |
	input := 'x = y = 3+4'.
	self parse: input rule: #expression.
	^ self parse: input rule: #assignment
]

{ #category : #example }
SPLGrammarExamples >> complexExpression [
	<gtExample>
	| input |
	input := '(1+2)*3 > 6 or 6*7 == 42'.
	self parse: input rule: #logicOr.
	self parse: input rule: #assignment.
	^ self parse: input rule: #expression
]

{ #category : #example }
SPLGrammarExamples >> complexExpressionStmt [
	<gtExample>
	| input |
	input := '(1+2)*3 > 6 or 6*7 == 42;'.
	self parse: input rule: #statement.
	self fail: input rule: #expression.
	^ self parse: input rule: #exprStmt
]

{ #category : #example }
SPLGrammarExamples >> complexStmt [
	<gtExample>
	| input |
	input := 'while (x > y) { if (x<42)  { x = x+1;   print x ; }  print x+y; }'.
	self parse: input rule: #whileStmt.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #statement
]

{ #category : #example }
SPLGrammarExamples >> fibonacciOracle [
	"This is a Smalltalk implementation of the SPL fibonacci source program.
	It can be used as an oracle for a test case for the interpreter."

	<gtExample>
	| thisFib lastFib iterations end nextFib |
	thisFib := 1.
	lastFib := 1.
	iterations := 1.
	end := 10.
	[ iterations < end ]
		whileTrue: [ iterations := iterations + 1.
			nextFib := thisFib + lastFib.
			lastFib := thisFib.
			thisFib := nextFib ].
	^ thisFib
]

{ #category : #example }
SPLGrammarExamples >> fibonacciProgram [
	<gtExample>
	| input |
	input := self fibonacciSource.
	self fail: input rule: #declaration.
	self fail: input rule: #statement.
	^ self parse: input rule: #program
]

{ #category : #example }
SPLGrammarExamples >> fibonacciSource [
	<gtExample>
	^ 'var thisFib = 1;
var lastFib = thisFib;
var nextFib = thisFib;
var iterations = 1;
var end = 10;
while ( iterations < end ) {
	iterations = iterations + 1;
	nextFib = thisFib + lastFib;
	lastFib = thisFib;
	thisFib = nextFib;
}
print thisFib;
'
]

{ #category : #example }
SPLGrammarExamples >> float3point14 [
	<gtExample>
	^ self parse: '3.14' rule: #float
]

{ #category : #example }
SPLGrammarExamples >> helloString [
	<gtExample>
	| input |
	input := '"hello"'.
	self parse: input rule: #expression.
	^ self parse: input rule: #string
]

{ #category : #example }
SPLGrammarExamples >> ifElseStmt [
	<gtExample>
	| input |
	input := 'if (x > y) x = y; else x = -y; '.
	self parse: input rule: #statement.
	self fail: input rule: #exprStmt.
	^ self parse: input rule: #ifStmt
]

{ #category : #example }
SPLGrammarExamples >> ifNoElseStmt [
	<gtExample>
	| input |
	input := 'if (x > y) x = y;'.
	self parse: input rule: #statement.
	self fail: input rule: #exprStmt.
	^ self parse: input rule: #ifStmt
]

{ #category : #example }
SPLGrammarExamples >> integer42 [
	<gtExample>
	^ self parse: '42' rule: #integer
]

{ #category : #example }
SPLGrammarExamples >> minus42 [
	<gtExample>
	^ self parse: '-42' rule: #unary
]

{ #category : #example }
SPLGrammarExamples >> notTrue [
	<gtExample>
	| input |
	input := '!true'.
	self parse: input rule: #expression.
	self fail: input rule: #primary.
	^ self parse: input rule: #unary
]

{ #category : #example }
SPLGrammarExamples >> orAsKeyword [
	<gtExample>
	| input |
	input := 'or'.
	self fail: input rule: #identifier.
	self fail: input rule: #expression.
	^ self parse: input rule: #keyword
]

{ #category : #example }
SPLGrammarExamples >> orbeAsIdentifier [
	<gtExample>
	| input |
	input := 'orbe'.
	self fail: input rule: #keyword.
	self parse: input rule: #expression.
	^ self parse: input rule: #identifier
]

{ #category : #example }
SPLGrammarExamples >> parenthesized42 [
	<gtExample>
	| input |
	input := '(42)'.
	self parse: input rule: #expression.
	^ self parse: input rule: #primary
]

{ #category : #accessing }
SPLGrammarExamples >> parserClass [
	^ SPLGrammar
]

{ #category : #example }
SPLGrammarExamples >> printStmt [
	<gtExample>
	| input |
	input := 'print 3 + 4;'.
	self parse: input rule: #statement.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #printStmt
]

{ #category : #example }
SPLGrammarExamples >> threeEqualFour [
	<gtExample>
	| input |
	input := '3 == 4'.
	self parse: input rule: #expression.
	self fail: input rule: #comparison.
	^ self parse: input rule: #equality
]

{ #category : #example }
SPLGrammarExamples >> threeLessThanEqualFour [
	<gtExample>
	| input |
	input := '3 <= 4'.
	self parse: input rule: #expression.
	self fail: input rule: #term.
	^ self parse: input rule: #comparison
]

{ #category : #example }
SPLGrammarExamples >> threeLessThanFour [
	<gtExample>
	| input |
	input := '3 < 4'.
	self parse: input rule: #expression.
	self fail: input rule: #term.
	^ self parse: input rule: #comparison
]

{ #category : #example }
SPLGrammarExamples >> threeNotEqualFour [
	<gtExample>
	| input |
	input := '3 != 4'.
	self parse: input rule: #expression.
	self fail: input rule: #comparison.
	^ self parse: input rule: #equality
]

{ #category : #example }
SPLGrammarExamples >> threePlusFour [
	<gtExample>
	| input |
	input := '3+4'.
	self parse: input rule: #expression.
	self fail: input rule: #factor.
	^ self parse: input rule: #term
]

{ #category : #example }
SPLGrammarExamples >> threeTimesFour [
	<gtExample>
	| input |
	input := '3*4'.
	self parse: input rule: #expression.
	self fail: input rule: #unary.
	^ self parse: input rule: #factor
]

{ #category : #example }
SPLGrammarExamples >> trueAndFalse [
	<gtExample>
	| input |
	input := 'true and false'.
	self parse: input rule: #expression.
	self fail: input rule: #equality.
	^ self parse: input rule: #logicAnd
]

{ #category : #example }
SPLGrammarExamples >> trueOrFalse [
	<gtExample>
	| input |
	input := 'true or false'.
	self parse: input rule: #expression.
	self fail: input rule: #logicAnd.
	^ self parse: input rule: #logicOr
]

{ #category : #example }
SPLGrammarExamples >> varDeclWithInit [
	<gtExample>
	| input |
	input := 'var x = 42 + y;'.
	self parse: input rule: #program.
	self parse: input rule: #declaration.
	self fail: input rule: #statement.
	^ self parse: input rule: #varDecl.
]

{ #category : #example }
SPLGrammarExamples >> varDeclWithoutInit [
	<gtExample>
	| input |
	input := 'var x;'.
	self parse: input rule: #program.
	self parse: input rule: #declaration.
	self fail: input rule: #statement.
	^ self parse: input rule: #varDecl.
]

{ #category : #example }
SPLGrammarExamples >> whileProgram [
	<gtExample>
	| input |
	input := self whileProgramSource.
	self fail: input rule: #declaration.
	self fail: input rule: #statement.
	^ self parse: input rule: #program
]

{ #category : #example }
SPLGrammarExamples >> whileProgramSource [
"Example from exercise 02"
	<gtExample>
	^ 'var a = 1;
while (a < 10) {
	print a;
	a = a + 1;
}'
]

{ #category : #example }
SPLGrammarExamples >> whileStmt [
	<gtExample>
	| input |
	input := 'while (x < 42) x = x + 1;'.
	self parse: input rule: #statement.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #whileStmt
]
