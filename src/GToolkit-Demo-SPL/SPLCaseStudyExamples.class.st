"
Some live examples for the `PetitParser SPL case study` GT Book pages.
"
Class {
	#name : #SPLCaseStudyExamples,
	#superclass : #SPLContextExamples,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #accessing }
SPLCaseStudyExamples >> empty [
	<gtExample>
	^ SPL empty
]

{ #category : #accessing }
SPLCaseStudyExamples >> factorial [
	<gtExample>
	^ SPL factorial
]

{ #category : #accessing }
SPLCaseStudyExamples >> factorialReduced [
	<gtExample>
	| result |
	result := self factorial.
	result reduce.
	^ result
]

{ #category : #accessing }
SPLCaseStudyExamples >> factorialStep7 [
	<gtExample>
	| result |
	result := self factorial.
	1 to: 7 do: [ :n | result step ].
	^ result
]

{ #category : #accessing }
SPLCaseStudyExamples >> factorialStepBeforeLast [
	<gtExample>
	^ self factorialReduced trace nextToLast
]

{ #category : #accessing }
SPLCaseStudyExamples >> fibonacci [
	<gtExample>
	^ SPL fibonacci
]

{ #category : #accessing }
SPLCaseStudyExamples >> hello [
	<gtExample>
	^ SPL hello
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4 [
	<gtExample>
	| context |
	context := self context: 'var x = 3; print x + 4;'.
	self assert: context continuation isReduced not.
	self assert: context environment isEmpty.
	self assert: context output isEmpty.
	self assert: context trace size equals: 1.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step2 [
	<gtExample>
	| context |
	context := self print3plus4.
	context step.
	self assert: context continuation isReduced not.
	self assert: context environment notEmpty.
	self assert: (context environment getVariableNamed: 'x') value equals: 3.
	self assert: context output isEmpty.
	self assert: context trace size equals: 2.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step3 [
	<gtExample>
	| context |
	context := self print3plus4step2.
	context step.
	self assert: context continuation isReduced not.
	self assert: context environment notEmpty.
	self assert: (context environment getVariableNamed: 'x') value equals: 3.
	self assert: context output isEmpty.
	self assert: context trace size equals: 3.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step4 [
	<gtExample>
	| context |
	context := self print3plus4step3.
	context step.
	self assert: context continuation isReduced not.
	self assert: context environment notEmpty.
	self assert: (context environment getVariableNamed: 'x') value equals: 3.
	self assert: context output isEmpty.
	self assert: context trace size equals: 4.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step5 [
	<gtExample>
	| context |
	context := self print3plus4step4.
	context step.
	self assert: context continuation isReduced not.
	self assert: context environment notEmpty.
	self assert: (context environment getVariableNamed: 'x') value equals: 3.
	self assert: context output isEmpty.
	self assert: context trace size equals: 5.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step6 [
	<gtExample>
	| context |
	context := self print3plus4step5.
	context step.
	self assert: context continuation isReduced not.
	self assert: context environment notEmpty.
	self assert: (context environment getVariableNamed: 'x') value equals: 3.
	self assert: context output allButLast equals: '7'.
	self assert: context trace size equals: 6.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step7 [
	<gtExample>
	| context |
	context := self print3plus4step6.
	context step.
	self assert: context continuation isReduced.
	self assert: context environment notEmpty.
	self assert: (context environment getVariableNamed: 'x') value equals: 3.
	self assert: context output allButLast equals: '7'.
	self assert: context trace size equals: 7.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> splNodeHierarchy [
	<gtExample>
	<noTest>
	^ GtPhlowView empty tree
		items: [ {SPLNode} ];
		children: #subclasses;
		expandAll;
		yourself
]
