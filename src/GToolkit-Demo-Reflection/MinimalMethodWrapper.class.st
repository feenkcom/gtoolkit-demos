"
I replace a CompiledMethod in a method dictionary by implementing #run:with:in: and forwarding sends to the original compiled method instance. When I am uninstalled, the original compiled method is restored.
I also implement `#doesNotUnderstand:` so all other messages are forwarded to my wrapped method.
"
Class {
	#name : #MinimalMethodWrapper,
	#superclass : #Object,
	#instVars : [
		'method'
	],
	#category : #'GToolkit-Demo-Reflection-Intercession'
}

{ #category : #'instance creation' }
MinimalMethodWrapper class >> on: aCompiledMethod [
	^ self new
		method: aCompiledMethod;
		yourself
]

{ #category : #'gt - compatibility' }
MinimalMethodWrapper >> doesNotUnderstand: aMessage [
	"Forward all other messages to the compiled method."
	^ aMessage sendTo: method
]

{ #category : #actions }
MinimalMethodWrapper >> install [
	method methodClass methodDictionary
		at: method selector put: self
]

{ #category : #accessing }
MinimalMethodWrapper >> method: anObject [
	method := anObject
]

{ #category : #evaluation }
MinimalMethodWrapper >> run: aSelector with: anArray in: aReceiver [
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : #actions }
MinimalMethodWrapper >> uninstall [
	method methodClass methodDictionary 
		at: method selector put: method
]
