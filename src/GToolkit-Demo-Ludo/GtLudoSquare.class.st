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
		'kind',
		'game'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #initialization }
GtLudoSquare class >> for: aGame [
	^ (self new)
		game: aGame;
		yourself
]

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

{ #category : #accessing }
GtLudoSquare >> game [
	^ game
]

{ #category : #accessing }
GtLudoSquare >> game: aGame [
	game := aGame
]

{ #category : #accessing }
GtLudoSquare >> gtDisplayOn: stream [

	stream
		nextPutAll: 'Square';
		space;
		nextPutAll: self kind;
		space;
		nextPutAll: self token name
]

{ #category : #'gt - extensions' }
GtLudoSquare >> gtPositionsFor: aView [
	<gtView>
	
	^ (aView explicit)
		title: 'Position';
		priority: 10;
		stencil: [ self highlightedBoardElement ]
]

{ #category : #'gt - extensions' }
GtLudoSquare >> highlightedBoardElement [
	| boardElement |
	boardElement := self game boardElement.
	(boardElement children select: [ :each | (each isKindOf: GtLudoSquareElement) and: [ each square = self ] ])
		do: #highlight.
	^ boardElement
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

{ #category : #testing }
GtLudoSquare >> isGoal [
	^ self kind = #goal
]

{ #category : #testing }
GtLudoSquare >> isInitial [ 
	^ self kind = #initial
]

{ #category : #testing }
GtLudoSquare >> isPlay [
	^ self kind = #play
]

{ #category : #testing }
GtLudoSquare >> isStart [
	^ self kind = #start
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

{ #category : #accessing }
GtLudoSquare >> signalMoveToken [
	self notEmpty ifTrue: [ 
		self announcer announce:
			(GtLudoSquareSignalTokenMove for: self token) ]
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
