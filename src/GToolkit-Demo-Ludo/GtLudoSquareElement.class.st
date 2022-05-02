"
I provide a simple visualization of a square on the ludo board.


```
(GtLudoSquareElement for: GtLudoSquare new) inspect
```


If I am a start square, I have a different color.
"
Class {
	#name : #GtLudoSquareElement,
	#superclass : #BlElement,
	#instVars : [
		'isStartSquare',
		'square'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #'instance creation' }
GtLudoSquareElement class >> for: aSquare [ 
	^ self new
		initializeFor: aSquare;
		yourself
]

{ #category : #constants }
GtLudoSquareElement >> defaultColor [
	^ Color yellow
]

{ #category : #initialization }
GtLudoSquareElement >> initialize [
	super initialize.
	isStartSquare := false.
	self
		layout: BlFrameLayout new;
		background: self defaultColor;
		border: (BlBorder paint: Color gray width: 0.1)
]

{ #category : #initialization }
GtLudoSquareElement >> initializeFor: aSquare [
	square := aSquare.
	self onUpdate
	square announcer when: GtLudoSquareUpdated send: #onUpdate to: self.
]

{ #category : #testing }
GtLudoSquareElement >> isStartSquare [
	^ isStartSquare
]

{ #category : #accessing }
GtLudoSquareElement >> isStartSquare: aBoolean [
	isStartSquare := aBoolean.
	self background: self startSquareColor
]

{ #category : #announcements }
GtLudoSquareElement >> onUpdate [
	self removeChildren.
	self
		addChild:
			((BrLabel new)
				text: self square printString;
				aptitude:
						((BrGlamorousLabelAptitude new)
								foreground: Color black;
								fontSize: 20);
				constraintsDo:
						[ :c | 
							c frame horizontal alignCenter.
							c frame vertical alignCenter ])
]

{ #category : #accessing }
GtLudoSquareElement >> square [
	^ square
]

{ #category : #constants }
GtLudoSquareElement >> startSquareColor [
	^ Color lightBlue
]
