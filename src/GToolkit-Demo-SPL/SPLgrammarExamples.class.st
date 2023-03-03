Class {
	#name : #SPLgrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #example }
SPLgrammarExamples >> blockStmt [
	<gtExample>
	| input |
	input := '{ x = 42; print x * x; }'.
	self parse: input rule: #statement.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #block
]

{ #category : #example }
SPLgrammarExamples >> booleanTrue [
	<gtExample>
	| input |
	input := 'true'.
	self parse: input rule: #expression.
	self parse: input rule: #primary.
	^ self parse: input rule: #boolean
]

{ #category : #example }
SPLgrammarExamples >> cascadedAssignment [
	<gtExample>
	| input |
	input := 'x = y = 3+4'.
	self parse: input rule: #expression.
	^ self parse: input rule: #assignment
]

{ #category : #example }
SPLgrammarExamples >> complexExpression [
	<gtExample>
	| input |
	input := '(1+2)*3 > 6 or 6*7 == 42'.
	self parse: input rule: #logicOr.
	self parse: input rule: #assignment.
	^ self parse: input rule: #expression
]

{ #category : #example }
SPLgrammarExamples >> complexExpressionStmt [
	<gtExample>
	| input |
	input := '(1+2)*3 > 6 or 6*7 == 42;'.
	self parse: input rule: #statement.
	self fail: input rule: #expression.
	^ self parse: input rule: #exprStmt
]

{ #category : #example }
SPLgrammarExamples >> complexStmt [
	<gtExample>
	| input |
	input := 'while (x > y) { if (x<42)  { x = x+1;   print x ; }  print x+y; }'.
	self parse: input rule: #whileStmt.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #statement
]

{ #category : #example }
SPLgrammarExamples >> fibonacciOracle [
	"This is a Smalltalk implementation of the SPL fibonacci source program.
	It can be used as an oracle for a test case for the interpreter."

	<gtExample>
	| thisFib lastFib iterations end nextFib |
	thisFib := 1.
	lastFib := 1.
	iterations := 1.
	end := 20.
	[ iterations < end ]
		whileTrue: [ iterations := iterations + 1.
			nextFib := thisFib + lastFib.
			lastFib := thisFib.
			thisFib := nextFib ].
	^ thisFib
]

{ #category : #example }
SPLgrammarExamples >> fibonacciProgram [
	<gtExample>
	| input |
	input := self fibonacciSource.
	self fail: input rule: #declaration.
	self fail: input rule: #statement.
	^ self parse: input rule: #program
]

{ #category : #example }
SPLgrammarExamples >> fibonacciSource [
	<gtExample>
	^ 'var thisFib = 1;
var lastFib = thisFib;
var nextFib = thisFib;
var n = 1;
var end = 20;
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
SPLgrammarExamples >> float3point14 [
	<gtExample>
	^ self parse: '3.14' rule: #float
]

{ #category : #example }
SPLgrammarExamples >> helloString [
	<gtExample>
	| input |
	input := '"hello"'.
	self parse: input rule: #expression.
	^ self parse: input rule: #string
]

{ #category : #example }
SPLgrammarExamples >> ifElseStmt [
	<gtExample>
	| input |
	input := 'if (x > y) x = y; else x = -y; '.
	self parse: input rule: #statement.
	self fail: input rule: #exprStmt.
	^ self parse: input rule: #ifStmt
]

{ #category : #example }
SPLgrammarExamples >> ifNoElseStmt [
	<gtExample>
	| input |
	input := 'if (x > y) x = y;'.
	self parse: input rule: #statement.
	self fail: input rule: #exprStmt.
	^ self parse: input rule: #ifStmt
]

{ #category : #example }
SPLgrammarExamples >> integer42 [
	<gtExample>
	^ self parse: '42' rule: #integer
]

{ #category : #example }
SPLgrammarExamples >> minus42 [
	<gtExample>
	^ self parse: '-42' rule: #unary
]

{ #category : #example }
SPLgrammarExamples >> notTrue [
	<gtExample>
	| input |
	input := '!true'.
	self parse: input rule: #expression.
	self fail: input rule: #primary.
	^ self parse: input rule: #unary
]

{ #category : #example }
SPLgrammarExamples >> orAsKeyword [
	<gtExample>
	| input |
	input := 'or'.
	self fail: input rule: #identifier.
	self fail: input rule: #expression.
	^ self parse: input rule: #keyword
]

{ #category : #example }
SPLgrammarExamples >> orbeAsIdentifier [
	<gtExample>
	| input |
	input := 'orbe'.
	self fail: input rule: #keyword.
	self parse: input rule: #expression.
	^ self parse: input rule: #identifier
]

{ #category : #example }
SPLgrammarExamples >> parenthesized42 [
	<gtExample>
	| input |
	input := '(42)'.
	self parse: input rule: #expression.
	^ self parse: input rule: #primary
]

{ #category : #accessing }
SPLgrammarExamples >> parserClass [
	^ SPLgrammar
]

{ #category : #example }
SPLgrammarExamples >> printStmt [
	<gtExample>
	| input |
	input := 'print 3 + 4;'.
	self parse: input rule: #statement.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #printStmt
]

{ #category : #example }
SPLgrammarExamples >> threeEqualFour [
	<gtExample>
	| input |
	input := '3 == 4'.
	self parse: input rule: #expression.
	self fail: input rule: #comparison.
	^ self parse: input rule: #equality
]

{ #category : #example }
SPLgrammarExamples >> threeLessThanEqualFour [
	<gtExample>
	| input |
	input := '3 <= 4'.
	self parse: input rule: #expression.
	self fail: input rule: #term.
	^ self parse: input rule: #comparison
]

{ #category : #example }
SPLgrammarExamples >> threeLessThanFour [
	<gtExample>
	| input |
	input := '3 < 4'.
	self parse: input rule: #expression.
	self fail: input rule: #term.
	^ self parse: input rule: #comparison
]

{ #category : #example }
SPLgrammarExamples >> threeNotEqualFour [
	<gtExample>
	| input |
	input := '3 != 4'.
	self parse: input rule: #expression.
	self fail: input rule: #comparison.
	^ self parse: input rule: #equality
]

{ #category : #example }
SPLgrammarExamples >> threePlusFour [
	<gtExample>
	| input |
	input := '3+4'.
	self parse: input rule: #expression.
	self fail: input rule: #factor.
	^ self parse: input rule: #term
]

{ #category : #example }
SPLgrammarExamples >> threeTimesFour [
	<gtExample>
	| input |
	input := '3*4'.
	self parse: input rule: #expression.
	self fail: input rule: #unary.
	^ self parse: input rule: #factor
]

{ #category : #example }
SPLgrammarExamples >> trueAndFalse [
	<gtExample>
	| input |
	input := 'true and false'.
	self parse: input rule: #expression.
	self fail: input rule: #equality.
	^ self parse: input rule: #logicAnd
]

{ #category : #example }
SPLgrammarExamples >> trueOrFalse [
	<gtExample>
	| input |
	input := 'true or false'.
	self parse: input rule: #expression.
	self fail: input rule: #logicAnd.
	^ self parse: input rule: #logicOr
]

{ #category : #example }
SPLgrammarExamples >> varDeclWithInit [
	<gtExample>
	| input |
	input := 'var x = 42 + y;'.
	self parse: input rule: #program.
	self parse: input rule: #declaration.
	self fail: input rule: #statement.
	^ self parse: input rule: #varDecl.
]

{ #category : #example }
SPLgrammarExamples >> varDeclWithoutInit [
	<gtExample>
	| input |
	input := 'var x;'.
	self parse: input rule: #program.
	self parse: input rule: #declaration.
	self fail: input rule: #statement.
	^ self parse: input rule: #varDecl.
]

{ #category : #example }
SPLgrammarExamples >> whileProgram [
"Example from exercise 02"
	<gtExample>
	^ 'var a = 1;
while (a < 10) {
	3 print a;
	a = a + 1;
}'
]

{ #category : #example }
SPLgrammarExamples >> whileStmt [
	<gtExample>
	| input |
	input := 'while (x < 42) x = x + 1;'.
	self parse: input rule: #statement.
	self fail: input rule: #ifStmt.
	^ self parse: input rule: #whileStmt
]
