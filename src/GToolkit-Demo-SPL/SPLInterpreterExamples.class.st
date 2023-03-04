Class {
	#name : #SPLInterpreterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #accessing }
SPLInterpreterExamples >> a12dividedBy3is4 [
	<gtExample>
	| result input |
	input := self parseExpression: '12/3'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value equals: 4.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3equals3 [
	<gtExample>
	| result input |
	input := self parseExpression: '3==3'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3isNot4 [
	<gtExample>
	| result input |
	input := self parseExpression: '3!=4'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3lessThan4 [
	<gtExample>
	| result input |
	input := self parseExpression: '3<4'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3lessThanEqual4 [
	<gtExample>
	| result input |
	input := self parseExpression: '3<=4'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3plus4 [
	<gtExample>
	| result |
	result := self parseExpression: '3+4'.
	self assert: result isReduced not.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3plus4is7 [
	<gtExample>
	| result input |
	input := self a3plus4.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value equals: 7.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3plus4times5 [
	<gtExample>
	| result input |
	input := self parseExpression: '3+4*5'.
	result := self newContext reduce: input.
	self assert: result isReduced.
	self assert: result value equals: 23.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a3times4is12 [
	<gtExample>
	| result input |
	input := self parseExpression: '3*4'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value equals: 12.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a42 [
	<gtExample>
	| result |
	result := self parseExpression: '42'.
	self assert: result isReduced.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a4greaterThan3 [
	<gtExample>
	| result input |
	input := self parseExpression: '4>3'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a4greaterThanEqual3 [
	<gtExample>
	| result input |
	input := self parseExpression: '4>=3'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> a4minus3is1 [
	<gtExample>
	| result input |
	input := self parseExpression: '4-3'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value equals: 1.
	^ result
]

{ #category : #parsing }
SPLInterpreterExamples >> context: aString [
	^ (self parse: aString) asContext
]

{ #category : #accessing }
SPLInterpreterExamples >> helloEqualsHello [
	<gtExample>
	| result input |
	input := self parseExpression: '"hello" == "hello"'.
	result := self newContext reduce: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> minus3 [
	<gtExample>
	| result input |
	input := self parseExpression: '-3'.
	result := self newContext reduce: input.
	self assert: result isReduced.
	self assert: result value equals: -3.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> newContext [
	<gtExample>
	| result |
	result := SPLContext new.
	self assert: result environment isEmpty.
	self assert: result environment size equals: 0.
	self assert: result output isEmpty.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> newEnvironment [
	<gtExample>
	| result |
	result := SPLEnvironment new.
	self assert: result isEmpty.
	self assert: result size equals: 0.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> notTrueIsFalse [
	<gtExample>
	| result input |
	input := self parseExpression: '!true'.
	result := self newContext reduce: input.
	self assert: result isReduced.
	self assert: result value not.
	^ result
]

{ #category : #parsing }
SPLInterpreterExamples >> parse: aString [
	^ self parserClass parse: aString
]

{ #category : #parsing }
SPLInterpreterExamples >> parseExpression: aString [ 
	^ self parserClass new expression parse: aString
]

{ #category : #constants }
SPLInterpreterExamples >> parserClass [
	^ SPLParser
]

{ #category : #accessing }
SPLInterpreterExamples >> printHello [
	"TO DO"

	<gtExample>
	| result input |
	input := self context: 'print "hello";'.
	result := input reduce.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> trueAndTrueIsTrue [
	<gtExample>
	| result input |
	input := self parseExpression: 'true and true'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> trueNotEqualFalse [
	<gtExample>
	| result input |
	input := self parseExpression: 'true != false'.
	result := self newContext reduce: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]

{ #category : #accessing }
SPLInterpreterExamples >> trueOrFalseIsTrue [
	<gtExample>
	| result input |
	input := self parseExpression: 'true or false'.
	result := self newContext step: input.
	self assert: result isReduced.
	self assert: result value.
	^ result
]
