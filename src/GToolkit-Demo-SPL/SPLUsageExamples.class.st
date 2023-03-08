"
I provide some examples of how to use the SPL facade.
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
