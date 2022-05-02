"
I manage the logic of the moves of the Ludo Game.
"
Class {
	#name : #GtLudoGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'players'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoGame >> assertValidMove: aToken [
	"Preconditions for a valid move."
	self
		assert: (self currentPlayer tokens includes: aToken)
		description: 'The token ' , aToken name , ' does not belong to the current player ' , self currentPlayer name.
	self
		assert: (aToken isInStartState or: [ aToken isInPlay ])
		description: 'Token ' , aToken name , ' is not in start or play state.'.
	self die topFace = 6
		ifTrue:
			[ self currentPlayer startTokens notEmpty
				ifTrue:
					[ self
						assert: aToken isInStartState
						description: 'Can''t move token ' , aToken name , '. A new token must be brought into play.' ] ]
]

{ #category : #accessing }
GtLudoGame >> board [
	^ board
]

{ #category : #accessing }
GtLudoGame >> currentPlayer [
	^ self players first
]

{ #category : #'test - support' }
GtLudoGame >> die [
	^ self board die
]

{ #category : #'gt - extensions' }
GtLudoGame >> gtBoardFor: aView [
	<gtView>
	^ (aView forward)
		title: 'Board';
		priority: 10;
		object: [ self board ];
		view: #gtBoardFor:
]

{ #category : #accessing }
GtLudoGame >> gtPlayersFor: aView [
	<gtView>
	^ (aView forward)
		title: 'Players';
		priority: 20;
		object: [ self board ];
		view: #gtPlayersFor:
]

{ #category : #accessing }
GtLudoGame >> gtSquaresFor: aView [
	<gtView>
	^ (aView forward)
		title: 'Squares';
		priority: 30;
		object: [ self board ];
		view: #gtSquaresFor:
]

{ #category : #initialization }
GtLudoGame >> initialize [
	board := GtLudoBoard new.
	players := board players copy
]

{ #category : #accessing }
GtLudoGame >> moveToken: aString [
	| token targetSquare |
	token := self tokenNamed: aString.
	self assertValidMove: token.
	(self die topFace = 6 and: [ token isInStartState ])
		ifTrue: [ token enterPlayOnSquare: (self board startSquareFor: self currentPlayer) ]
		ifFalse:
			[ targetSquare := ((self board squares indexOf: token square) + self die topFace - 1) \\ self board totalPlaySquares + 1.
			token goToSquare: (self board squares at: targetSquare) ]
]

{ #category : #accessing }
GtLudoGame >> nextPlayer [
	players addLast: players removeFirst.
	^ self currentPlayer
]

{ #category : #accessing }
GtLudoGame >> players [
	^ players
]

{ #category : #'test - support' }
GtLudoGame >> roll: aValue [ 
	"Only for testing! We can set the value rolled."
	self die roll: aValue
]

{ #category : #accessing }
GtLudoGame >> tokenNamed: aString [
	^ self board tokens detect: [ :token | token name = aString ] ifNone: [ self error: 'Found no token named ' , aString ]
]
