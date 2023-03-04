"
I am the root class for AST nodes that implement an interpreter for SPL.
Instead of just representing visitable AST data, my subclasses directly implement the small-step semantics of SPL.
"
Class {
	#name : #SPLNode,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #testing }
SPLNode >> isStopped [
	"Only needed for statements and declarations."

	^ false
]

{ #category : #accessing }
SPLNode >> stepIn: aContext [
	self subclassResponsibility
]
