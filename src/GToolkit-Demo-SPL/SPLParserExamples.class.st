"
I implement examples to test the SPL parser that builds an interpreter for SPL.

Pretty much all of the examples are extensions of examples inherited from {{gtClass:name=SPLGrammarExamples}}.
They typically run the {{gtClass:name=SPLParser}} on the inherited SPL example code, producing an AST, and then test whether the prett-printed code matches an expected result.

For example: {{gtExample:name=SPLParserExamples>>#ifElseStmt}}
"
Class {
	#name : #SPLParserExamples,
	#superclass : #SPLGrammarExamples,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #accessing }
SPLParserExamples >> blockStmt [
	<gtExample>
	<return: #SPLBlockStatement>
	| result |
	result := super blockStmt.
	self
		assert: result printString
		equals: '{
  x = 42;
  print (x*x);
}'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> booleanTrue [
	<gtExample>
	<return: #SPLBoolean>
	| result |
	result := super booleanTrue.
	self assert: result value.
	self assert: result printString equals: 'true'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> cascadedAssignment [
	<gtExample>
	<return: #SPLAssignment>
	| result |
	result := super cascadedAssignment.
	self assert: result printString equals: 'x = y = (3+4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> complexExpression [
	<gtExample>
	<return: #SPLLogicalBinary>
	| result |
	result := super complexExpression.
	self assert: result printString equals: '((((1+2)*3)>6) or ((6*7)==42))'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> complexExpressionStmt [
	<gtExample>
	<return: #SPLExpressionStatement>
	| result |
	result := super complexExpressionStmt.
	self assert: result printString equals: '((((1+2)*3)>6) or ((6*7)==42));'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> complexStmt [
	<gtExample>
	<return: #SPLWhileStatement>
	| result |
	result := super complexStmt.
	self
		assert: result printString
		equals: 'while (x>y) {
  if (x<42)   {
    x = (x+1);
    print x;
  }
  print (x+y);
}'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> fibonacciProgram [
	<gtExample>
	<return: #SPLProgram>
	| result |
	result := super fibonacciProgram.
	self
		assert: result printString
		equals: 'var arg = 10;
var lastFib = 1;
var thisFib = 1;
var nextFib;
var iterations = 2;
print lastFib;
print thisFib;
while (iterations<arg) {
  iterations = (iterations+1);
  nextFib = (thisFib+lastFib);
  lastFib = thisFib;
  thisFib = nextFib;
  print thisFib;
}
'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> float3point14 [
	<gtExample>
	<return: #SPLNumber>
	| result |
	result := super float3point14.
	self assert: result value equals: 3.14.
	self assert: result printString equals: '3.14'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> helloString [
	<gtExample>
	<return: #SPLString>
	| result |
	result := super helloString.
	self assert: result value equals: 'hello'.
	self assert: result printString equals: '"hello"'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> ifElseStmt [
	<gtExample>
	<return: #SPLIfElseStatement>
	| result |
	result := super ifElseStmt.
	self
		assert: result printString
		equals: 'if (x>y) x = y;
else x = -y;'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> ifNoElseStmt [
	<gtExample>
	<return: #SPLIfStatement>
	| result |
	result := super ifNoElseStmt.
	self assert: result printString equals: 'if (x>y) x = y;'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> integer42 [
	<gtExample>
	<return: #SPLNumber>
	| result |
	result := super integer42.
	self assert: result value equals: 42.
	self assert: result printString equals: '42'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> minus42 [
	<gtExample>
	<return: #SPLUnary>
	| result |
	result := super minus42.
	self assert: result printString equals: '-42'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> nil [
	<gtExample>
	<return: #SPLVariable>
	| result |
	result := self parse: 'nil' rule: #expression.
	self assert: result printString equals: 'nil'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> notTrue [
	<gtExample>
	<return: #SPLUnary>
	| result |
	result := super notTrue.
	self assert: result printString equals: '!true'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> orbeAsIdentifier [
	<gtExample>
	<return: #SPLVariable>
	| result |
	result := super orbeAsIdentifier.
	self assert: result printString equals: 'orbe'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> parenthesized42 [
	<gtExample>
	<return: #SPLNumber>
	| result |
	result := super parenthesized42.
	self assert: result value equals: 42.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> parserClass [
	^ SPLParser
]

{ #category : #accessing }
SPLParserExamples >> printStmt [
	<gtExample>
	<return: #SPLPrintStatement>
	| result |
	result := super printStmt.
	self assert: result printString equals: 'print (3+4);'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> programWithComments [
	<gtExample>
	<return: #SPLProgram>
	| result |
	result := super programWithComments.
	self
		assert: result printString
		equals: 'var hello = "hello world";
print hello;
'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeEqualFour [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := super threeEqualFour.
	self assert: result printString equals: '(3==4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeLessThanEqualFour [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := super threeLessThanEqualFour.
	self assert: result printString equals: '(3<=4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeLessThanFour [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := super threeLessThanFour.
	self assert: result printString equals: '(3<4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeNotEqualFour [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := super threeNotEqualFour.
	self assert: result printString equals: '(3!=4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threePlusFour [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := super threePlusFour.
	self assert: result printString equals: '(3+4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeTimesFour [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := super threeTimesFour.
	self assert: result printString equals: '(3*4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeTimesFourDividedByFive [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := self parse: '3*4/5' rule: #factor.
	self assert: result printString equals: '((3*4)/5)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> true [
	<gtExample>
	<return: #SPLBoolean>
	| result |
	result := self parse: 'true' rule: #expression.
	self assert: result printString equals: 'true'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> trueAndFalse [
	<gtExample>
	<return: #SPLLogicalBinary>
	| result |
	result := super trueAndFalse.
	self assert: result printString equals: '(true and false)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> trueOrFalse [
	<gtExample>
	<return: #SPLLogicalBinary>
	| result |
	result := super trueOrFalse.
	self assert: result printString equals: '(true or false)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> varDeclWithInit [
	<gtExample>
	<return: #SPLInitializedDeclaration>
	| result |
	result := super varDeclWithInit.
	self assert: result printString equals: 'var x = (42+y);'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> varDeclWithoutInit [
	<gtExample>
	<return: #SPLDeclaration>
	| result |
	result := super varDeclWithoutInit.
	self assert: result printString equals: 'var x;'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> whileProgram [
	<gtExample>
	<return: #SPLProgram>
	| result |
	result := super whileProgram.
	self
		assert: result printString
		equals: 'var a = 1;
while (a<10) {
  print a;
  a = (a+1);
}
'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> whileStmt [
	<gtExample>
	<return: #SPLWhileStatement>
	| result |
	result := super whileStmt.
	self assert: result printString equals: 'while (x<42) x = (x+1);'.
	^ result
]
