"
I implement examples to test the SPL parser that build an interpreter for SPL.
"
Class {
	#name : #SPLParserExamples,
	#superclass : #SPLGrammarExamples,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #accessing }
SPLParserExamples >> blockStmt [
	<todo: 'handle indentation'>
	<gtExample>
	| result |
	result := super blockStmt.
	self assert: result printString equals: '{
x = 42;
print (x*x);
}'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> booleanTrue [
	<gtExample>
	| result |
	result := super booleanTrue.
	self assert: result value.
	self assert: result printString equals: 'true'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> cascadedAssignment [
	<gtExample>
	| result |
	result := super cascadedAssignment.
	self assert: result printString equals: 'x = y = (3+4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> complexExpression [
	<gtExample>
	| result |
	result := super complexExpression.
	self assert: result printString equals: '((((1+2)*3)>6) or ((6*7)==42))'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> complexExpressionStmt [
	<gtExample>
	| result |
	result := super complexExpressionStmt.
	self assert: result printString equals: '((((1+2)*3)>6) or ((6*7)==42));'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> complexStmt [
	<todo: 'handle indentation'>
	<gtExample>
	| result |
	result := super complexStmt.
	self assert: result printString equals: 'while (x>y)
{
if (x<42)
{
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
	| result |
	result := super fibonacciProgram.
	self assert: result printString equals: '
var thisFib = 1;
var lastFib = thisFib;
var nextFib = thisFib;
var n = 1;
var end = 20;
while (iterations<end)
{
iterations = (iterations+1);
nextFib = (thisFib+lastFib);
lastFib = thisFib;
thisFib = nextFib;
}
print thisFib;
'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> float3point14 [
	<gtExample>
	| result |
	result := super float3point14.
	self assert: result value equals: 3.14.
	self assert: result printString equals: '3.14'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> helloString [
	<gtExample>
	| result |
	result := super helloString.
	self assert: result value equals: 'hello'.
	self assert: result printString equals: '"hello"'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> ifElseStmt [
	<todo: 'handle indentation'>
	<gtExample>
	| result |
	result := super ifElseStmt.
	self assert: result printString equals: 'if (x>y)
x = y;
else
x = -y;'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> ifNoElseStmt [
	<todo: 'handle indentation'>
	<gtExample>
	| result |
	result := super ifNoElseStmt.
	self
		assert: result printString
		equals: 'if (x>y)
x = y;'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> integer42 [
	<gtExample>
	| result |
	result := super integer42.
	self assert: result value equals: 42.
	self assert: result printString equals: '42'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> minus42 [
	<gtExample>
	| result |
	result := super minus42.
	self assert: result printString equals: '-42'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> notTrue [
	<gtExample>
	| result |
	result := super notTrue.
	self assert: result printString equals: '!true'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> orbeAsIdentifier [
	<gtExample>
	| result |
	result := super orbeAsIdentifier.
	self assert: result printString equals: 'orbe'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> parenthesized42 [
	<gtExample>
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
	| result |
	result := super printStmt.
	self assert: result printString equals: 'print (3+4);'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeEqualFour [
	<gtExample>
	| result |
	result := super threeEqualFour.
	self assert: result printString equals: '(3==4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeLessThanEqualFour [
	<gtExample>
	| result |
	result := super threeLessThanEqualFour.
	self assert: result printString equals: '(3<=4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeLessThanFour [
	<gtExample>
	| result |
	result := super threeLessThanFour.
	self assert: result printString equals: '(3<4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeNotEqualFour [
	<gtExample>
	| result |
	result := super threeNotEqualFour.
	self assert: result printString equals: '(3!=4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threePlusFour [
	<gtExample>
	| result |
	result := super threePlusFour.
	self assert: result printString equals: '(3+4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeTimesFour [
	<gtExample>
	| result |
	result := super threeTimesFour.
	self assert: result printString equals: '(3*4)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> threeTimesFourDividedByFive [
	<gtExample>
	| result |
	result := self parse: '3*4/5' rule: #factor.
	self assert: result printString equals: '((3*4)/5)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> trueAndFalse [
	<gtExample>
	| result |
	result := super trueAndFalse.
	self assert: result printString equals: '(true and false)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> trueOrFalse [
	<gtExample>
	| result |
	result := super trueOrFalse.
	self assert: result printString equals: '(true or false)'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> varDeclWithInit [
	<gtExample>
	| result |
	result := super varDeclWithInit.
	self assert: result printString equals: 'var x = (42+y);'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> varDeclWithoutInit [
	<gtExample>
	| result |
	result := super varDeclWithoutInit.
	self assert: result printString equals: 'var x;'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> whileProgram [
	<gtExample>
	| result |
	result := super whileProgram.
	self assert: result printString equals: '
var a = 1;
while (a<10)
{
print a;
a = (a+1);
}
'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> whileStmt [
	<todo: 'handle indentation'>
	<gtExample>
	| result |
	result := super whileStmt.
	self assert: result printString equals: 'while (x<42)
x = (x+1);'.
	^ result
]
