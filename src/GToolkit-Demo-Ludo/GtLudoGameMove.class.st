Class {
	#name : #GtLudoGameMove,
	#superclass : #Object,
	#instVars : [
		'token',
		'roll',
		'tokenMoves'
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
	^ aView list
		  title: 'Token Moves';
		  items: [ tokenMoves ]
]

{ #category : #accessing }
GtLudoGameMove >> initialize [
	super initialize.
	tokenMoves := OrderedCollection new
]

{ #category : #accessing }
GtLudoGameMove >> move [

	| targetSquare fromSquare |
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
			targetSquare token player = self token player
				ifTrue: [ 
					| route targetIndex |
					fromSquare := self token square.
					route := self game currentRoute.
					targetIndex := (route indexOf: targetSquare) + 1.
					targetIndex <= route size
						ifTrue: [ targetSquare := route at: targetIndex ]
						ifFalse: [ targetSquare := self token square ].
					tokenMoves add: (GtLudoTokenMove new
							 token: self token;
							 fromSquare: fromSquare;
							 toSquare: targetSquare) ]
				ifFalse: [ 
					fromSquare := targetSquare.
					targetSquare := self game sendToStart: targetSquare token.
					tokenMoves add: (GtLudoTokenMove new
							 token: self token;
							 fromSquare: fromSquare;
							 toSquare: targetSquare) ] ].

	self token goToSquare: targetSquare.

	"At the end, we switch to the next player unless we rolled a 6."

	self game die topFace = 6 ifFalse: [ self game nextPlayer ].
	self game requireDieRoll.
	self game feedback: self game gameState.
	self game notifyGameUpdated
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
