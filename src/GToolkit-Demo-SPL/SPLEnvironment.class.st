"
I keep track of the values of variables in a running SPL program.
I am basically a wrapper around a Dictionary.
I can be used to declare new variables, initialize or update them, and retrieve their values.
"
Class {
	#name : #SPLEnvironment,
	#superclass : #Object,
	#instVars : [
		'variables',
		'announcer'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLEnvironment >> announcer [
	^ announcer
]

{ #category : #accessing }
SPLEnvironment >> declareVariable: aVariable [
	self declareVariable: aVariable initializedTo: SPLNil new
]

{ #category : #accessing }
SPLEnvironment >> declareVariable: aVariable initializedTo: aValue [
	self assert: aVariable isSPLNode.
	self assert: aVariable isSPLVariable.
	self assert: aValue isSPLNode.
	self assert: aValue isSPLValue.
	self
		assert: (self variables includesKey: aVariable) not
		description: 'Variable ' , aVariable printString , ' is already declared'.
	self variables at: aVariable put: aValue.
	self announcer announce: (ValueChanged newValue: self)
]

{ #category : #accessing }
SPLEnvironment >> getVariable: aVariable [
	self assert: aVariable isSPLNode.
	self assert: aVariable isSPLVariable.
	self
		assert: (self variables includesKey: aVariable)
		description: 'Variable ' , aVariable printString , ' is not declared'.
	^ variables at: aVariable
]

{ #category : #accessing }
SPLEnvironment >> getVariableNamed: aVariableName [
	"Just needed for tests"
	^ self getVariable: (SPLVariable named: aVariableName)
]

{ #category : #accessing }
SPLEnvironment >> gtVariablesFor: aView [
	"Copied and adapted from Dictionary>>#gtItemsFor:"

	<gtView>
	^ aView columnedTree
		title: 'Items';
		priority: 1;
		items: [ self variables associations ];
		children: [ :each | 
			each value isDictionary
				ifTrue: [ each value associations ]
				ifFalse: [ (each value isArray and: [ each value allSatisfy: #isDictionary ])
						ifTrue: [ each value collectWithIndex: [ :x :i | i -> x ] ]
						ifFalse: [ #() ] ] ];
		column: 'Variable' text: [ :assoc | assoc key ];
		column: 'Value' text: [ :assoc | assoc value ];
		send: [ :assoc | assoc value ];
		actionUpdateButton;
		updateWhen: ValueChanged in: self announcer
]

{ #category : #initialization }
SPLEnvironment >> initialize [
	variables := Dictionary new.
	announcer := Announcer new.
]

{ #category : #accessing }
SPLEnvironment >> isEmpty [
	^ self variables isEmpty
]

{ #category : #accessing }
SPLEnvironment >> setVariable: aVariable to: aValue [
	self assert: aVariable isSPLNode.
	self assert: aVariable isSPLVariable.
	self assert: aValue isSPLNode.
	self assert: aValue isSPLValue.
	self
		assert: (self variables includesKey: aVariable)
		description: 'Variable ' , aVariable printString , ' is not declared'.
	variables at: aVariable put: aValue.
	self announcer announce: (ValueChanged newValue: self).
	^ aValue
]

{ #category : #accessing }
SPLEnvironment >> size [
	^ self variables size
]

{ #category : #accessing }
SPLEnvironment >> variables [
	^ variables
]

{ #category : #accessing }
SPLEnvironment >> variables: anObject [
	variables := anObject
]
