"
I  am a player on a Ludo Board. I have a name, and I have tokens that may be in play.
"
Class {
	#name : #GtLudoPlayer,
	#superclass : #GtLudoNamedEntity,
	#instVars : [
		'tokens',
		'game'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoPlayer >> game [
	"NB: could be nil!"
	^ game
]

{ #category : #accessing }
GtLudoPlayer >> game: aGame [
	game := aGame
]

{ #category : #accessing }
GtLudoPlayer >> goalTokens [
	^ self tokens select: #isInGoalState
]

{ #category : #accessing }
GtLudoPlayer >> gtPositionsFor: aView [
	<gtView>
	
	^ (aView explicit)
		title: 'Positions';
		priority: 10;
		stencil: [ self highlightedBoardElement ]
]

{ #category : #accessing }
GtLudoPlayer >> gtTokensFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Tokens';
		priority: 20;
		items: [ tokens ];
		column: 'Token' text: #name;
		column: 'Square' text: [:token | token square gtDisplayString]
]

{ #category : #accessing }
GtLudoPlayer >> highlightedBoardElement [
	| boardElement |
	boardElement := self game boardElement.
	(boardElement children select: [ :each | (each isKindOf: GtLudoSquareElement) and: [ each square token player = self ] ])
		do: #highlight.
	^ boardElement
]

{ #category : #initialization }
GtLudoPlayer >> initializeTokens [

	self assert: self name first isUppercase.
	tokens := { 
		          (GtLudoToken named: self name).
		          (GtLudoToken named: self name asLowercase) }
		          asOrderedCollection.
	tokens do: [ :token | token player: self ]
]

{ #category : #testing }
GtLudoPlayer >> isFinished [
	^ (self tokens reject: #isInGoalState) isEmpty
]

{ #category : #accessing }
GtLudoPlayer >> playTokens [
	^ self tokens select: #isInPlay
]

{ #category : #accessing }
GtLudoPlayer >> startTokens [
	^ self tokens select: #isInStartState
]

{ #category : #accessing }
GtLudoPlayer >> tokens [
	^ tokens
]
