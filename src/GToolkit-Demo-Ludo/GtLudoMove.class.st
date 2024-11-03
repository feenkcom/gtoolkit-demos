"
I enacapsulate a move on the board as a first-class entity
"
Class {
	#name : #GtLudoMove,
	#superclass : #Object,
	#instVars : [
		'token',
		'roll',
		'tokenMoves',
		'player'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #converting }
GtLudoMove >> asElement [
	^ self highlightedBoardElement
]

{ #category : #accessing }
GtLudoMove >> asMoveAndBoardElement [
	| container |
	container := BrVerticalPane new fitContent alignCenter.
	container
		addChild: (BrLabel new
				aptitude: (BrGlamorousLabelAptitude new fontSize: 20);
				text: 'Player ' , self player name , ' rolled ' , self roll asString);
		addChild: (self replayGameToHere moves last highlightedBoardElement aptitude: BrShadowAptitude; margin: (BlInsets all: 10)).
	^ container
]

{ #category : #asserting }
GtLudoMove >> assert: aBlock description: aStringOrBlock [
	"Demo of moldable exceptions."

	<debuggerCompleteToSender>
	aBlock value
		ifFalse: [ (LudoMoveAssertionFailure forMove: self) signal: aStringOrBlock value ]
]

{ #category : #testing }
GtLudoMove >> canMove [
	^ tokenMoves notEmpty
]

{ #category : #accessing }
GtLudoMove >> game [
	^ self player game
]

{ #category : #action }
GtLudoMove >> gtReplayAction: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Replay to here';
		priority: 20;
		icon: BrGlamorousIcons tohere;
		action: [ :aButton | aButton phlow spawnObject: self replayGameToHere ]
]

{ #category : #view }
GtLudoMove >> gtReplayedMoveFor: aView [
	<gtView>
	
	^ (aView explicit)
		title: 'Replay';
		priority: 20;
		stencil: [ self replayGameToHere ]
]

{ #category : #view }
GtLudoMove >> gtTokenMovesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Token moves';
		priority: 30;
		items: [ tokenMoves ];
		column: 'Token' text: #token;
		column: 'From Square' text: #fromSquare;
		column: 'To Square' text: #toSquare
]

{ #category : #accessing }
GtLudoMove >> highlightedBoardElement [
	| boardElement |
	boardElement := self player game boardElement.
	tokenMoves do: [ :tokenMove | 
		tokenMove highlightBoardElement: boardElement ].
	^ boardElement
]

{ #category : #accessing }
GtLudoMove >> initialize [
	super initialize.
	tokenMoves := OrderedCollection new.
	token := GtLudoBlankToken new
]

{ #category : #accessing }
GtLudoMove >> move [
	| targetSquare fromSquare fromSquare1 targetSquare1 capturedToken |
	self
		assert: self game playerToMove
		description: 'Roll the die first!'.
	self
		assert: self token player = self game currentPlayer
		description: 'Token ' , self token name
				, ' does not belong to current player ' , self game currentPlayer name
		.	"We first compute the target square, and then decide what to do."
	fromSquare := self token square.
	targetSquare := self game computeTargetFor: self token.
	tokenMoves
		add: (GtLudoTokenMove new
				token: self token;
				fromSquare: fromSquare;
				toSquare: targetSquare).	"If the target square is occupied, either:
	(a) if the token belongs to another player, that token is sent back to its start state and we land there
	(b) if the token belongs to the same player, then we try to land on the next square (again two cases).
	In case (b) we must iterate, and if no squares are left, we fall back to the current square."
	[ targetSquare notEmpty and: [ targetSquare ~= self token square ] ]
		whileTrue: [ fromSquare := targetSquare.
			targetSquare token player = self token player
				ifTrue: [ | route targetIndex |
					route := self game currentRoute.
					targetIndex := (route indexOf: targetSquare) + 1.
					targetIndex <= route size
						ifTrue: [ targetSquare := route at: targetIndex ]
						ifFalse: [ targetSquare := self token square ].
					tokenMoves
						add: (GtLudoTokenMove new
								token: self token;
								fromSquare: fromSquare;
								toSquare: targetSquare) ]
				ifFalse: [ fromSquare1 := targetSquare.
					capturedToken := targetSquare token.
					targetSquare1 := self game sendToStart: capturedToken.
					tokenMoves
						add: (GtLudoTokenMove new
								token: capturedToken;
								fromSquare: fromSquare1;
								toSquare: targetSquare1) ] ].

	self token goToSquare: targetSquare.	"At the end, we switch to the next player unless we rolled a 6."

	self game die topFace = 6 ifFalse: [ self game nextPlayer ].
	self game requireDieRoll.
	self game feedback: self game gameState.
	self game notifyGameUpdated
]

{ #category : #accessing }
GtLudoMove >> moveOnBoardFor: aView [
	<gtView>
	^ aView explicit
		title: 'Move';
		priority: 10;
		stencil: [ self asMoveAndBoardElement asScalableElement ]
]

{ #category : #accessing }
GtLudoMove >> numberOfTokensMoved [
	^ tokenMoves size
]

{ #category : #accessing }
GtLudoMove >> player [
	^ player
]

{ #category : #accessing }
GtLudoMove >> player: aPlayer [
	player := aPlayer
]

{ #category : #replaying }
GtLudoMove >> replayGameToHere [

	| movesToPlay replayedGame |
	movesToPlay := self game moves copyUpThrough: self.
	replayedGame := GtLudoRecordingGame new.
	movesToPlay do: [ :move | 
		replayedGame roll: move roll.
		move canMove ifTrue: [ replayedGame moveTokenNamed: move token name ] ].
	^ replayedGame
]

{ #category : #replaying }
GtLudoMove >> replayedBoardElement [
	"TODO -- this doesn't work as the from and to squares belong to a different instance of the game!"
	| boardElement |
	
	self shouldBeImplemented.
	
	boardElement := self replayGameToHere boardElement.
	tokenMoves do: [ :tokenMove | 
		tokenMove highlightBoardElement: boardElement ].
	^ boardElement
]

{ #category : #accessing }
GtLudoMove >> roll [
	^ roll
]

{ #category : #accessing }
GtLudoMove >> roll: aNumber [
	self assert: ((1 to: 6) includes: aNumber) description: 'Number must be a valid die roll from 1 to 6'.
	roll := aNumber
]

{ #category : #accessing }
GtLudoMove >> token [
	^ token
]

{ #category : #accessing }
GtLudoMove >> token: aToken [
	token := aToken
]

{ #category : #accessing }
GtLudoMove >> tokenMoves [ 
	^ tokenMoves 
]
