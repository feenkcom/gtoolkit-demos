Class {
	#name : #LoggingProxyExamples,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #running }
LoggingProxyExamples >> freshLoggingProxy [
	"NB: The point and the proxy swap object ids."

	<gtExample>
	<return: #LoggingProxy>
	| point proxy |
	point := 1 @ 2.
	self assert: point class equals: Point.
	LoggingProxy for: point.
	self assert: point class equals: LoggingProxy.
	proxy := point.	"Alias"
	self assert: proxy subject class equals: Point.
	self assert: proxy messageLog isEmpty.
	^ proxy
]

{ #category : #running }
LoggingProxyExamples >> loggingProxyWithSelfSends [
	"rectangle: does two self-sends, but self-sends are not intercepted, so only the send to #rectangle: is counted"

	<gtExample>
	<return: #LoggingProxy>
	| proxy |
	proxy := self freshLoggingProxy.
	self assert: proxy messageLog isEmpty.
	self assert: (proxy rectangle: 3 @ 4) area equals: 4.
	self deny: proxy messageLog size equals: 4.
	self assert: proxy messageLog size equals: 1.
	^ proxy
]

{ #category : #running }
LoggingProxyExamples >> usedLoggingProxy [
	<gtExample>
	<return: #LoggingProxy>
	| proxy |
	proxy := self freshLoggingProxy.
	self assert: proxy messageLog isEmpty.
	self assert: proxy + (3 @ 4) equals: 4 @ 6.
	self assert: proxy printString equals: '(1@2)'.
	self assert: proxy messageLog size equals: 2.
	^ proxy
]
