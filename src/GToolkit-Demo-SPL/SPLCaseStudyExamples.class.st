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
	context := self context: 'val helloString; hello = "hello"; print helloString;'.
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
