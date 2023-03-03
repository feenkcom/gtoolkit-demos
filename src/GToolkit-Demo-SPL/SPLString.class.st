Class {
	#name : #SPLString,
	#superclass : #SPLValue,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #printing }
SPLString >> printOn: aStream [
	aStream
		nextPut: $";
		nextPutAll: self value;
		nextPut: $"
]
