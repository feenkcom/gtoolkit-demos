Class {
	#name : #SPLExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #accessing }
SPLExamples >> context [
	<gtExample>
	<noTest>
	^ SPL contextFor: 'print "Hello world!";'
]

{ #category : #accessing }
SPLExamples >> factorial [
	<gtExample>
	<noTest>
	^ SPL contextFor: SPLContextExamples new factorialSource
]

{ #category : #accessing }
SPLExamples >> fibonacci [
	<gtExample>
	<noTest>
	^ SPL contextFor: SPLGrammarExamples new fibonacciSource
]

{ #category : #accessing }
SPLExamples >> run [
	<gtExample>
	<noTest>
	^ SPL run: 'print "Hello world!";'
]
