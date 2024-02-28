"
We replace a CompiledMethod in a method dictionary with a Method Wrapper, an object that implements #run:with:in: and forwards sends to the original compiled method instance. When the method wrapper is uninstalled, the original compiled method is restored.
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

{ #category : #dummy }
MinimalMethodWrapper >> cachePragmas [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #dummy }
MinimalMethodWrapper >> flushCache [
	"Dummy method to be compatible with CompiledMethod"
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

{ #category : #dummy }
MinimalMethodWrapper >> methodClass: aMethodClass [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #evaluation }
MinimalMethodWrapper >> run: aSelector with: anArray in: aReceiver [
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : #dummy }
MinimalMethodWrapper >> selector: aSymbol [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #actions }
MinimalMethodWrapper >> uninstall [
	method methodClass methodDictionary 
		at: method selector put: method
]
