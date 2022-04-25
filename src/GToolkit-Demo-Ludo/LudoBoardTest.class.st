Class {
	#name : #LudoBoardTest,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #accessing }
LudoBoardTest >> emptyBoard [

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
