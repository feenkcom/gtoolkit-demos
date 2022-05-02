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

{ #category : #initialization }
GtLudoSquareElement >> colorForKind [
	^ {#start -> Color lightGreen.
		#initial -> Color lightBlue.
		#play -> Color yellow.
		#goal -> Color lightRed} asDictionary at: self square kind
]

{ #category : #accessing }
GtLudoSquareElement >> highlight [
	self border: (BlBorder paint: self highlightColor width: 0.1)
]

{ #category : #constants }
GtLudoSquareElement >> highlightColor [
	^ Color magenta
]

{ #category : #initialization }
GtLudoSquareElement >> initialize [
	super initialize.
	self
		layout: BlFrameLayout new;
		border: (BlBorder paint: Color gray width: 0.1)
]

{ #category : #initialization }
GtLudoSquareElement >> initializeFor: aSquare [
	square := aSquare.
	self background: self colorForKind.
	self onUpdate square announcer
		when: GtLudoSquareUpdated
		send: #onUpdate
		to: self
]

{ #category : #accessing }
GtLudoSquareElement >> lowlight [
	self border: (BlBorder paint: self lowlightColor width: 0.1)
]

{ #category : #constants }
GtLudoSquareElement >> lowlightColor [
	^ Color gray
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
