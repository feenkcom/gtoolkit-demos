"
I am the abstract superclass of SPL statement nodes.

"
Class {
	#name : #SPLStatement,
	#superclass : #SPLNode,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #constant }
SPLStatement >> indent [
	"String for one indentation level"
	^ '  '
]

{ #category : #printing }
SPLStatement >> indent: indentLevel [
	"Generate an indentation string"

	^ self indent repeat: indentLevel
]

{ #category : #printing }
SPLStatement >> printOn: aStream [
	self printOn: aStream indentBy: 0
]

{ #category : #printing }
SPLStatement >> printOn: aStream indentBy: indentlevel [
	self subclassResponsibility
]
