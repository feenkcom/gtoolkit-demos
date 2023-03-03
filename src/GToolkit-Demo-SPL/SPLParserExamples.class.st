Class {
	#name : #SPLParserExamples,
	#superclass : #SPLGrammarExamples,
	#category : #'GToolkit-Demo-SPL-PetitParser'
}

{ #category : #accessing }
SPLParserExamples >> booleanTrue [
	<gtExample>
	| result |
	result := super booleanTrue.
	self assert: result.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> float3point14 [
	<gtExample>
	| result |
	result := super float3point14.
	self assert: result equals: 3.14.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> helloString [
	<gtExample>
	| result |
	result := super helloString.
	self assert: result equals: 'hello'.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> integer42 [
	<gtExample>
	| result |
	result := super integer42.
	self assert: result equals: 42.
	^ result
]

{ #category : #accessing }
SPLParserExamples >> parserClass [
	^ SPLParser
]
