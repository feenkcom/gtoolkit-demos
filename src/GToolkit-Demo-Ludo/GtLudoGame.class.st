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
		'needToRollDie',
		'lastDieRolled'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoGame >> board [
	^ board
]

{ #category : #playing }
GtLudoGame >> computeTargetFor: aToken [

	"There are 3 cases for the target square."

	| route targetIndex |
	route := self currentRoute.

	"(1) a token enters play on the first square of the route"
	(self die topFace = 6 and: [ aToken isInStartState ]) ifTrue: [ 
		aToken enterPlay.
		^ route first ].

	self
		assert: aToken isInPlay
		description: 'Token ' , aToken name , ' is not in play'.

	"(2) a token in play moves forward to another square on the route"
	targetIndex := (route indexOf: aToken square) + self die topFace.
	targetIndex <= route size ifTrue: [ ^ route at: targetIndex ].

	"(3) the roll would go past the end of the route (we stay where we are)"
	^ aToken square
]

{ #category : #accessing }
GtLudoGame >> currentPlayer [
	^ self players first
]

{ #category : #acccessing }
GtLudoGame >> currentRoute [
	^ self board routeFor: self currentPlayer
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

	self playerToMove ifTrue: [ 
		self tokensToMove notEmpty
			ifTrue: [ ^ 'Player ' , self currentPlayer name , ' to move.' ]
			ifFalse: [ 
				| player |
				player := self currentPlayer.
				needToRollDie := true.
				self nextPlayer.
				^ 'Player ' , player name , ' cannot move. Player '
				  , self currentPlayer name , ' to roll the die.' ] ].

	self playerToRoll ifTrue: [ 
		^ 'Player ' , self currentPlayer name , ' to roll the die.' ].

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
	lastDieRolled := self die topFace.
	self board squares , self board startSquares do: [ :square | 
		square announcer
			when: GtLudoSquareSignalTokenMove
			do: [ :announcement | self move: announcement token name ] ].
	players := board players copy.
	needToRollDie := true.
	self setWinner.
	self feedback: self gameState
]

{ #category : #testing }
GtLudoGame >> isOver [
	^ (self players select: #isFinished) isNotEmpty
]

{ #category : #playing }
GtLudoGame >> move: aTokenName [
	| token targetSquare |
	self assert: self playerToMove description: 'Roll the die first!'.
	token := self tokenNamed: aTokenName.
	self assert: token player = self currentPlayer description: 'Token ', token name, ' does not belong to current player ', self currentPlayer name.

	"We first compute the target square, and then decide what to do."
	targetSquare := self computeTargetFor: token.

	"If the target square is occupied, either:
	(a) ifthe token belongs to another player, that token is sent back to its start state and we land there
	(b) if the token belongs to the same player, then we try to land on the next square (again two cases).
	In case (b) we must iterate, and if no squares are left, we fall back to the current square."
	[ targetSquare notEmpty and: [ targetSquare ~= token square ] ] 
		whileTrue: [ 
			targetSquare token player = token player
				ifTrue: [ 
					| route targetIndex |
					route := self currentRoute.
					targetIndex := (route indexOf: targetSquare) + 1.
					targetIndex <= route size
						ifTrue: [ targetSquare := route at: targetIndex ]
						ifFalse: [ targetSquare := token square ] ]
				ifFalse: [ targetSquare token sendToStart ] ].

	token goToSquare: targetSquare.

	"At the end, we switch to the next player unless we rolled a 6."

	self die topFace = 6 ifFalse: [ self nextPlayer ].
	needToRollDie := true.
	self feedback: self gameState
]

{ #category : #accessing }
GtLudoGame >> nextPlayer [
	players addLast: players removeFirst.
	^ self currentPlayer
]

{ #category : #announcements }
GtLudoGame >> onRolled [
	self playerToRoll
		ifTrue: [ 
			lastDieRolled := self die topFace.
			needToRollDie := false.
			self feedback: self gameState ]
		ifFalse: [ "Ignore roll by pretending the last value was rolled again."
			needToRollDie := true.
			self roll: lastDieRolled ]
]

{ #category : #accessing }
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

	^ self board positionOfToken: (self tokenNamed: 'A')
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
