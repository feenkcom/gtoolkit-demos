"
I manage the logic of the moves of the Ludo Game.
"
Class {
	#name : #GtLudoGame,
	#superclass : #Object,
	#instVars : [
		'board',
		'players',
		'winner',
		'needToRollDie'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

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

{ #category : #feedback }
GtLudoGame >> feedback: aString [
	self board feedback: aString
]

{ #category : #playing }
GtLudoGame >> gameState [

	"Prepare feedback."

	self isOver ifTrue: [ 
		self setWinner.
		^ 'Player ' , self winner , ' has won!' ].

	self playerToRoll ifTrue: [ 
		^ 'Player ' , self currentPlayer name , ' to roll the die.' ].

	self playerToMove ifTrue: [ 
		^ 'Player ' , self currentPlayer name , ' to move.' ].

	^ 'Unknown game state!'
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
	self die announcer when: GtLudoDieRolled send: #onRolled to: self.
	players := board players copy.
	needToRollDie := true.
	self setWinner.
	self feedback: self gameState
]

{ #category : #testing }
GtLudoGame >> isOver [
	^ (self players select: #isFinished) isNotEmpty
]

{ #category : #accessing }
GtLudoGame >> move: aTokenName [

	| token targetSquare |
	
	
	
	token := self tokenNamed: aTokenName.
	
	
	
	
	
	(self die topFace = 6 and: [ token isInStartState ])
		ifTrue: [ 
			token enterPlayOnSquare:
				(self board startSquareFor: self currentPlayer) ]
		ifFalse: [ 
			targetSquare := (self board squares indexOf: token square)
			                + self die topFace - 1
			                \\ self board totalPlaySquares + 1.
			token goToSquare: (self board squares at: targetSquare) ].


	needToRollDie := true.
	self nextPlayer.
	self feedback: self gameState
]

{ #category : #accessing }
GtLudoGame >> nextPlayer [
	players addLast: players removeFirst.
	^ self currentPlayer
]

{ #category : #announcements }
GtLudoGame >> onRolled [
	needToRollDie := false.
	self feedback: self gameState
]

{ #category : #testing }
GtLudoGame >> playerToMove [
	^ self playerToRoll not
]

{ #category : #testing }
GtLudoGame >> playerToRoll [
	self assert: self isOver not.
	^  needToRollDie
]

{ #category : #accessing }
GtLudoGame >> players [
	^ players
]

{ #category : #testing }
GtLudoGame >> positionOfTokenNamed: aString [
	^ self board positionOfToken: (self board tokenNamed: 'A')
]

{ #category : #'test - support' }
GtLudoGame >> roll: aValue [ 
	"Only for testing! We can set the value rolled."
	self die roll: aValue
]

{ #category : #playing }
GtLudoGame >> setWinner [
	winner := self players
		          detect: #isFinished
		          ifFound: [ :player | player name ]
		          ifNone: [ 'No one' ]
]

{ #category : #accessing }
GtLudoGame >> tokenNamed: aString [
	^ self board tokens detect: [ :token | token name = aString ] ifNone: [ self error: 'Found no token named ' , aString ]
]

{ #category : #playing }
GtLudoGame >> tokensToMove [

	<todo: 'Check if these tokens can actually be played!'>

	self isOver ifTrue: [ ^ Set new ].
	self playerToRoll ifTrue: [ ^ Set new ].
	self assert: self playerToMove.


	self die topFace = 6 ifTrue: [ 
		self currentPlayer startTokens notEmpty ifTrue: [ 
			^ self currentPlayer startTokens asSet ] ].

	"If we are close to the goal, butcannot reach it, what happens?"
			
	^ self currentPlayer playTokens
]

{ #category : #acccessing }
GtLudoGame >> winner [
	^ winner
]
