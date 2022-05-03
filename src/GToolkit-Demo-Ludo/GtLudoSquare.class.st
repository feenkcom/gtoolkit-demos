"
I am a square on the Ludo Board.

There are some 40 squares for playing, but there are also some special squares to hold the tokens that are in the #start or #goal states.

I can be one of four kinds of square: #start, #initial, #play, #goal.
Tokens are initially parked on a start square. When they are put into play, they move to their initial square., then proceed through various play squares.
Finally they end in a goal square.

"
Class {
	#name : #GtLudoSquare,
	#superclass : #Object,
	#instVars : [
		'token',
		'announcer',
		'kind'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #announcements }
GtLudoSquare >> announcer [
	^ announcer
]

{ #category : #initialization }
GtLudoSquare >> clear [
	GtLudoToken blank goToSquare: self
]

{ #category : #initialization }
GtLudoSquare >> defaultKind [
	^ #play
]

{ #category : #initialization }
GtLudoSquare >> initialize [
	super initialize.
	kind := self defaultKind.
	announcer := Announcer new.
	self clear
]

{ #category : #testing }
GtLudoSquare >> isEmpty [
	^  self token isBlank
]

{ #category : #accessing }
GtLudoSquare >> kind [
	^ kind
]

{ #category : #accessing }
GtLudoSquare >> kind: aSymbol [
	self assert: (self validKinds includes: aSymbol).
	kind := aSymbol
]

{ #category : #testing }
GtLudoSquare >> notEmpty [
	^ self isEmpty not
]

{ #category : #announcements }
GtLudoSquare >> notifyUpdated [
	self announcer announce: GtLudoSquareUpdated new
]

{ #category : #printing }
GtLudoSquare >> printOn: aStream [
	aStream nextPutAll: self token name
]

{ #category : #accessing }
GtLudoSquare >> token [
	^ token
]

{ #category : #accessing }
GtLudoSquare >> token: aLudoToken [
	self assert: aLudoToken square equals: self.
	token := aLudoToken.
	self notifyUpdated
]

{ #category : #constants }
GtLudoSquare >> validKinds [
	^ #(start initial play goal)
]
