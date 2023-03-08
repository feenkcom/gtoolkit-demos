"
I represent an SPL number.

{{gtExample:name=SPLParserExamples>>#integer42}}


"
Class {
	#name : #SPLNumber,
	#superclass : #SPLValue,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLNumber >> isSPLNumber [
	^ true
]
