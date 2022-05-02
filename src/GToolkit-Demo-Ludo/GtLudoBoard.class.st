"
I contain all the pieces that represent the game state and that need to be rendered, namely Squares, Players, and indirectly through the players, their Tokens.

I don't manage the game logic, which is in LudoGame.
"
Class {
	#name : #GtLudoBoard,
	#superclass : #Object,
	#instVars : [
		'players',
		'squares'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #'gt - extensions' }
GtLudoBoard >> asElement [
	^ GtLudoBoardElement for: self
]

{ #category : #moving }
GtLudoBoard >> enterPlayTokenFor: aPlayer [

	"What should be the behavior if there are no tokens left to put into play?"

	"aPlayer startTokens isEmpty ifTrue: [ ^ nil ]."
	
	self assert: aPlayer startTokens notEmpty.

	^ aPlayer startTokens first enterPlayOnSquare:
		(self startSquareFor: aPlayer)
]

{ #category : #'gt - extensions' }
GtLudoBoard >> gtBoardFor: aView [
	<gtView>
	^ aView explicit
		  title: 'Board';
		  priority: 30;
		  stencil: [ self asElement ]
]

{ #category : #'gt - extensions' }
GtLudoBoard >> gtPlayersFor: aView [
	<gtView>
	^ aView columnedList
		  title: 'Players';
		  priority: 10;
		  items: [ self players ];
		  column: 'Player' text: [ :eachItem | eachItem gtDisplayText ]
]

{ #category : #'gt - extensions' }
GtLudoBoard >> gtSquaresFor: aView [
	<gtView>
	^ aView columnedList
		  title: 'Squares';
		  priority: 20;
		  items: [ self squares ];
		  column: 'Index'
		  text: [ :eachItem :eachIndex | 
			  eachIndex asRopedText foreground: Color gray ]
		  width: 45;
		  column: 'Tokens' text: [ :eachItem | eachItem gtDisplayText ]
]

{ #category : #initialization }
GtLudoBoard >> initialize [
	super initialize.
	
	players := OrderedCollection new.
	($A to: $D) do: [ :player | 
		players add: (GtLudoPlayer new name: player) ].

	squares := OrderedCollection new.
	1 to: 40 do: [ :n | squares add: GtLudoSquare new ].

	players do: #initializeTokens
]

{ #category : #accessing }
GtLudoBoard >> players [
	^ players
]

{ #category : #accessing }
GtLudoBoard >> squares [
	^ squares
]

{ #category : #moving }
GtLudoBoard >> startSquareFor: aPlayer [
	"Compute the start square for a given player. Positions should be 1, 11, 21, 31."

	| index |
	self assert: (self players includes: aPlayer).
	index := 1 + (((self players indexOf: aPlayer) - 1) * (self squares size // self players size)).
	self assert: index <= squares size.
	self assert: index \\ 10 equals: 1.
	^ self squares at: index
]

{ #category : #accessing }
GtLudoBoard >> tokens [
	^ players flatCollect: #tokens
]
