"
These classes illustrate versions of a Stack Machine for an RPN calculator.
They are used to demonstrate various moldable development patterns.

StackMachineV2 adds an extracted example method with assertions.
"
Class {
	#name : #StackMachineV2,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'GToolkit-Demo-StackMachine-Model'
}

{ #category : #accessing }
StackMachineV2 >> ! aValue [
	^ stack addLast: aValue
]

{ #category : #accessing }
StackMachineV2 >> initialize [
	stack := OrderedCollection new
]

{ #category : #accessing }
StackMachineV2 >> isEmpty [
	^ stack isEmpty
]

{ #category : #accessing }
StackMachineV2 >> stack [
	^ stack
]

{ #category : #accessing }
StackMachineV2 >> stackWith3and4 [
	<gtExample>
	<return: #StackMachineV2>
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
StackMachineV2 >> top [
	^ stack last
]
