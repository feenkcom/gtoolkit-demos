"
I am a pseudo-statement only used in the interpreter.
There is no ""stop"" statement in the syntax.
"
Class {
	#name : #SPLStopStatement,
	#superclass : #SPLNode,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLStopStatement >> isReduced [
	^ true
]

{ #category : #printing }
SPLStopStatement >> printOn: aStream [
	aStream nextPutAll: 'STOP'
]

{ #category : #stepping }
SPLStopStatement >> stepIn: aContext [
	^ self
]
