Class {
	#name : #ContextDemo,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #example }
ContextDemo >> findExampleInStack [
	"walk up the stack looking for a method  with a gtExample pragma"

	| context |
	context := thisContext.
	[ context sender isNil ]
		whileFalse: [ context := context sender.
			(context method hasPragmaNamed: #gtExample) ifTrue: [ ^ context method ] ].
	^ self error: 'Example not found in stack'
]

{ #category : #example }
ContextDemo >> returnMySender [
	^ thisContext sender method
]

{ #category : #example }
ContextDemo >> searchIndirectly [
	^ self searchIndirectly2
]

{ #category : #example }
ContextDemo >> searchIndirectly2 [
	^ self findExampleInStack
]

{ #category : #example }
ContextDemo >> stackUpToExample [
	| stack exampleIndex |
	stack := thisContext stack.
	exampleIndex := stack
			detectIndex: [ :c | c method hasPragmaNamed: #gtExample ]
			ifNone: [ self error: 'No example found' ].
	^ stack copyFrom: 1 to: exampleIndex
]

{ #category : #example }
ContextDemo >> stackUpToHere [
	<gtExample>
	| stack |
	stack := self stackUpToExample.
	self assert: stack size equals: 2.
	^ stack
]

{ #category : #accessing }
ContextDemo >> thisContext [
	"NB: once we return, the context will be  dead, so to keep the values of temporaries, we return a *copy* ofthe context."

	<gtExample>
	| context foo |
	foo := 42.
	context := thisContext.
	self assert: context isDead not.
	self assert: context method selector equals: #thisContext.
	self assert: (context tempNamed: #foo) equals: 42.
	^ context copy
]

{ #category : #example }
ContextDemo >> thisMethodFoundDeeplyInStack [
	<gtExample>
	| method |
	method := self searchIndirectly.
	self assert: method selector equals: #thisMethodFoundDeeplyInStack.
	^ method
]

{ #category : #example }
ContextDemo >> thisMethodFoundInStack [
	<gtExample>
	| method |
	method := self findExampleInStack.
	self assert: method selector equals: #thisMethodFoundInStack.
	^ method
]

{ #category : #example }
ContextDemo >> thisMethodFromCalledMethod [
	<gtExample>
	| method |
	method := self returnMySender.
	self assert: method selector equals: #thisMethodFromCalledMethod.
	^ method
]

{ #category : #example }
ContextDemo >> thisMethodFromContext [
	<gtExample>
	| method |
	method := thisContext method.
	self assert: method selector equals: #thisMethodFromContext.
	^ method
]

{ #category : #accessing }
ContextDemo >> thisStack [
	<gtExample>
	<noTest>
	| stack |
	stack := thisContext stackOfSize: 10.
	self assert: stack size equals: 10.
	self assert: stack first method selector equals: #thisStack.
	^ stack
]
