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
		assert: ((self left isSPLNumber and: [ self right isSPLNumber ])
				or: [ (self left isSPLBoolean and: [ self right isSPLBoolean ])
						or: [ self left isSPLString and: [ self right isSPLString ] ] ])
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
SPLBinary >> equalsOp: aContext [
	"NB: We must not override =="

	self assert: self left isNumber.
	self assert: self right isNumber.
	^ SPLBoolean for: self left value == self right value
]

{ #category : #evaluating }
SPLBinary >> evaluateIn: aContext [
	self assert: self left isSPLValue.
	self assert: self right isSPLValue.
	^ self returnsBoolean
		ifTrue: [ self comparison: aContext ]
		ifFalse: [ self assert: self returnsNumber.
			self numsToNum: aContext ]
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
	self assert: self left isSPLNumber.
	self assert: self right isSPLNumber.
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

	aStream
		nextPut: $(;
		print: self left;
		nextPutAll: self operator;
		print: self right;
		nextPut: $)
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

{ #category : #stepping }
SPLBinary >> stepIn: aContext [
	^ self left isSPLValue
		ifTrue: [ self right isSPLValue
				ifTrue: [ self evaluateIn: aContext ]
				ifFalse: [ self class
						left: self left
						operator: self operator
						right: (self right stepIn: aContext) ] ]
		ifFalse: [ self class
				left: (self left stepIn: aContext)
				operator: self operator
				right: self right ]
]
