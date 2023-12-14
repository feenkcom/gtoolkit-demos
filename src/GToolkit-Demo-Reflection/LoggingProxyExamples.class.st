Class {
	#name : #LoggingProxyExamples,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #running }
LoggingProxyExamples >> freshLoggingProxy [
	"NB: The point and the proxy swap object ids."
	<gtExample>
	| point proxy |
	point := 1 @ 2.
	LoggingProxy for: point.
	proxy := point. "Alias"
	self assert: proxy invocationCount equals: 0.
	^ proxy
]

{ #category : #running }
LoggingProxyExamples >> loggingProxyWithSelfSends [
	"rectangle: does two self-sends, but self-sends are not intercepted, so only the send to #rectangle: is counted"

	<gtExample>
	| proxy |
	proxy := self freshLoggingProxy.
	self assert: proxy invocationCount equals: 0.
	self assert: (proxy rectangle: 3 @ 4) area equals: 4.
	self deny: proxy invocationCount = 4.
	self assert: proxy invocationCount equals: 1.
	^ proxy
]

{ #category : #running }
LoggingProxyExamples >> usedLoggingProxy [
	<gtExample>
	| proxy |
	proxy := self freshLoggingProxy.
	self assert: proxy invocationCount equals: 0.
	self assert: proxy + (3 @ 4) equals: 4 @ 6.
	self assert: proxy invocationCount equals: 1.
	^ proxy
]
