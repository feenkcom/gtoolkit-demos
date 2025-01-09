"
I display just the board state (without the feedback pane).
I am used within a GameElement.
"
Class {
	#name : #GtLudoBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'feedbackLabel',
		'game',
		'squares'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #'instance creation' }
GtLudoBoardElement class >> for: aGame [
	^ self new
		  initializeFor: aGame;
		  yourself
]

{ #category : #initialization }
GtLudoBoardElement >> addDieElement [
	"By default the die is not added"

	| dieElement |
	dieElement := self game die asElement.
	dieElement doubleClickAction: [ self game rollDie ].
	self addElement: dieElement asScalableElement at: 6 @ 6
]

{ #category : #accessing }
GtLudoBoardElement >> addElement: anElement at: aPoint [
	"We convert a grid position (aPoint) for an element into a pixel-based location on the board element."

	| location squareSize |
	squareSize := self gridSize / self dimensions.
	location := (aPoint - (1 @ 1)) * squareSize.
	self
		addChild:
			(anElement
				size: squareSize;
				relocate: location)
]

{ #category : #positioning }
GtLudoBoardElement >> addSquare: aSquare at: aPoint [
	| squareElement |
	squareElement := GtLudoSquareElement for: aSquare.
	squareElement when: BlDoubleClickEvent do: [ :e | aSquare signalMoveToken ].
	"squareElement when: BlClickEvent do: [ :e | e target phlow spawnObject: aSquare ]."
	self addElement: squareElement at: aPoint.
	squares add: squareElement
]

{ #category : #constants }
GtLudoBoardElement >> defaultSize [
	"Add space for feedback"
	^ self gridSize "+ (0 @ 50)"
]

{ #category : #constants }
GtLudoBoardElement >> dimensions [
	"Number of squares per side"
	^ 11 @ 11
]

{ #category : #accessing }
GtLudoBoardElement >> game [
	^ game
]

{ #category : #accessing }
GtLudoBoardElement >> goalSquarePositions [
	"The grid positions of the 8 final squares for tokens in the goal state."
	^ {2 @ 6.
		3 @ 6.
		6 @ 2.
		6 @ 3.
		10 @ 6.
		9 @ 6.
		6 @ 10.
		6 @ 9}
]

{ #category : #constants }
GtLudoBoardElement >> gridSize [
	^ 400@400
]

{ #category : #initialization }
GtLudoBoardElement >> initialize [
	super initialize.
	self
		size: self defaultSize;
		background: BrGlamorousColors neutralBackgroundColor
]

{ #category : #initialization }
GtLudoBoardElement >> initializeFor: aGame [
	game := aGame.
	squares := OrderedCollection new.
	self assert: aGame squares size equals: self numberOfSquares.
	aGame startSquares withIndexDo: [ :square :n | self addSquare: square at: (self startSquarePositions at: n) ].
	aGame squares withIndexDo: [ :square :n | self addSquare: square at: (self playPositions at: n) ].
	aGame goalSquares withIndexDo: [ :square :n | self addSquare: square at: (self goalSquarePositions at: n) ]
]

{ #category : #constants }
GtLudoBoardElement >> numberOfSquares [
	^ 40
]

{ #category : #positioning }
GtLudoBoardElement >> playPositions [
	"Compute the standard positions of the 40 Ludo squares on an 11x11 board. The positions for player A are pre-computed. Those for the other players are obtained by rotation."

	| aPositions bPositions cPositions dPositions squarePositions |
	aPositions := self playerAPositions.
	bPositions := aPositions collect: [ :p | (12 - p y) @ p x ].
	cPositions := aPositions collect: [ :p | 12 @ 12 - p ].
	dPositions := bPositions collect: [ :p | 12 @ 12 - p ].
	squarePositions := aPositions , bPositions , cPositions , dPositions.
	self assert: squarePositions size equals: self numberOfSquares.
	^ squarePositions
]

{ #category : #constants }
GtLudoBoardElement >> playerAPositions [
	"The locations of the first ten squares starting from player A's start square."
	^ {1 @ 5.
		2 @ 5.
		3 @ 5.
		4 @ 5.
		5 @ 5.
		5 @ 4.
		5 @ 3.
		5 @ 2.
		5 @ 1.
		6 @ 1}
]

{ #category : #accessing }
GtLudoBoardElement >> squares [
	^ squares
]

{ #category : #constants }
GtLudoBoardElement >> startSquarePositions [

	"The grid positions of the 8 holding squares for tokens in the start state."
	^ {1 @ 2.
		2 @ 2.
		10 @ 1.
		10 @ 2.
		11 @ 10.
		10 @ 10.
		2 @ 11.
		2 @ 10}
	
]
