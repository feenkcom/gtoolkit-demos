"
I am the root class for AST nodes that implement an interpreter for SPL.
Instead of just representing visitable AST data, my subclasses directly implement the small-step semantics of SPL.
"
Class {
	#name : #SPLNode,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #accessing }
SPLNode >> stepIn: anEnvironment [
	self subclassResponsibility
]
