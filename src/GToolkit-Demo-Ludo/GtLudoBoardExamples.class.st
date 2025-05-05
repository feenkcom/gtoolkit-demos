"
I provide a couple of examples illustrating the low-level board state methods.
"
Class {
	#name : #GtLudoBoardExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #example }
GtLudoBoardExamples >> boardWith2PlayingPlayers [
	<gtExample>
	<return: #GtLudoGame>
	| board playerA playerB |
	board := self emptyBoard.

	playerA := board players first.
	playerA tokens do: [ :token | self assert: token isInStartState ].
	board enterPlayTokenFor: playerA.
	self assert: playerA tokens first isInPlay.
	self assert: playerA tokens second isInStartState.

	playerB := board players second.
	playerB tokens do: [ :token | self assert: token isInStartState ].
	board enterPlayTokenFor: playerB.
	self assert: playerB tokens first isInPlay.
	self assert: playerB tokens second isInStartState.

	^ board
]

{ #category : #example }
GtLudoBoardExamples >> emptyBoard [
	<gtExample>
	<return: #GtLudoGame>
	| board |
	board := GtLudoGame new.
	self assert: board players size equals: 4.
	self assert: board squares size equals: 40.
	self assert: board tokens size equals: 8.
	board tokens do: [ :token | self assert: token isInStartState ].
	board squares do: [ :square | self assert: square isEmpty ].

	board players
		do: [ :player | 
			| route |
			route := board routeFor: player.
			self assert: route size equals: 42.
			self assert: route first kind equals: #initial.
			self assert: route last kind equals: #goal.
			self assert: route nextToLast kind equals: #goal ].

	^ board
]
