"
I am the root class for AST nodes that implement an interpreter for SPL.
Instead of just representing visitable AST data, my subclasses directly implement the small-step semantics of SPL.
"
Class {
	#name : #SPLNode,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #conversion }
SPLNode >> asContext [
	^ SPLContext new
		state: self;
		yourself
]

{ #category : #testing }
SPLNode >> isReduced [
	"Only true for values and stop statements"

	^ false
]

{ #category : #testing }
SPLNode >> isSPLNode [
	^ true
]

{ #category : #testing }
SPLNode >> isSPLValue [
	^ false
]

{ #category : #testing }
SPLNode >> isSPLVariable [
	^ false
]

{ #category : #stepping }
SPLNode >> stepIn: aContext [
	self subclassResponsibility
]
