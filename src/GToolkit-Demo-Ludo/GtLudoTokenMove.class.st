Class {
	#name : #GtLudoTokenMove,
	#superclass : #Object,
	#instVars : [
		'token',
		'fromSquare',
		'toSquare'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoTokenMove >> fromSquare [
	^ fromSquare
]

{ #category : #accessing }
GtLudoTokenMove >> fromSquare: aSquare [
	fromSquare := aSquare
]

{ #category : #accessing }
GtLudoTokenMove >> highlightBoardElement: aBoardElement [

	| toSquareElement fromSquareElement arc |
	fromSquareElement := aBoardElement squares detect: [ :each | 
		                     each square = fromSquare ].
	toSquareElement := aBoardElement squares detect: [ :each | 
		                   each square = toSquare ].
	fromSquareElement highlight.
	toSquareElement highlight.
	arc := BlParabollaArcElement new
				curvatureFraction: 0.6;
		        border: (BlBorder paint: (Color blue alpha: 0.5) width: 2);
		        toHead: (BlArrowheadSimpleArrow new border:
					         (BlBorder paint: (Color blue alpha: 0.5) width: 2)).
	arc constraints ignoreByLayout.
	arc
		fromAnchor: (BlElementCenterAnchor element: fromSquareElement);
		toAnchor: (BlElementCenterAnchor element: toSquareElement).
	arc zIndex: 10.
	aBoardElement addChild: arc.
	^ aBoardElement
]

{ #category : #accessing }
GtLudoTokenMove >> highlightedBoardElement [

	| boardElement  |
	boardElement := token game boardElement.
	self highlightBoardElement: boardElement.
	^ boardElement
]

{ #category : #accessing }
GtLudoTokenMove >> moveOnBoardFor: aView [
	<gtView>
	
	^ (aView explicit)
		title: 'Move';
		priority: 10;
		stencil: [ self highlightedBoardElement ]
]

{ #category : #accessing }
GtLudoTokenMove >> toSquare [
	^ toSquare
]

{ #category : #accessing }
GtLudoTokenMove >> toSquare: aSquare [
	toSquare := aSquare
]

{ #category : #accessing }
GtLudoTokenMove >> token [
	^ token
]

{ #category : #accessing }
GtLudoTokenMove >> token: aToken [
	token := aToken
]
