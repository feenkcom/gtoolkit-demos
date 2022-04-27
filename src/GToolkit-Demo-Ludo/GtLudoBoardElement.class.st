Class {
	#name : #GtLudoBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #accessing }
GtLudoBoardElement class >> for: aBoard [
	^ self new
		  initializeFor: aBoard;
		  yourself
]

{ #category : #accessing }
GtLudoBoardElement >> addSquare: aSquare at: aPoint [

	| location squareSize squareColor squareElement |
	squareSize := self defaultSize / self dimensions.
	location := aPoint - (1 @ 1) * squareSize.
	squareElement := GtLudoSquareElement for: aSquare.
	(self startSquares includes: aPoint) ifTrue: [ 
		squareElement isStartSquare: true ].
	self addChild: (squareElement
			 size: squareSize;
			 relocate: location;
			 when: BlClickEvent
			 do: [ :e | e target phlow spawnObject: aSquare ])
]

{ #category : #accessing }
GtLudoBoardElement >> defaultSize [
	^ 400@400
]

{ #category : #accessing }
GtLudoBoardElement >> dimensions [
	"Number of squares per side"
	^ 11 @ 11
]

{ #category : #accessing }
GtLudoBoardElement >> initialize [
	super initialize.
	self
		size: self defaultSize;
		background: Color veryVeryLightGray
]

{ #category : #accessing }
GtLudoBoardElement >> initializeFor: aBoard [
	board := aBoard.
	self assert: aBoard squares size equals: self numberOfSquares.
	aBoard squares withIndexDo: [ :square :n | 
		self addSquare: square at: (self squarePositions at: n) ]
]

{ #category : #accessing }
GtLudoBoardElement >> numberOfSquares [
	^ 40
]

{ #category : #accessing }
GtLudoBoardElement >> squarePositions [

	"Compute the standard positions of the 40 Ludo squares on an 11x11 board"

	| aPositions bPositions cPositions dPositions squarePositions |
	aPositions := { 
		              (1 @ 5).
		              (2 @ 5).
		              (3 @ 5).
		              (4 @ 5).
		              (5 @ 5).
		              (5 @ 4).
		              (5 @ 3).
		              (5 @ 2).
		              (5 @ 1).
		              (6 @ 1) }.
	bPositions := aPositions collect: [ :p | 12 - p y @ p x ].
	cPositions := aPositions collect: [ :p | 12 @ 12 - p ].
	dPositions := bPositions collect: [ :p | 12 @ 12 - p ].
	squarePositions := aPositions , bPositions , cPositions , dPositions.
	self assert: squarePositions size equals: self numberOfSquares.
	^ squarePositions
]

{ #category : #accessing }
GtLudoBoardElement >> startSquares [

	^ { 
		  (1 @ 5).
		  (7 @ 1).
		  (11 @ 7).
		  (5 @ 11) }
]
