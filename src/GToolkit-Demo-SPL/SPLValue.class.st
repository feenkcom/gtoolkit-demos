"
I am the abstract superclass of SPL value nodes.
"
Class {
	#name : #SPLValue,
	#superclass : #SPLExpression,
	#instVars : [
		'value'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLValue class >> for: aValue [
	^ self new value: aValue
]

{ #category : #testing }
SPLValue >> isReduced [
	^  true
]

{ #category : #testing }
SPLValue >> isSPLValue [
	^  true
]

{ #category : #printing }
SPLValue >> printOn: aStream [
	aStream print: self value
]

{ #category : #stepping }
SPLValue >> stepInContext: aContext [
	"Should we raise an error, or just return ourself?"

	^ self
]

{ #category : #accessing }
SPLValue >> subNodes [
	^ super subNodes
		add: self value;
		yourself
]

{ #category : #accessing }
SPLValue >> value [
	^ value
]

{ #category : #accessing }
SPLValue >> value: aValue [
	value := aValue
]
