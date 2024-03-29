"
I am an SPL declaration with initialization.

{{gtExample:name=SPLParserExamples>>#varDeclWithInit}}

"
Class {
	#name : #SPLInitializedDeclaration,
	#superclass : #SPLDeclaration,
	#instVars : [
		'expression'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLInitializedDeclaration class >> for: aVariable with: anExpression [ 
	^ self new
		variable: aVariable;
		expression: anExpression;
		yourself
]

{ #category : #accessing }
SPLInitializedDeclaration >> expression [
	^ expression
]

{ #category : #'instance creation' }
SPLInitializedDeclaration >> expression: anExpression [
	expression := anExpression
]

{ #category : #printing }
SPLInitializedDeclaration >> printOn: aStream [
	aStream
		nextPutAll: 'var ';
		print: self variable;
		nextPutAll: ' = ';
		print: self expression;
		nextPut: $;
]

{ #category : #stepping }
SPLInitializedDeclaration >> stepInContext: aContext [
	^ self expression isReduced
		ifTrue: [ aContext environment
				declareVariable: self variable
				initializedTo: self expression.
			SPLExpressionStatement for: self expression ]
		ifFalse: [ self class
				for: self variable
				with: (self expression stepInContext: aContext) ]
]

{ #category : #accessing }
SPLInitializedDeclaration >> subNodes [
	^ super subNodes
		add: self expression;
		yourself
]
