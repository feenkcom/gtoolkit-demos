Class {
	#name : #LoggingMethodWrapperTest,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #running }
LoggingMethodWrapperTest >> testLogging [
	"NB: In Pharo 9, factorial is not recursive. Run the following to replace it:
		Integer compile: 'factorial
			self > 0 ifTrue: [ ^ self * (self - 1) factorial ].
			self = 0 ifTrue: [ ^ 1 ].
			self error: ''Not valid for negative integers'''
	"

	| logger |
	logger := LoggingMethodWrapper on: Integer >> #factorial.
	self assert: logger invocationCount equals: 0.
	5 factorial.
	self assert: logger invocationCount equals: 0.
	logger install.
	[ 5 factorial ]
		ensure: [ logger uninstall ].
	self assert: logger invocationCount equals: 6.
	Integer flushCache.
	10 factorial.
	self assert: logger invocationCount equals: 6
]
