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
