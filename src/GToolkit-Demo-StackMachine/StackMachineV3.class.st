"
These classes illustrate versions of a Stack Machine for an RPN calculator.
They are used to demonstrate various moldable development patterns.

StackMachineV3 adds a forwarding view to the state of the stack.
"
Class {
	#name : #StackMachineV3,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'GToolkit-Demo-StackMachine-Model'
}

{ #category : #accessing }
StackMachineV3 >> ! aValue [
	^ stack addLast: aValue
]

{ #category : #accessing }
StackMachineV3 >> gtStackFor: aView [
	<gtView>
	^ aView forward
		title: 'Stack';
		priority: 10;
		object: [ stack ];
		view: #gtItemsFor:
]

{ #category : #accessing }
StackMachineV3 >> initialize [
	stack := OrderedCollection new
]

{ #category : #accessing }
StackMachineV3 >> isEmpty [
	^ stack isEmpty
]

{ #category : #accessing }
StackMachineV3 >> stack [
	^ stack
]

{ #category : #accessing }
StackMachineV3 >> stackWith3and4 [
	<gtExample>
	<return: #StackMachineV3>
	| example |
	example := self class new.
	self assert: example isEmpty.
	example ! 3.
	self assert: example isEmpty not.
	self assert: example top equals: 3.
	example ! 4.
	self assert: example top equals: 4.
	^ example
]

{ #category : #accessing }
StackMachineV3 >> top [
	^ stack last
]
