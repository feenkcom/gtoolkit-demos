Class {
	#name : #GtMemoryGameElement,
	#superclass : #BlElement,
	#instVars : [
		'game'
	],
	#category : #'GToolkit-Demo-Memory-UI'
}

{ #category : #accessing }
GtMemoryGameElement >> game [
	^ game
]

{ #category : #accessing }
GtMemoryGameElement >> game: aGame [
	game := aGame.
	self onUpdated
]

{ #category : #initialize }
GtMemoryGameElement >> initialize [
	super initialize.
	self layout: BlGridLayout horizontal.
	self layout cellSpacing: 7.
	self background: Color gray.
	self constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent ].
]

{ #category : #'instance creation' }
GtMemoryGameElement >> newCardElement [
	^ GtMemoryCardElement new
]

{ #category : #hooks }
GtMemoryGameElement >> onUpdated [
	self game ifNil: [ ^ self ].
	self removeChildren.
	self layout columnCount: self game gridSize.
	self game availableCards do: [ :aCard | 
		| aCardElement |
		aCardElement := self newCardElement card: aCard.	
		aCardElement addEventHandler: (GtMemoryCardEventListener new game: self game).
		self addChild: aCardElement.
		aCard isVisible ifFalse: [ aCard notifyDisappear ] ]
]
