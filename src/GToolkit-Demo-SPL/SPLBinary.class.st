Class {
	#name : #SPLBinary,
	#superclass : #SPLOperatorExpression,
	#instVars : [
		'left',
		'right'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLBinary class >> left: anExpression operator: anOperator right: anExpression2 [
	^ self new
		left: anExpression;
		operator: anOperator;
		right: anExpression2;
		yourself
]

{ #category : #evaluating }
SPLBinary >> comparison: anEnvironment [
	| result |
	self
		assert: ((self left isNumber and: [ self right isNumber ])
				or: [ (self left isBoolean and: [ self right isBoolean ])
						or: [ self left isString and: [ self right isString ] ] ])
		description: 'Arguments to a comparison operator must have the same type.'.
	result := self left value
			perform: self selectorForOperator
			withArguments: {self right value}.
	^ SPLBoolean for: result
]

{ #category : #constants }
SPLBinary >> comparisonOperators [
	"These compare homogeneous values (both same type) return a Boolean"

	^ {'<'.
		'<='.
		'>'.
		'>='.
		'=='.
		'!='}
]

{ #category : #operators }
SPLBinary >> equalsOp: anEnvironment [
	"NB: We must not override =="

	self assert: self left isNumber.
	self assert: self right isNumber.
	^ SPLBoolean for: self left value == self right value
]

{ #category : #evaluating }
SPLBinary >> evaluateIn: anEnvironment [
	self assert: self left isValue.
	self assert: self right isValue.
	^ self returnsBoolean
		ifTrue: [ self comparison: anEnvironment ]
		ifFalse: [ self assert: self returnsNumber.
			self numsToNum: anEnvironment ]
]

{ #category : #accessing }
SPLBinary >> left [
	^ left
]

{ #category : #accessing }
SPLBinary >> left: anExpression [
	left := anExpression
]

{ #category : #constants }
SPLBinary >> numberOperators [
	"These operate over numbers and return a number"

	^ {'*'.
		'/'.
		'+'.
		'-'}
]

{ #category : #evaluating }
SPLBinary >> numsToNum: anEnvironment [
	| result |
	self assert: self left isNumber.
	self assert: self right isNumber.
	result := self left value
			perform: self selectorForOperator
			withArguments: {self right value}.
	^ SPLNumber for: result
]

{ #category : #constants }
SPLBinary >> operators [
	^ self comparisonOperators , self numberOperators
]

{ #category : #printing }
SPLBinary >> printOn: aStream [
	"Generate parentheses, even if not needed, to make the parse order clear."

	aStream nextPut: $(.
	self left printOn: aStream.
	aStream nextPutAll: self operator.
	self right printOn: aStream.
	aStream nextPut: $)
]

{ #category : #testing }
SPLBinary >> returnsBoolean [
	^ self comparisonOperators includes: self operator
]

{ #category : #testing }
SPLBinary >> returnsNumber [
	^ self numberOperators includes: self operator
]

{ #category : #accessing }
SPLBinary >> right [
	^ right
]

{ #category : #accessing }
SPLBinary >> right: anExpression [
	right := anExpression
]

{ #category : #evaluating }
SPLBinary >> selectorForOperator [
	"In most cases, the Smalltalk selector is the same as the SPL operator."

	self operator = '!=' ifTrue: [ ^ #~= ].

	self operator = '==' ifTrue: [ ^ #= ].
	^ self operator asSymbol
]

{ #category : #evaluating }
SPLBinary >> stepIn: anEnvironment [
	^ self left isValue
		ifTrue: [ self right isValue
				ifTrue: [ self evaluateIn: anEnvironment ]
				ifFalse: [ self class
						left: self left
						operator: self operator
						right: (self right stepIn: anEnvironment) ] ]
		ifFalse: [ self class
				left: (self left stepIn: anEnvironment)
				operator: self operator
				right: self right ]
]
