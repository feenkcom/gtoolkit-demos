"
I contain all the pieces that represent the game state and that need to be rendered.
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

{ #category : #accessing }
GtLudoBoard >> enterPlayTokenFor: aPlayer [

	"What should be the behavior if there are no tokens left to put into play?"

	"aPlayer startTokens isEmpty ifTrue: [ ^ nil ]."
	
	self assert: aPlayer startTokens notEmpty.

	^ aPlayer startTokens first enterPlayOnSquare:
		(self startSquareFor: aPlayer)
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

{ #category : #accessing }
GtLudoBoard >> startSquareFor: aPlayer [
	"Evenly distribute the start squares for the players amonsgt the available squares. Should be at positions 1, 11, 21, 31."
	| index |
	self assert: (self players includes: aPlayer).
	index := 1 + ((self players indexOf: aPlayer) - 1
	          * (self squares size // self players size)).
	self assert: index <= squares size.
	self assert:( #(1 11 21 31) includes: index).
	^ self squares at: index
]

{ #category : #accessing }
GtLudoBoard >> tokens [
	^ players flatCollect: #tokens
]
