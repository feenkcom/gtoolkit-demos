Class {
	#name : #GtLudoBoardElement,
	#superclass : #BlElement,
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #accessing }
GtLudoBoardElement >> addSquareAt: aPoint [
	| location  squareSize  |
	squareSize := self defaultSize / self dimensions.
	location := aPoint - (1 @ 1) * squareSize.
	self addChild: (BlElement new
			 size: squareSize - (2 * self delta);
			 background: Color yellow;
			 relocate: location + self delta)
]

{ #category : #accessing }
GtLudoBoardElement >> defaultSize [
	^ 400@400
]

{ #category : #accessing }
GtLudoBoardElement >> delta [
	"Margin x and y for each square"
	^ 2@2
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
