"
These classes illustrate versions of a Stack Machine for an RPN calculator.
They are used to demonstrate various moldable development patterns.

StackMachine just has a stack slot and initializes it.
"
Class {
	#name : #StackMachine,
	#superclass : #Object,
	#instVars : [
		'stack'
	],
	#category : #'GToolkit-Demo-StackMachine-Model'
}

{ #category : #accessing }
StackMachine >> initialize [
	stack := OrderedCollection new
]
