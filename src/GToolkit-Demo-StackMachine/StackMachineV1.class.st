"
These classes illustrate versions of a Stack Machine for an RPN calculator.
They are used to demonstrate various moldable development patterns.

StackMachineV1 adds methods for  pushing values and testing the stack.
"
Class {
	#name : #StackMachineV1,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'GToolkit-Demo-StackMachine-Model'
}

{ #category : #accessing }
StackMachineV1 >> ! aValue [
	^ stack addLast: aValue
]

{ #category : #accessing }
StackMachineV1 >> initialize [
	stack := OrderedCollection new
]

{ #category : #accessing }
StackMachineV1 >> isEmpty [
	^ stack isEmpty
]

{ #category : #accessing }
StackMachineV1 >> stack [
	^ stack
]

{ #category : #accessing }
StackMachineV1 >> top [
	^ stack last
]
