"
I provide a context for evaluate SPL programs.
I hold an environment of variables, an output stream, and a program state.
"
Class {
	#name : #SPLContext,
	#superclass : #Object,
	#instVars : [
		'environment',
		'stateHolder',
		'outputHolder'
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
		state: (self parseExpression: anSPLProgramSource);
		yourself
]

{ #category : #accessing }
SPLContext class >> forProgram: anSPLProgramSource [
	^ self new
		state: (self parse: anSPLProgramSource);
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
		text: [ self state printString asRopedText ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self stateHolder announcer
]

{ #category : #accessing }
SPLContext >> gtEnvironmentFor: aView [
<gtView>
^ aView forward

		title: 'Environment';
		priority: 20;
		object: [ self environment ];
		view: #gtVariablesFor:;
		actionUpdateButton;
		updateWhen: ValueChanged in: self environment announcer
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
		title: 'Output';
		priority: 30;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self output asRopedText ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self outputHolder announcer
]

{ #category : #initialization }
SPLContext >> initialize [
	stateHolder := NewValueHolder new.
	environment := SPLEnvironment new.
	outputHolder := NewValueHolder value: ''.
]

{ #category : #accessing }
SPLContext >> output [
	^ outputHolder value
]

{ #category : #accessing }
SPLContext >> outputHolder [
	^ outputHolder
]

{ #category : #accessing }
SPLContext >> printLn: aString [
	self outputHolder value: self output , aString, String cr
]

{ #category : #evaluating }
SPLContext >> reduce [
	[ self state isReduced not ] whileTrue: [ self step ].
	^ self state
]

{ #category : #evaluating }
SPLContext >> reduce: anSPLNode [
	"Reduce till we cannot take any more steps"

	| result |
	result := anSPLNode.
	[ result isReduced not ] whileTrue: [ result := result stepIn: self ].
	^ result
]

{ #category : #accessing }
SPLContext >> state [
	^ stateHolder value
]

{ #category : #accessing }
SPLContext >> state: anSPLCodeNode [
	self stateHolder value: anSPLCodeNode
]

{ #category : #accessing }
SPLContext >> stateHolder [
	^ stateHolder
]

{ #category : #evaluating }
SPLContext >> step [
	self state: (self step: self state).
	^ self state
]

{ #category : #evaluating }
SPLContext >> step: anSPLNode [
	^ anSPLNode stepIn: self
]
