Class {
	#name : #GtLudoBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #'instance creation' }
GtLudoBoardElement class >> for: aBoard [
	^ self new
		  initializeFor: aBoard;
		  yourself
]

{ #category : #positioning }
GtLudoBoardElement >> addSquare: aSquare at: aPoint [
	"We convert a grid position (aPoint) for a square into a pixel-based location on the board element."

	| location squareSize squareColor squareElement |
	squareSize := self defaultSize / self dimensions.
	location := (aPoint - (1 @ 1)) * squareSize.
	squareElement := GtLudoSquareElement for: aSquare.
	self
		addChild:
			(squareElement
				size: squareSize;
				relocate: location;
				when: BlClickEvent do: [ :e | e target phlow spawnObject: aSquare ])
]

{ #category : #constants }
GtLudoBoardElement >> defaultSize [
	^ 400@400
]

{ #category : #constants }
GtLudoBoardElement >> dimensions [
	"Number of squares per side"
	^ 11 @ 11
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

{ #category : #accessing }
GtLudoBoardElement >> initialSquarePositionsNOTNEEDED [
	"The initial grid positions of squares for tokens that are put into play."
	^ {1 @ 5.
		7 @ 1.
		11 @ 7.
		5 @ 11}
]

{ #category : #initialization }
GtLudoBoardElement >> initialize [
	super initialize.
	self
		size: self defaultSize;
		background: Color veryVeryLightGray
]

{ #category : #initialization }
GtLudoBoardElement >> initializeFor: aBoard [
	board := aBoard.
	self assert: aBoard squares size equals: self numberOfSquares.
	aBoard startSquares withIndexDo: [ :square :n | self addSquare: square at: (self startSquarePositions at: n) ].
	aBoard squares withIndexDo: [ :square :n | self addSquare: square at: (self playPositions at: n) ].
	aBoard goalSquares withIndexDo: [ :square :n | self addSquare: square at: (self goalSquarePositions at: n) ].
	
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

{ #category : #constants }
GtLudoBoardElement >> startSquarePositions [
	"The grid positions of the 8 holding squares for tokens in the start state."
	^ {2 @ 2.
		3 @ 2.
		10 @ 2.
		10 @ 3.
		10 @ 10.
		9 @ 10.
		2 @ 10.
		2 @ 9}
]
