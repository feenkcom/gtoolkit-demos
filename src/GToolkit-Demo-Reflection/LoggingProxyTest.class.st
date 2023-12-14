Class {
	#name : #LoggingProxyTest,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #running }
LoggingProxyTest >> testDelegation [
	| point |
	point := 1 @ 2.
	"LoggingProxy new become: point."
	LoggingProxy for: point.
	self assert: point invocationCount equals: 0.
	self assert: point + (3 @ 4) equals: 4 @ 6.
	self assert: point invocationCount equals: 1
]

{ #category : #running }
LoggingProxyTest >> testSelf [
	| point |
	point := 1 @ 2.
	LoggingProxy new become: point.
	self assert: point invocationCount equals: 0.
	self assert: (point rectangle: 3 @ 4) area equals: 4.
	"rectangle: does two self-sends"
	"oops -- self sends are not intercepted"
	self deny: point invocationCount = 4.
	self assert: point invocationCount equals: 1
]
