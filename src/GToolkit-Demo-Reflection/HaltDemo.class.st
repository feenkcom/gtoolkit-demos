"
Demonstrate a conditional halt that looks up the stack to halt only if the caller is a particular method.

HaltDemo new foo.
HaltDemo new bar. 

Only the second halts within foo.

See also ContextExamples.s
"
Class {
	#name : #HaltDemo,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #'failing example' }
HaltDemo >> bar [
	"Will halt"
	<gtExample>
	<noTest>
	^ self foo , 'bar'
]

{ #category : #example }
HaltDemo >> foo [
	"Does not halt"

	<gtExample>
	<return: #ByteString>
	self haltIfCalledFrom: #bar.
	^ 'foo'
]

{ #category : #accessing }
HaltDemo >> haltIfCalledFrom: aSelector [
	"Walk up the stack looking for a Context with the argument selector."
	| context |
	context := thisContext.
	[ context sender isNil ]
		whileFalse: [ context := context sender.
			context selector = aSelector ifTrue: [ Halt signal ] ]
]
