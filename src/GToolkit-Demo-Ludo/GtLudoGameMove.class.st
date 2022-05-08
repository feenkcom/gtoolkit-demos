Class {
	#name : #GtLudoGameMove,
	#superclass : #Object,
	#instVars : [
		'token',
		'roll',
		'tokenMoves',
		'player'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoGameMove >> game [
	^ self token game
]

{ #category : #accessing }
GtLudoGameMove >> gtTokenMovesFor: aView [

	<gtView>
	^ aView columnedList
		  title: 'Token Moves';
		  items: [ tokenMoves ];
		  column: 'Token' text: #token;
		  column: 'From Square' text: #fromSquare;
		  column: 'To Square' text: #toSquare
]

{ #category : #accessing }
GtLudoGameMove >> highlightedBoardElement [
	| boardElement arc toSquareElement fromSquareElement |
	boardElement := self player game boardElement.
	tokenMoves do: [ :tokenMove | 
		tokenMove highlightBoardElement: boardElement ].
	^ boardElement
]

{ #category : #accessing }
GtLudoGameMove >> initialize [
	super initialize.
	tokenMoves := OrderedCollection new.
	token := GtLudoBlankToken new
]

{ #category : #accessing }
GtLudoGameMove >> move [

	| targetSquare fromSquare fromSquare1 targetSquare1 |
	self
		assert: self game playerToMove
		description: 'Roll the die first!'.
	self
		assert: self token player = self game currentPlayer
		description:
			'Token ' , self token name , ' does not belong to current player '
			, self game currentPlayer name.
	"We first compute the target square, and then decide what to do."
	fromSquare := self token square.
	targetSquare := self game computeTargetFor: self token.
	tokenMoves add: (GtLudoTokenMove new
			 token: self token;
			 fromSquare: fromSquare;
			 toSquare: targetSquare).
	"If the target square is occupied, either:
	(a) if the token belongs to another player, that token is sent back to its start state and we land there
	(b) if the token belongs to the same player, then we try to land on the next square (again two cases).
	In case (b) we must iterate, and if no squares are left, we fall back to the current square."
	[ targetSquare notEmpty and: [ targetSquare ~= self token square ] ] 
		whileTrue: [ 
			fromSquare := targetSquare.
			targetSquare token player = self token player
				ifTrue: [ 
					| route targetIndex |
					route := self game currentRoute.
					targetIndex := (route indexOf: targetSquare) + 1.
					targetIndex <= route size
						ifTrue: [ targetSquare := route at: targetIndex ]
						ifFalse: [ targetSquare := self token square ].
					tokenMoves add: (GtLudoTokenMove new
							 token: self token;
							 fromSquare: fromSquare;
							 toSquare: targetSquare). ]
				ifFalse: [ 
					fromSquare1 := targetSquare.
					targetSquare1 := self game sendToStart: targetSquare token.
					tokenMoves add: (GtLudoTokenMove new
							 token: self token;
							 fromSquare: fromSquare1;
							 toSquare: targetSquare1) ] ].

	self token goToSquare: targetSquare.

	"At the end, we switch to the next player unless we rolled a 6."

	self game die topFace = 6 ifFalse: [ self game nextPlayer ].
	self game requireDieRoll.
	self game feedback: self game gameState.
	self game notifyGameUpdated
]

{ #category : #accessing }
GtLudoGameMove >> moveOnBoardFor: aView [
	<gtView>
	
	^ (aView explicit)
		title: 'Move';
		priority: 10;
		stencil: [ self highlightedBoardElement ]
]

{ #category : #accessing }
GtLudoGameMove >> player [
	^ player
]

{ #category : #accessing }
GtLudoGameMove >> player: aPlayer [
	player := aPlayer
]

{ #category : #accessing }
GtLudoGameMove >> roll [
	^ roll
]

{ #category : #accessing }
GtLudoGameMove >> roll: aNumber [
	self assert: ((1 to: 6) includes: aNumber) description: 'Number must be a valid die roll from 1 to 6'.
	roll := aNumber
]

{ #category : #accessing }
GtLudoGameMove >> token [
	^ token
]

{ #category : #accessing }
GtLudoGameMove >> token: aToken [
	token := aToken
]
