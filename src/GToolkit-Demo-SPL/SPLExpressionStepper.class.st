Class {
	#name : #SPLExpressionStepper,
	#superclass : #Object,
	#instVars : [
		'environment',
		'expressionValueHolder'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLExpressionStepper class >> for: anSPLExpressionString [
	^ self new
		expression: (self parse: anSPLExpressionString);
		yourself
]

{ #category : #'instance creation' }
SPLExpressionStepper class >> parse: anSPLExpressionString [ 
	^ self parserClass new expression end parse: anSPLExpressionString
]

{ #category : #'instance creation' }
SPLExpressionStepper class >> parserClass [
	^ SPLParser
]

{ #category : #accessing }
SPLExpressionStepper >> environment [
	^ environment
]

{ #category : #accessing }
SPLExpressionStepper >> environment: anObject [
	environment := anObject
]

{ #category : #accessing }
SPLExpressionStepper >> expression [
	^ expressionValueHolder value
]

{ #category : #accessing }
SPLExpressionStepper >> expression: anSPLExpression [
	expressionValueHolder value: anSPLExpression 
]

{ #category : #accessing }
SPLExpressionStepper >> expressionValueHolder [
	^ expressionValueHolder
]

{ #category : #accessing }
SPLExpressionStepper >> gtEnvironmentFor: aView [
<gtView>
^ aView forward

		title: 'Environment';
		priority: 20;
		object: [ self environment ];
		view: #gtVariablesFor:
]

{ #category : #accessing }
SPLExpressionStepper >> gtExpressionFor: aView [
	<gtView>
	^ aView textEditor
		title: 'Expression';
		priority: 10;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self expression printString asRopedText ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self expressionValueHolder announcer
]

{ #category : #initialization }
SPLExpressionStepper >> initialize [
	environment := SPLEnvironment new.
	expressionValueHolder := NewValueHolder new.
]

{ #category : #accessing }
SPLExpressionStepper >> reduce [
	self expression: (self environment reduce: self expression)
]

{ #category : #evaluating }
SPLExpressionStepper >> step [
	self expression: (self environment step: self expression)
]
