Class {
	#name : #GtLudoBoardElement,
	#superclass : #BlElement,
	#instVars : [
		'board',
		'feedbackLabel'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #'instance creation' }
GtLudoBoardElement class >> for: aBoard [
	^ self new
		  initializeFor: aBoard;
		  yourself
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

{ #category : #initialization }
GtLudoBoardElement >> addFeedbackElement [
	| feedbackElement |
	feedbackElement := BlElement new
		                   size: self feedbackSize;
		                   background: Color paleBuff.
	feedbackLabel := BrLabel new
		                 aptitude: (BrGlamorousLabelAptitude new
				                  fontSize: 20;
				                  yourself);
		                 yourself.
	feedbackElement addChild: feedbackLabel.
	feedbackLabel text: ''.
	self addChild: (feedbackElement relocate: 0 @ 400)
]

{ #category : #positioning }
GtLudoBoardElement >> addSquare: aSquare at: aPoint [
	| squareElement |
	squareElement := GtLudoSquareElement for: aSquare.
	squareElement when: BlDoubleClickEvent do: [ :e | aSquare signalMoveToken ].
	"squareElement when: BlClickEvent do: [ :e | e target phlow spawnObject: aSquare ]."
	self addElement: squareElement at: aPoint
]

{ #category : #accessing }
GtLudoBoardElement >> board [
	^ board
]

{ #category : #constants }
GtLudoBoardElement >> defaultSize [
	"Add space for feedback"
	^ self gridSize + (0 @ 50)
]

{ #category : #constants }
GtLudoBoardElement >> dimensions [
	"Number of squares per side"
	^ 11 @ 11
]

{ #category : #feedback }
GtLudoBoardElement >> feedback: aString [
	feedbackLabel text: aString
]

{ #category : #constants }
GtLudoBoardElement >> feedbackSize [
	^ 400 @ 50
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
		background: Color veryVeryLightGray
]

{ #category : #initialization }
GtLudoBoardElement >> initializeFor: aBoard [
	board := aBoard.
	self assert: aBoard squares size equals: self numberOfSquares.
	aBoard startSquares withIndexDo: [ :square :n | 
		self addSquare: square at: (self startSquarePositions at: n) ].
	aBoard squares withIndexDo: [ :square :n | 
		self addSquare: square at: (self playPositions at: n) ].
	aBoard goalSquares withIndexDo: [ :square :n | 
		self addSquare: square at: (self goalSquarePositions at: n) ].
	self addElement: aBoard die asElement asScalableElement at: 6 @ 6.
	self addFeedbackElement.
	self onFeedbackUpdate.
	board announcer
		when: GtLudoBoardFeedbackUpdated
		send: #onFeedbackUpdate
		to: self
]

{ #category : #constants }
GtLudoBoardElement >> numberOfSquares [
	^ 40
]

{ #category : #announcements }
GtLudoBoardElement >> onFeedbackUpdate [
	self feedback: self board feedback
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
