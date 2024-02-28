"
We replace a CompiledMethod in a method dictionary with a Method Wrapper, an object that implements #run:with:in: and forwards sends to the original compiled method instance. When the method wrapper is uninstalled, the original compiled method is restored.
"
Class {
	#name : #SimpleMethodWrapper,
	#superclass : #Object,
	#instVars : [
		'method'
	],
	#category : #'GToolkit-Demo-Reflection-Intercession'
}

{ #category : #'instance creation' }
SimpleMethodWrapper class >> on: aCompiledMethod [
	^ self new
		method: aCompiledMethod;
		yourself
]

{ #category : #dummy }
SimpleMethodWrapper >> cachePragmas [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #dummy }
SimpleMethodWrapper >> flushCache [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #actions }
SimpleMethodWrapper >> install [
	method methodClass methodDictionary
		at: method selector put: self
]

{ #category : #accessing }
SimpleMethodWrapper >> method: anObject [
	method := anObject
]

{ #category : #dummy }
SimpleMethodWrapper >> methodClass: aMethodClass [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #evaluation }
SimpleMethodWrapper >> run: aSelector with: anArray in: aReceiver [
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : #dummy }
SimpleMethodWrapper >> selector: aSymbol [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #actions }
SimpleMethodWrapper >> uninstall [
	method methodClass methodDictionary 
		at: method selector put: method
]
