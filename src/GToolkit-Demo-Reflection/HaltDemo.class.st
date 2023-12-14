"
HaltDemo new foo.
HaltDemo new bar. 

Only the second halts within foo.
"
Class {
	#name : #HaltDemo,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Reflection'
}

{ #category : #'as yet unclassified' }
HaltDemo >> bar [
	^ (self foo), 'bar'
]

{ #category : #'as yet unclassified' }
HaltDemo >> foo [
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
