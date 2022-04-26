Class {
	#name : #LudoBoardExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #examples }
LudoBoardExamples >> boardWith2PlayingPlayers [
	<gtExample>
	| playerA playerB board |
	board := self emptyBoard.
	playerA := board players first.
	board enterPlayTokenFor: playerA.
	playerB := board players second.
	board enterPlayTokenFor: playerB.
	^ board
]

{ #category : #accessing }
LudoBoardExamples >> emptyBoard [

	<gtExample>
	| board |
	board := GtLudoBoard new.
	self assert: board players size equals: 4.
	self assert: board squares size equals: 40.
	self assert: board tokens size equals: 8.
	
	self assert: (board players flatCollect: #startTokens) size equals: 8.
	self assert: (board players flatCollect: #playTokens) isEmpty.
	self assert: (board players flatCollect: #goalTokens) isEmpty.
	
	^ board
]
