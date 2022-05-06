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
GtLudoTokenMove >> fromSquare: aSquare [
	fromSquare := aSquare
]

{ #category : #accessing }
GtLudoTokenMove >> highlightedBoardElement [
	| boardElement |
	boardElement := token game boardElement.
	(boardElement children select: [ :each | (each isKindOf: GtLudoSquareElement) and: [ each square = fromSquare or: [each square = toSquare] ] ])
		do: #highlight.
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
GtLudoTokenMove >> toSquare: aSquare [
	toSquare := aSquare
]

{ #category : #accessing }
GtLudoTokenMove >> token: aToken [
	token := aToken
]
