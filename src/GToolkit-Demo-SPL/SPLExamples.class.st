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
SPLExamples >> run [
	<gtExample>
	<noTest>
	^ SPL run: 'print "Hello world!";'
]
