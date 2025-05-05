"
I provide examples of executing SPL programs, using {{gtClass:name=SPLContext}}.

Most of my examples test that an interpreted code fragment returns a particular result.

For example:
{{gtExample:name=SPLContextExamples>>#printHello}}
"
Class {
	#name : #SPLContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #example }
SPLContextExamples >> a12dividedBy3is4 [
	<gtExample>
	<return: #SPLNumber>
	| result context |
	context := self contextForExpression: '12/3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 4.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3equals3 [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '3==3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3isNot4 [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '3!=4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3lessThan4 [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '3<4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3lessThanEqual4 [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '3<=4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3plus4 [
	<gtExample>
	<return: #SPLBinary>
	| result |
	result := self parseExpression: '3+4'.
	self assert: result isReduced not.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3plus4is7 [
	<gtExample>
	<return: #SPLNumber>
	| result context |
	context := self a3plus4 asContext.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 7.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3plus4times5 [
	<gtExample>
	<return: #SPLNumber>
	| result context |
	context := self contextForExpression: '3+4*5'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value equals: 23.
	^ result
]

{ #category : #example }
SPLContextExamples >> a3times4is12 [
	<gtExample>
	<return: #SPLNumber>
	| result context |
	context := self contextForExpression: '3*4'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 12.
	^ result
]

{ #category : #example }
SPLContextExamples >> a42 [
	<gtExample>
	<return: #SPLNumber>
	| result |
	result := self parseExpression: '42'.
	self assert: result isSPLValue.
	^ result
]

{ #category : #example }
SPLContextExamples >> a4greaterThan3 [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '4>3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> a4greaterThanEqual3 [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '4>=3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> a4minus3is1 [
	<gtExample>
	<return: #SPLNumber>
	| result context |
	context := self contextForExpression: '4-3'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value equals: 1.
	^ result
]

{ #category : #example }
SPLContextExamples >> blockStatement [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: '{ 1+2; 3*4/2; print 7; }'.
	result := context.
	result := context reduce.
	self assert: context output allButLast equals: '7'.
	^ context
]

{ #category : #parsing }
SPLContextExamples >> context: aString [
	^ (self parse: aString) asContext
]

{ #category : #parsing }
SPLContextExamples >> contextForExpression: aString [
	^ (self parseExpression: aString) asContext
]

{ #category : #example }
SPLContextExamples >> emptyTrace [
	<gtExample>
	<return: #SPLContext>
	| context |
	context := self context: ''.
	context reduce.
	self assert: context trace size equals: 1.
	self assert: context trace first equals: context.
	^ context
]

{ #category : #example }
SPLContextExamples >> expressionStatement [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: '3+4;'.
	result := context.
	result := context step.
	self assert: result statements first expression value equals: 7.
	self assert: context output equals: ''.
	^ context
]

{ #category : #example }
SPLContextExamples >> factorial [
	<gtExample>
	<return: #SPLContext>
	| context |
	context := self context: self factorialSource.
	self assert: context output isEmpty.
	^ context
]

{ #category : #example }
SPLContextExamples >> factorialReduced [
	<gtExample>
	<return: #SPLContext>
	| context |
	context := self factorial.
	context reduce.
	self assert: context output allButLast equals: '120'.
	^ context
]

{ #category : #example }
SPLContextExamples >> factorialSource [
	<gtExample>
	<return: #ByteString>
	^ '// Factorial in SPL -- computes the factorial of arg
var arg=5;
var x=arg;
var fact=1;
while (x>0) {
	fact = fact * x;
	x = x - 1;
}
print fact;'
]

{ #category : #example }
SPLContextExamples >> fibonacci [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: SPLGrammarExamples new fibonacciSource.
	result := context.
	result := context reduce.
	self
		assert: context output
		equals: SPLGrammarExamples new fibonacciOracle asString.
	^ context
]

{ #category : #example }
SPLContextExamples >> helloEqualsHello [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '"hello" == "hello"'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> helloTrace [
	<gtExample>
	<return: #SPLContext>
	| context |
	context := self context: 'print "hello";'.
	context reduce.
	self assert: context trace size equals: 3.
	self assert: context trace first output equals: ''.
	self assert: context trace second output allButLast equals: 'hello'.
	self assert: context trace third continuation isReduced.
	^ context
]

{ #category : #example }
SPLContextExamples >> ifElseStatement [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: 'if (3>4) { print 7; } else { print "else ok"; }'.
	result := context.
	result := context reduce.
	self assert: context output allButLast equals: 'else ok'.
	^ context
]

{ #category : #example }
SPLContextExamples >> ifStatement [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: 'if (3<4) { print 7; }'.
	result := context.
	result := context reduce.
	self assert: context output allButLast equals: '7'.
	^ context
]

{ #category : #example }
SPLContextExamples >> minus3 [
	<gtExample>
	<return: #SPLNumber>
	| result input |
	input := self contextForExpression: '-3'.
	result := input reduce.
	self assert: result isSPLValue.
	self assert: result value equals: -3.
	^ result
]

{ #category : #example }
SPLContextExamples >> newContext [
	<gtExample>
	<return: #SPLContext>
	| result |
	result := SPLContext new.
	self assert: result environment isEmpty.
	self assert: result environment size equals: 0.
	self assert: result output isEmpty.
	^ result
]

{ #category : #example }
SPLContextExamples >> newEnvironment [
	<gtExample>
	<return: #SPLEnvironment>
	| result |
	result := SPLEnvironment new.
	self assert: result isEmpty.
	self assert: result size equals: 0.
	^ result
]

{ #category : #example }
SPLContextExamples >> notTrueIsFalse [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '!true'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value not.
	^ result
]

{ #category : #parsing }
SPLContextExamples >> parse: aString [
	^ self parserClass parse: aString
]

{ #category : #parsing }
SPLContextExamples >> parseExpression: aString [ 
	^ self parserClass new expression parse: aString
]

{ #category : #constants }
SPLContextExamples >> parserClass [
	^ SPLParser
]

{ #category : #example }
SPLContextExamples >> printHello [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self
			context: '// Hello program in SPL
print "hello";'.
	result := context.
	result := context reduce.
	self assert: context output allButLast equals: 'hello'.
	^ context
]

{ #category : #example }
SPLContextExamples >> printHelloCopy [
	<gtExample>
	<return: #SPLContext>
	| copy context |
	context := self printHello.
	copy := context copy.
	self assert: context equals: copy.
	self assert: (context == copy) not.
	^ context
]

{ #category : #example }
SPLContextExamples >> programWithComments [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := SPLParserExamples new programWithComments asContext.
	result := context reduce.
	self assert: context output allButLast equals: 'hello world'.
	^ context
]

{ #category : #example }
SPLContextExamples >> splContextUsage [
	<gtExample>
	<return: #SPLContext>
	| context |
	context := (SPLParser parse: 'print "hello";') asContext.
	^ context
]

{ #category : #example }
SPLContextExamples >> threeEqualsThree [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: '3 == 3'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> trueAndTrueIsTrue [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: 'true and true'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> trueNotEqualFalse [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: 'true != false'.
	result := context reduce.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> trueOrFalseIsTrue [
	<gtExample>
	<return: #SPLBoolean>
	| result context |
	context := self contextForExpression: 'true or false'.
	result := context step.
	self assert: result isSPLValue.
	self assert: result value.
	^ result
]

{ #category : #example }
SPLContextExamples >> varXassignedAndPrinted [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: 'var x; x = 6*7; print x;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariableNamed: 'x') value equals: 42.
	self assert: context output allButLast equals: '42'.
	^ context
]

{ #category : #example }
SPLContextExamples >> varXdeclared [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: 'var x;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariableNamed: 'x') isSPLNil.
	^ context
]

{ #category : #example }
SPLContextExamples >> varXinitializedTo42 [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: 'var x = 42;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariableNamed: 'x') value equals: 42.
	^ context
]

{ #category : #example }
SPLContextExamples >> varXinitializedTo42AndPrinted [
	<gtExample>
	<return: #SPLContext>
	| result context |
	context := self context: 'var x = 42; print x;'.
	result := context.
	result := context reduce.
	self assert: context environment size equals: 1.
	self assert: (context environment getVariableNamed: 'x') value equals: 42.
	self assert: context output value allButLast equals: '42'.
	^ context
]
