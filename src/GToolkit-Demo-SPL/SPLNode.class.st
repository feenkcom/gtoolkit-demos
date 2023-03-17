"
I am the root class for AST nodes that implements an interpreter for SPL.
Instead of just representing visitable AST data, my subclasses directly implement the small-step semantics of SPL.

You will find examples of all the nodes in {{gtClass:name=SPLParserExamples}}.
For example, here is an {{gtClass:name=SPLExpressionStatement}}  node.


{{gtExample:name=SPLParserExamples>>#complexExpressionStmt}}

"
Class {
	#name : #SPLNode,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #conversion }
SPLNode >> asContext [
	^ SPLContext new
		continuation: self;
		yourself
]

{ #category : #accessing }
SPLNode >> children [
	^OrderedCollection new
]

{ #category : #accessing }
SPLNode >> gtASTFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'AST';
		priority: 20;
		items: [ self children ];
		children: [ :each | each isSPLNode ifTrue: [ each children ] ifFalse: [ {} ] ];
		column: '#' 
			text: [ :eachItem :eachIndex | 
				eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'AST Node' translated text: #printString;
		actionUpdateButton
]

{ #category : #testing }
SPLNode >> isReduced [
	"This node is fully reduced.
	Only true for values and empty blocks."

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
SPLNode >> stepInContext: aContext [
	"Take a single reduction step for this node in the given context.
	The node must know what to evaluate and whatto return.
	For example, a binary node contains a left and right argument and an operator.
	If the arguments are expressions and not values, they must be reduced first, step by step.
	Only if they are both values can the operator be applied in another step."

	self subclassResponsibility
]

{ #category : #printing }
SPLNode >> summary [
	^ self printString
]
