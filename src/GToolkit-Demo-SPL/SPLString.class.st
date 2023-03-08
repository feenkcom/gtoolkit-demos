"
I am an SPL string value.

{{gtExample:name=SPLParserExamples>>#helloString}}

"
Class {
	#name : #SPLString,
	#superclass : #SPLValue,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLString >> isSPLString [
	^ true
]

{ #category : #printing }
SPLString >> printOn: aStream [
	aStream
		nextPut: $";
		nextPutAll: self value;
		nextPut: $"
]
