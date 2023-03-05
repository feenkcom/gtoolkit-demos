Class {
	#name : #SPLInterpreterExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #example }
SPLInterpreterExamples >> a12dividedBy3is4 [
	<gtExample>
	| result context |
	context := self contextForExpression: '12/3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 4.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3equals3 [
	<gtExample>
	| result context |
	context := self contextForExpression: '3==3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3isNot4 [
	<gtExample>
	| result context |
	context := self contextForExpression: '3!=4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3lessThan4 [
	<gtExample>
	| result context |
	context := self contextForExpression: '3<4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3lessThanEqual4 [
	<gtExample>
	| result context |
	context := self contextForExpression: '3<=4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3plus4 [
	<gtExample>
	| result |
	result := self parseExpression: '3+4'.
	self assert: result isReduced not.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3plus4is7 [
	<gtExample>
	| result context |
	context := self a3plus4 asContext.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 7.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3plus4times5 [
	<gtExample>
	| result context |
	context := self contextForExpression: '3+4*5'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value equals: 23.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a3times4is12 [
	<gtExample>
	| result context |
	context := self contextForExpression: '3*4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 12.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a42 [
	<gtExample>
	| result |
	result := self parseExpression: '42'.
	self assert: result isSPLValue.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a4greaterThan3 [
	<gtExample>
	| result context |
	context := self contextForExpression: '4>3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a4greaterThanEqual3 [
	<gtExample>
	| result context |
	context := self contextForExpression: '4>=3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> a4minus3is1 [
	<gtExample>
	| result context |
	context := self contextForExpression: '4-3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 1.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> blockStatement [
	<gtExample>
	| result context |
	context := self context: '{ 1+2; 3*4/2; print 7; }'.
	result := context.
	result := context reduce.
	self assert: context output equals: '7
'.
	^ context
]

{ #category : #parsing }
SPLInterpreterExamples >> context: aString [
	^ (self parse: aString) asContext
]

{ #category : #parsing }
SPLInterpreterExamples >> contextForExpression: aString [
	^ (self parseExpression: aString) asContext
]

{ #category : #example }
SPLInterpreterExamples >> expressionStatement [
	<gtExample>
	| result context |
	context := self context: '3+4;'.
	result := context.
	result := context step.
	self assert: result statements first expression value equals: 7.
	self assert: context output equals: ''.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> factorialSource [
<gtExample>
^ 'var x=5;
var fact=1;
while (x>0) {
	fact = fact * x;
	x = x - 1;
}
print fact;'
]

{ #category : #example }
SPLInterpreterExamples >> fibonacci [
	"<gtExample>"
	| result context |
	context := self context: SPLGrammarExamples new fibonacciSource.
	result := context.
	result := context reduce.
	self
		assert: context output
		equals: SPLGrammarExamples new fibonacciOracle asString , String cr.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> helloEqualsHello [
	<gtExample>
	| result context |
	context := self contextForExpression: '"hello" == "hello"'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> ifElseStatement [
	<gtExample>
	| result context |
	context := self context: 'if (3>4) { print 7; } else { print "else ok"; }'.
	result := context.
	result := context reduce.
	self assert: context output equals: 'else ok
'.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> ifStatement [
	<gtExample>
	| result context |
	context := self context: 'if (3<4) { print 7; }'.
	result := context.
	result := context reduce.
	self assert: context output equals: '7
'.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> minus3 [
	<gtExample>
	| result input |
	input := self contextForExpression: '-3'.
	result := input reduce.
	self assert: result isSPLValue.
	self assert: result value equals: -3.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> newContext [
	<gtExample>
	| result |
	result := SPLContext new.
	self assert: result environment isEmpty.
	self assert: result environment size equals: 0.
	self assert: result output isEmpty.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> newEnvironment [
	<gtExample>
	| result |
	result := SPLEnvironment new.
	self assert: result isEmpty.
	self assert: result size equals: 0.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> notTrueIsFalse [
	<gtExample>
	| result context |
	context := self contextForExpression: '!true'.
	result := context reduce.
	self assert: result isSPLValue.
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

{ #category : #example }
SPLInterpreterExamples >> printHello [
	<gtExample>
	| result context |
	context := self context: 'print "hello";'.
	result := context.
	result := context reduce.
	self assert: context output equals: 'hello
'.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> threeEqualsThree [
	<gtExample>
	| result context |
	context := self contextForExpression: '3 == 3'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> trueAndTrueIsTrue [
	<gtExample>
	| result context |
	context := self contextForExpression: 'true and true'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> trueNotEqualFalse [
	<gtExample>
	| result context |
	context := self contextForExpression: 'true != false'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> trueOrFalseIsTrue [
	<gtExample>
	| result context |
	context := self contextForExpression: 'true or false'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLInterpreterExamples >> varXassignedAndPrinted [
	<gtExample>
	| result context |
	context := self context: 'var x; x = 6*7; print x;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariable: 'x') value equals: 42.
	self assert: context output equals: '42
'.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> varXdeclared [
	<gtExample>
	| result context |
	context := self context: 'var x;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariable: 'x') isSPLNil.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> varXinitializedTo42 [
	<gtExample>
	| result context |
	context := self context: 'var x = 42;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariable: 'x') value equals: 42.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> varXinitializedTo42AndPrinted [
	<gtExample>
	| result context |
	context := self context: 'var x = 42; print x;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariable: 'x') value equals: 42.
	self assert: (context output) value equals: '42
'.
	^ context
]

{ #category : #example }
SPLInterpreterExamples >> whileStatementInFactorial [
	<gtExample>
	| result context |
	context := self context: self factorialSource.
	result := context.
	result := context reduce.
	self assert: context output equals: '120
'.
	^ context
]
