"
HaltDemo new foo.
HaltDemo new bar. 

Only the second halts within foo.
"
Class {
	#name : #HaltDemo,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection-Examples'
}

{ #category : #accessing }
HaltDemo >> bar [
	"Will halt"

	<gtExample>
	<noTest>
	^ self foo , 'bar'
]

{ #category : #accessing }
HaltDemo >> foo [
	"Does not halt"

	<gtExample>
	self haltIfCalledFrom: #bar.
	^ 'foo'
]

{ #category : #'as yet unclassified' }
HaltDemo >> haltIfCalledFrom: aSelector [
	| context |
	context := thisContext.
	"walk up the stack looking for a Context with this selector"
	[ context sender isNil ]
		whileFalse: [ context := context sender.
			context selector = aSelector
				ifTrue: [ Halt signal ] ]
]
