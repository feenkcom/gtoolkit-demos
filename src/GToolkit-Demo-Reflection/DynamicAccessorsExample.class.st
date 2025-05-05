"
Demonstrates the use of overriding #doesNotUnderstand: to dynamically create accessors.
"
Class {
	#name : #DynamicAccessorsExample,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #running }
DynamicAccessorsExample >> dynamicAccessor [
	<gtExample>
	<return: #DynamicAccessors>
	| dynamicAccessor |
	dynamicAccessor := DynamicAccessors new.

	self deny: (dynamicAccessor class methodDict keys includes: #x).
	self assert: dynamicAccessor x equals: nil.
	self assert: (dynamicAccessor class methodDict keys includes: #x).
	DynamicAccessors removeSelector: #x.

	^ dynamicAccessor
]
