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
SPLEnvironment >> at: aVariableName [
	^ variables at: aVariableName
]

{ #category : #accessing }
SPLEnvironment >> declareVariable: aVariableName [
	self assert: (self variables includesKey: aVariableName) not.
	self variables at: aVariableName variable put: SPLNil new.
	self announcer announce: (ValueChanged newValue: self).
]

{ #category : #accessing }
SPLEnvironment >> declareVariable: aVariableName initializedTo: aValue [
	self assert: (self variables includesKey: aVariableName) not.
	self variables at: aVariableName variable put: aValue.
	self announcer announce: (ValueChanged newValue: self).
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
		send: [ :assoc | assoc value ]
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
