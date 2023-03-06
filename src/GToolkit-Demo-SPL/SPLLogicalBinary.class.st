Class {
	#name : #SPLLogicalBinary,
	#superclass : #SPLBinary,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #evaluating }
SPLLogicalBinary >> evaluateIn: anEnvironment [
	| result |
	self assert: self left isReduced.
	self assert: self right isReduced.
	self assert: self left isSPLBoolean.
	self assert: self right isSPLBoolean.
	result := self left value
			perform: self selectorForOperator
			withArguments: {self right value}.
	^ SPLBoolean for: result
]

{ #category : #constants }
SPLLogicalBinary >> operators [
	^ {'and'.
		'or'}
]

{ #category : #printing }
SPLLogicalBinary >> printOn: aStream [
	"Generate parentheses, even if not needed, to make the parse order clear."

	aStream
		nextPut: $(;
		print: self left;
		space;
		nextPutAll: self operator;
		space;
		print: self right;
		nextPut: $)
]

{ #category : #testing }
SPLLogicalBinary >> returnsBoolean [
	^ true
]

{ #category : #testing }
SPLLogicalBinary >> returnsNumber [
	^ false
]

{ #category : #evaluating }
SPLLogicalBinary >> selectorForOperator [
	self operator = 'and' ifTrue: [ ^ #& ].
	self operator = 'or' ifTrue: [ ^ #| ].
	^ self operator asSymbol
]
