"
A DynamicAccessors demos lazy compilation of methods using minimal objects.
"
Class {
	#name : #DynamicAccessors,
	#superclass : #Object,
	#instVars : [
		'x'
	],
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #'error-handling' }
DynamicAccessors >> doesNotUnderstand: aMessage [ 
	| messageName |
	messageName := aMessage selector asString.
	(self class instVarNames includes: messageName)
		ifTrue: [self class compile: messageName , String cr , ' ^ ' , messageName.
			^ aMessage sendTo: self].
	super doesNotUnderstand: aMessage
]
