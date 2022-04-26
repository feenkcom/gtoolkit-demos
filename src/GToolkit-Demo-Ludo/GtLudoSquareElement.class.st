Class {
	#name : #GtLudoSquareElement,
	#superclass : #BlElement,
	#instVars : [
		'isStartSquare',
		'square'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #accessing }
GtLudoSquareElement class >> for: aSquare [ 
	^ self new
		initializeFor: aSquare;
		yourself
]

{ #category : #accessing }
GtLudoSquareElement >> defaultColor [
	^ Color yellow
]

{ #category : #accessing }
GtLudoSquareElement >> initialize [
	super initialize.
	isStartSquare := false.
	self
		background: self defaultColor;
		border: (BlBorder paint: Color gray width: 0.1)
]

{ #category : #accessing }
GtLudoSquareElement >> initializeFor: aSquare [
	square := aSquare.
	self onUpdate
	square announcer when: GtLudoSquareUpdated send: #onUpdate to: self.
]

{ #category : #accessing }
GtLudoSquareElement >> isStartSquare [
	^ isStartSquare
]

{ #category : #accessing }
GtLudoSquareElement >> isStartSquare: aBoolean [
	isStartSquare := aBoolean.
	self background: self startSquareColor
]

{ #category : #accessing }
GtLudoSquareElement >> onUpdate [

	"Do this when GtLudoSquareUpdated is announced"

	self removeChildren.
	self addChild: (BrLabel new
			 text: self square printString;
			 aptitude: (BrGlamorousLabelAptitude new
					  foreground: Color black;
					  fontSize: 20))
]

{ #category : #accessing }
GtLudoSquareElement >> square [
	^ square
]

{ #category : #accessing }
GtLudoSquareElement >> startSquareColor [
	^ Color lightBlue
]
