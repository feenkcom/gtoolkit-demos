"
I provide some examples of how to use the SPL facade. These examples are used in the {{gtClass:name=SPL}}  class comment.
"
Class {
	#name : #SPLUsageExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #accessing }
SPLUsageExamples >> context [
	<gtExample>
	<noTest>
	^ SPL contextFor: 'print "Hello world!";'
]

{ #category : #accessing }
SPLUsageExamples >> run [
	<gtExample>
	<noTest>
	^ SPL run: 'print "Hello world!";'
]
