Class {
	#name : #GtLudoGameExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #accessing }
GtLudoGameExamples >> bEntersPlayWithAonStartSquare [
	<gtExample>
	| game |
	game := self bToPlayWithAonStartSquare.
	game roll: 6.
	game move: 'B'.
	self assert: (game positionOfTokenNamed: 'B') equals: 11.
	self assert: game currentPlayer name equals: 'B'.
	^ game
	
]

{ #category : #accessing }
GtLudoGameExamples >> bToPlayWithAonStartSquare [
	<gtExample>
	| game |
	game := self playerAentersTokenA.
	game roll: 6.
	game move: 'A'.
	game roll: 4.
	game move: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 11.
	self assert: game currentPlayer name equals: 'B'.
	^ game
]

{ #category : #example }
GtLudoGameExamples >> emptyGame [

	<gtExample>
	| game |
	game := GtLudoGame new.
	self assert: game isOver not.
	self assert: game winner equals: 'No one'.
	self assert: game currentPlayer name equals: 'A'.
	self assert: game playerToRoll.
	self assert: game playerToMove not.
	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAentersTokenA [

	<gtExample>
	| game |
	game := self playerArolls6.

	game move: 'A'.

	self
		assert: (game positionOfTokenNamed: 'A')
		equals: 1.

	self assert: game currentPlayer name equals: 'A'.
	self assert: game playerToRoll.
	self assert: game playerToMove not.

	self assert: (game tokensToMove collect: #name) asSet equals: Set new.

	^ game
]

{ #category : #accessing }
GtLudoGameExamples >> playerAmovesTokenA [

	<gtExample>
	| game |
	game := self playerAentersTokenA.

	game roll: 5.
	self
		assert: (game tokensToMove collect: #name) asSet
		equals: { 'A' } asSet.

	game move: 'A'.
	self assert: (game positionOfTokenNamed: 'A') equals: 6.

	self assert: game currentPlayer name equals: 'B'.
	self assert: game playerToRoll.
	self assert: game playerToMove not.

	self assert: (game tokensToMove collect: #name) asSet equals: Set new.

	^ game
]

{ #category : #example }
GtLudoGameExamples >> playerArolls6 [

	<gtExample>
	| game |
	game := self emptyGame.
	game roll: 6.

	self assert: game currentPlayer name equals: 'A'.
	self assert: game playerToRoll not.
	self assert: game playerToMove.

	self
		assert: (game tokensToMove collect: #name) asSet
		equals: { 'A'. 'a' } asSet.

	^ game
]
