"
Various examples of querying `thisContext`.
See also HaltDemo.
"
Class {
	#name : #ContextExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #example }
ContextExamples >> findExampleInStack [
	"Walk up the stack looking for a method  with a gtExample pragma."

	| context |
	context := thisContext.
	[ context sender isNil ]
		whileFalse: [ context := context sender.
			(context method hasPragmaNamed: #gtExample) ifTrue: [ ^ context method ] ].
	^ self error: 'Example not found in stack'
]

{ #category : #example }
ContextExamples >> returnMySender [
	^ thisContext sender method
]

{ #category : #example }
ContextExamples >> searchIndirectly [
	^ self searchIndirectly2
]

{ #category : #example }
ContextExamples >> searchIndirectly2 [
	^ self findExampleInStack
]

{ #category : #example }
ContextExamples >> stackUpToExample [
	| stack exampleIndex |
	stack := thisContext stack.
	exampleIndex := stack
			detectIndex: [ :c | c method hasPragmaNamed: #gtExample ]
			ifNone: [ self error: 'No example found' ].
	^ stack copyFrom: 1 to: exampleIndex
]

{ #category : #example }
ContextExamples >> stackUpToHere [
	<gtExample>
	<return: #OrderedCollection>
	| stack |
	stack := self stackUpToExample.
	self assert: stack size equals: 2.
	^ stack
]

{ #category : #accessing }
ContextExamples >> thisContext [
	"NB: as soon as we return the context, it will be dead, so the values of variables will no longer be visible."

	<gtExample>
	<return: #Context>
	| context foo |
	foo := 42.
	context := thisContext.
	self assert: context isDead not.
	self assert: context method selector equals: #thisContext.
	self assert: (context tempNamed: #foo) equals: 42.
	^ context
]

{ #category : #accessing }
ContextExamples >> thisContextCopy [
	"Here we return a copy of the context, which will contain all the temporary variables with their values at the point of return."

	<gtExample>
	<return: #Context>
	| context foo |
	foo := 42.
	context := thisContext.
	self assert: context isDead not.
	self assert: context method selector equals: #thisContextCopy.
	self assert: (context tempNamed: #foo) equals: 42.
	^ context copy
]

{ #category : #accessing }
ContextExamples >> thisContextCopyIsNotDead [
	<gtExample>
	<return: #Context>
	| context |
	context := self thisContextCopy.
	self assert: context isDead not.
	^ context
]

{ #category : #accessing }
ContextExamples >> thisContextIsDead [
	<gtExample>
	<return: #Context>
	| context |
	context := self thisContext.
	self assert: context isDead.
	^ context
]

{ #category : #example }
ContextExamples >> thisMethodFoundDeeplyInStack [
	<gtExample>
	<return: #CompiledMethod>
	| method |
	method := self searchIndirectly.
	self assert: method selector equals: #thisMethodFoundDeeplyInStack.
	^ method
]

{ #category : #example }
ContextExamples >> thisMethodFoundInStack [
	<gtExample>
	<return: #CompiledMethod>
	| method |
	method := self findExampleInStack.
	self assert: method selector equals: #thisMethodFoundInStack.
	^ method
]

{ #category : #example }
ContextExamples >> thisMethodFromCalledMethod [
	<gtExample>
	<return: #CompiledMethod>
	| method |
	method := self returnMySender.
	self assert: method selector equals: #thisMethodFromCalledMethod.
	^ method
]

{ #category : #example }
ContextExamples >> thisMethodFromContext [
	<gtExample>
	<return: #CompiledMethod>
	| method |
	method := thisContext method.
	self assert: method selector equals: #thisMethodFromContext.
	^ method
]

{ #category : #accessing }
ContextExamples >> thisStack [
	<gtExample>
	<noTest>
	| stack |
	stack := thisContext stackOfSize: 10.
	self assert: stack size equals: 10.
	self assert: stack first method selector equals: #thisStack.
	^ stack
]

{ #category : #accessing }
ContextExamples >> thisStackCopy [
	"Return a copied stack of live contexts."
	<gtExample>
	<noTest>
	| stack |
	stack := thisContext stackOfSize: 10.
	self assert: stack size equals: 10.
	self assert: stack first method selector 
			equals: #thisStackCopy.
	^ stack collect: #copy
]
