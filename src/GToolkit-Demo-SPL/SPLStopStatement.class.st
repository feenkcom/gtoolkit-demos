"
I am a pseudo-statement only used in the interpreter.
There is no ""stop"" statement in the syntax.
"
Class {
	#name : #SPLStopStatement,
	#superclass : #SPLNode,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLStopStatement >> isStopped [
	^ true
]

{ #category : #printing }
SPLStopStatement >> printOn: aStream [
	aStream nextPutAll: 'STOP'
]
