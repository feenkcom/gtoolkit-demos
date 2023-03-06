"
I am a pseudo-statement only used in the interpreter.
There is no ""stop"" statement in the syntax.
"
Class {
	#name : #SPLSkipStatement,
	#superclass : #SPLStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLSkipStatement >> isReduced [
	^ true
]

{ #category : #printing }
SPLSkipStatement >> printOn: aStream [
	aStream nextPutAll: 'skip;'
]

{ #category : #stepping }
SPLSkipStatement >> stepIn: aContext [
	^ self
]
