"
I am a token belonging to a LudoPlayer. I move around the LudoBoard, following the rules of the game.
I know my state (#start, #play or #goal) and when I am in play, I know which square I am on.

"
Class {
	#name : #GtLudoToken,
	#superclass : #GtLudoNamedEntity,
	#instVars : [
		'state',
		'square',
		'player'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #'instance creation' }
GtLudoToken class >> blank [
	^ GtLudoBlankToken new
]

{ #category : #assertions }
GtLudoToken >> assertValidState [
	self assert: (#(start play goal) includes: state)
]

{ #category : #moving }
GtLudoToken >> enterPlay [

	state := #play
]

{ #category : #moving }
GtLudoToken >> enterPlayOnSquare: aSquare [
	self enterPlay.
	^ self goToSquare: aSquare
]

{ #category : #accessing }
GtLudoToken >> game [
	^ self player game
]

{ #category : #accessing }
GtLudoToken >> goToSquare: aSquare [

	aSquare = self square ifTrue: [ ^ aSquare ].
	self square ifNotNil: [ self square clear ].
	square := aSquare.
	aSquare token: self.
	aSquare kind = #start ifTrue: [ state := #start ].
	aSquare kind = #goal ifTrue: [ state := #goal ].
	^ aSquare
]

{ #category : #'gt - extensions' }
GtLudoToken >> gtPositionsFor: aView [
	<gtView>
	
	^ (aView explicit)
		title: 'Position';
		priority: 10;
		stencil: [ self highlightedBoardElement ]
]

{ #category : #accessing }
GtLudoToken >> highlightedBoardElement [
	| boardElement |
	boardElement := self game boardElement.
	(boardElement children select: [ :each | (each isKindOf: GtLudoSquareElement) and: [ each square token = self ] ])
		do: #highlight.
	^ boardElement
]

{ #category : #initialization }
GtLudoToken >> initialize [
	super initialize.
	state := #start
]

{ #category : #testing }
GtLudoToken >> isBlank [
	^  false
]

{ #category : #testing }
GtLudoToken >> isInGoalState [
	^ state = #goal
]

{ #category : #testing }
GtLudoToken >> isInPlay [
	^ state == #play
]

{ #category : #testing }
GtLudoToken >> isInStartState [
	^ state == #start
]

{ #category : #accessing }
GtLudoToken >> player [
	^ player
]

{ #category : #accessing }
GtLudoToken >> player: aPlayer [
	player := aPlayer
]

{ #category : #accessing }
GtLudoToken >> square [
	^ square
]

{ #category : #accessing }
GtLudoToken >> state [
	self assertValidState.
	^ state
]
