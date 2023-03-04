"
I provide a context for evaluate SPL programs.
I hold an environment of variables, an output stream, and a program state.
"
Class {
	#name : #SPLContext,
	#superclass : #Object,
	#instVars : [
		'output',
		'codeHolder',
		'environment'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLContext class >> for: anSPLProgramSource [
	^ self forProgram: anSPLProgramSource
]

{ #category : #accessing }
SPLContext class >> forExpression: anSPLProgramSource [
	^ self new
		code: (self parseExpression: anSPLProgramSource);
		yourself
]

{ #category : #accessing }
SPLContext class >> forProgram: anSPLProgramSource [
	^ self new
		code: (self parse: anSPLProgramSource);
		yourself
]

{ #category : #parsing }
SPLContext class >> parse: anSPLProgramSource [
	^ self parserClass parse: anSPLProgramSource
]

{ #category : #parsing }
SPLContext class >> parseExpression: anSPLProgramSource [
	^ self parserClass new expression end parse: anSPLProgramSource
]

{ #category : #parsing }
SPLContext class >> parserClass [
	^ SPLParser
]

{ #category : #accessing }
SPLContext >> code [
	^ codeHolder value
]

{ #category : #accessing }
SPLContext >> code: anSPLCodeNode [
	codeHolder value: anSPLCodeNode
]

{ #category : #accessing }
SPLContext >> codeHolder [
	^ codeHolder
]

{ #category : #accessing }
SPLContext >> environment [
	^ environment
]

{ #category : #accessing }
SPLContext >> environment: anObject [
	environment := anObject
]

{ #category : #accessing }
SPLContext >> gtCodeFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Program state';
		priority: 10;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self code printString asRopedText ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self codeHolder announcer
]

{ #category : #accessing }
SPLContext >> gtEnvironmentFor: aView [
<gtView>
^ aView forward

		title: 'Environment';
		priority: 20;
		object: [ self environment ];
		view: #gtVariablesFor:
]

{ #category : #accessing }
SPLContext >> gtExpressionFor: aView [
	<gtView>
	^ aView empty
]

{ #category : #accessing }
SPLContext >> gtOutputFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Ouput';
		priority: 30;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self output contents asRopedText ];
		actionUpdateButton
]

{ #category : #initialization }
SPLContext >> initialize [
	environment := SPLEnvironment new.
	expressionValueHolder := NewValueHolder new.
	output := WriteStream on: ''.
	codeHolder := NewValueHolder new
]

{ #category : #accessing }
SPLContext >> output [
	^ output
]

{ #category : #evaluating }
SPLContext >> reduce: anSPLNode [
	"Reduce till we reach a value"

	| result |
	result := anSPLNode.
	[ result isValue not ] whileTrue: [ result := result stepIn: self ].
	^ result
]

{ #category : #evaluating }
SPLContext >> step [
	self code: (self step: self code)
]

{ #category : #evaluating }
SPLContext >> step: anSPLNode [
	^ anSPLNode stepIn: self
]
