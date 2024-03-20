"
I am a print statement that can print any SPL value.

{{gtExample:name=SPLParserExamples>>#printStmt}}


"
Class {
	#name : #SPLPrintStatement,
	#superclass : #SPLAbstractExpressionStatement,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLPrintStatement >> printOn: aStream indentBy: indentlevel [
	aStream
		nextPutAll: (self indent: indentlevel);
		nextPutAll: 'print ';
		print: self expression;
		nextPut: $;
]

{ #category : #stepping }
SPLPrintStatement >> stepInContext: aContext [
	^ self expression isReduced
		ifTrue: [ 
			aContext printLn: self expression value asString.
			SPLExpressionStatement for: self expression ]
		ifFalse: [ 
			self class for:
				(self expression stepInContext: aContext) ]
]
