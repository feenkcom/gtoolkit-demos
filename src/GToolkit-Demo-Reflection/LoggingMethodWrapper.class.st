"
In this approach we replace a CompiledMethod in a method dictionary with a ""Method Wrapper"", an object that implements #run:with:in: and remembers to original compiled method instance. When the method wrapper is uninstalled, the original compiled method is restored.
"
Class {
	#name : #LoggingMethodWrapper,
	#superclass : #Object,
	#instVars : [
		'invocationCount',
		'method'
	],
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #'instance creation' }
LoggingMethodWrapper class >> on: aCompiledMethod [
	^ self new initializeOn: aCompiledMethod
]

{ #category : #dummy }
LoggingMethodWrapper >> cachePragmas [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #dummy }
LoggingMethodWrapper >> flushCache [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #accessing }
LoggingMethodWrapper >> initialize [
	invocationCount := 0
]

{ #category : #'initialize-release' }
LoggingMethodWrapper >> initializeOn: aCompiledMethod [
	method := aCompiledMethod.
	invocationCount := 0
]

{ #category : #actions }
LoggingMethodWrapper >> install [
	method methodClass methodDictionary
		at: method selector put: self
]

{ #category : #accessing }
LoggingMethodWrapper >> invocationCount [
	^ invocationCount
]

{ #category : #dummy }
LoggingMethodWrapper >> methodClass: aMethodClass [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #evaluation }
LoggingMethodWrapper >> run: aSelector with: anArray in: aReceiver [
	invocationCount := invocationCount + 1.
	^ aReceiver withArgs: anArray executeMethod: method
]

{ #category : #dummy }
LoggingMethodWrapper >> selector: aSymbol [
	"Dummy method to be compatible with CompiledMethod"
]

{ #category : #actions }
LoggingMethodWrapper >> uninstall [
	method methodClass methodDictionary 
		at: method selector put: method
]
