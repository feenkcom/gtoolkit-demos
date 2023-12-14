Class {
	#name : #MethodWrapperTest,
	#superclass : #TestCase,
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #'as yet unclassified' }
MethodWrapperTest >> testAnswer42 [
	| demoClass |
	Object
		subclass: #Demo
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'Demo'.
	demoClass := Smalltalk at: #Demo.
	self should: [ demoClass new answer42 ] raise: MessageNotUnderstood.
	demoClass methodDict at: #answer42 put: ObjectsAsMethodsExample new.
	self assert: demoClass new answer42 equals: 42.
	demoClass methodDict removeKey: #answer42.
	demoClass removeFromSystem
]
