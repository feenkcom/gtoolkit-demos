"
Some live examples for the `PetitParser SPL case study` GT Book pages.
"
Class {
	#name : #SPLCaseStudyExamples,
	#superclass : #SPLContextExamples,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4 [
	<gtExample>
	| context |
	context := self context: 'print 3+4;'.
	self assert: context output isEmpty.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step1 [
	<gtExample>
	| context |
	context := self print3plus4.
	context step.
	self assert: context output isEmpty.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step2 [
	<gtExample>
	| context |
	context := self print3plus4step1.
	context step.
	self assert: context output allButLast equals: '7'.
	^ context
]

{ #category : #accessing }
SPLCaseStudyExamples >> print3plus4step3 [
	<gtExample>
	| context |
	context := self print3plus4step2.
	context step.
	self assert: context continuation isReduced.
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
