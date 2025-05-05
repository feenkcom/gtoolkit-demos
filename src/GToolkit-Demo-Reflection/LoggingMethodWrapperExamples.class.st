Class {
	#name : #LoggingMethodWrapperExamples,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #running }
LoggingMethodWrapperExamples >> activeLogger [
	"We install the logger on Integer>>#slowFactorial and see that the invocation count is now updated."

	<gtExample>
	<return: #LoggingMethodWrapper>
	| logger |
	logger := self inactiveLogger.
	logger install.
	[ 5 slowFactorial ] ensure: [ logger uninstall ].
	self assert: logger invocationCount equals: 6.
	Integer flushCache.
	10 slowFactorial.
	self assert: logger invocationCount equals: 6.
	^ logger
]

{ #category : #running }
LoggingMethodWrapperExamples >> inactiveLogger [
	"We create a logger for Integer>>#slowFactorial but do not install it."

	<gtExample>
	<return: #LoggingMethodWrapper>
	| logger |
	logger := LoggingMethodWrapper on: Integer >> #slowFactorial.
	self assert: logger invocationCount equals: 0.
	self assert: 5 slowFactorial equals: 120.
	self assert: logger invocationCount equals: 0.
	^ logger
]
