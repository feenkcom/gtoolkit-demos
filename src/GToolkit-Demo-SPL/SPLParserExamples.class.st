"
I implement examples to test the SPL parser that build an interpreter for SPL.
"
Class {
	#name : #SPLParserExamples,
	#superclass : #SPLGrammarExamples,
	#category : #'GToolkit-Demo-SPL-Examples'
}

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
