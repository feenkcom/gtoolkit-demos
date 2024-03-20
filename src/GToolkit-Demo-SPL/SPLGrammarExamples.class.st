"
I provide examples to test the SPL grammar class.

In general, the examples check that a given program fragment is successfully parsed by certain parser rules (parsers), and not others.
For example: {{gtExample:name=SPLGrammarExamples>>#complexExpressionStmt}}
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
SPLGrammarExamples >> comment [
	<gtExample>
	| input |
	input := '// foo'.
	self fail: input rule: #statement.
	self fail: input rule: #ifStmt.
	self parse: input rule: #ignorable.
	^ self parse: input rule: #comment
]

{ #category : #example }
SPLGrammarExamples >> commentWithLeadingSpaces [
	<gtExample>
	| input |
	input := '  // foo'.
	self fail: input rule: #statement.
	self fail: input rule: #ifStmt.
	self fail: input rule: #comment.
	^ self parse: input rule: #ignorable
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
	| thisFib lastFib iterations arg nextFib output |
	output := '1' , String cr repeat: 2.
	arg := 10.
	thisFib := 1.
	lastFib := 1.
	iterations := 2.
	[ iterations < arg ]
		whileTrue: [ iterations := iterations + 1.
			nextFib := thisFib + lastFib.
			lastFib := thisFib.
			thisFib := nextFib.
			output := output , thisFib asString , String cr ].
	^ output
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
	^ '// Fibonacci in SPL
// Outputs the first arg Fibonacci numbers
var arg = 10;
var lastFib = 1;
var thisFib = 1;
var nextFib;
var iterations = 2;
print lastFib;
print thisFib;
while ( iterations < arg ) {
	iterations = iterations + 1;
	nextFib = thisFib + lastFib;
	lastFib = thisFib;
	thisFib = nextFib;
	print thisFib;
}'
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
SPLGrammarExamples >> programWithComments [
	<gtExample>
	| input |
	input := '// My first program
var hello = "hello world"; // this is a variable
print // a print statement
	hello // and the argument to the print
	; // end of statement
// and we''re done!'.
	^ self parse: input rule: #program
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
SPLGrammarExamples >> threeEqualsThree [
	<gtExample>
	| input |
	input := '3 == 3'.
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
