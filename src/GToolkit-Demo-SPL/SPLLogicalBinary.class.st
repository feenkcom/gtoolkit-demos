Class {
	#name : #SPLLogicalBinary,
	#superclass : #SPLBinary,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #constants }
SPLLogicalBinary >> operators [
	^ {'and'.
		'or'}
]

{ #category : #printing }
SPLLogicalBinary >> printOn: aStream [
	"Generate parentheses, even if not needed, to make the parse order clear."

	aStream nextPut: $(.
	self left printOn: aStream.
	aStream nextPut: Character space.
	aStream nextPutAll: self operator.
	aStream nextPut: Character space.
	self right printOn: aStream.
	aStream nextPut: $)
]
