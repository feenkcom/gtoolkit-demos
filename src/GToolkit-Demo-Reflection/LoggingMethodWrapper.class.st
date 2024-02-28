"
We extend the `#run:with:in:` method, keeping track of an invocation count.
The only happens while the method wrapper is installed.
"
Class {
	#name : #LoggingMethodWrapper,
	#superclass : #SimpleMethodWrapper,
	#instVars : [
		'invocationCount'
	],
	#category : #'GToolkit-Demo-Reflection-Intercession'
}

{ #category : #initialization }
LoggingMethodWrapper >> initialize [
	invocationCount := 0
]

{ #category : #accessing }
LoggingMethodWrapper >> invocationCount [
	^ invocationCount
]

{ #category : #accessing }
LoggingMethodWrapper >> invocationCount: anObject [
	invocationCount := anObject
]

{ #category : #evaluation }
LoggingMethodWrapper >> run: aSelector with: anArray in: aReceiver [
	invocationCount := 1 + invocationCount.
	^ super
		run: aSelector
		with: anArray
		in: aReceiver
]
