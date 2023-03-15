"
I keep track of the values of variables in a running SPL program.

I am basically a wrapper around a Dictionary.
I can be used to declare new variables, initialize or update them, and retrieve their values.

See {{gtClass:name=SPLEnvironmentExamples}} for examples.

Here is an example illustrating the API.{{gtExample:name=SPLEnvironmentExamples>>#envtWithInitializedVarXupdatedTo7}}

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

{ #category : #comparing }
SPLEnvironment >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self variables = anObject variables
]

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
		title: 'Variables';
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

{ #category : #comparing }
SPLEnvironment >> hash [
	^ variables hash
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
SPLEnvironment >> notEmpty [
	^ self variables notEmpty
]

{ #category : #copying }
SPLEnvironment >> postCopy [
	super postCopy.
	variables := variables copy.
	announcer := Announcer new.
	^ self
]

{ #category : #accessing }
SPLEnvironment >> printOn: aStream [
	aStream nextPut: ${.
	variables
		associationsDo: [ :assoc | 
			aStream
				print: assoc key;
				nextPut: $=;
				print: assoc value;
				nextPut: $; ].
	aStream nextPut: $}
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
