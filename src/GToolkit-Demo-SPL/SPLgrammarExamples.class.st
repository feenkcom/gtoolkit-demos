Class {
	#name : #SPLgrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

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
