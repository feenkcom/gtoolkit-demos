"
I am a (model of a) card in the memory game. 
I hold a symbol (e.g. a letter or a digit).
I have a front and a back side. 
You can flip me to show the other side.

"
Class {
	#name : #GtMemoryCard,
	#superclass : #Object,
	#instVars : [
		'symbol',
		'flipped',
		'announcer'
	],
	#category : #'GToolkit-Demo-Memory-Model'
}

{ #category : #accessing }
GtMemoryCard >> announcer [
	^ announcer
]

{ #category : #actions }
GtMemoryCard >> disappear [
	self notifyDisappear
]

{ #category : #actions }
GtMemoryCard >> flip [
	flipped := flipped not.
	self notifyFlipped
]

{ #category : #initialization }
GtMemoryCard >> initialize [
	super initialize.
	flipped := false.
	announcer := Announcer new.
]

{ #category : #testing }
GtMemoryCard >> isFlipped [
	^ flipped
]

{ #category : #notifying }
GtMemoryCard >> notifyDisappear [
	self announcer announce: GtMemoryCardDisappeared new
]

{ #category : #notifying }
GtMemoryCard >> notifyFlipped [
	self announcer announce: GtMemoryCardFlipped new
]

{ #category : #accessing }
GtMemoryCard >> printOn: aStream [
	self isFlipped ifNil: [ ^ super printOn: aStream ].
	aStream
		nextPutAll: 'Card: ';
		nextPutAll: self symbol asString;
		nextPutAll: (self isFlipped ifTrue: [ ' (face side)' ] ifFalse: [ ' (back side)' ])
]

{ #category : #accessing }
GtMemoryCard >> symbol [
	^ symbol
]

{ #category : #accessing }
GtMemoryCard >> symbol: anObject [
	symbol := anObject
]
