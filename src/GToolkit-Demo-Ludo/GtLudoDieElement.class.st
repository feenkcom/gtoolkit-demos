"
I am a visualization of a {{gtClass:name=GtLudoDie}} instance.

```
GtLudoDie new asElement
```

I am updated automatically when a die is rolled.
When you double-click me, I ask the die to be rolled.

```
GtLudoDie new
```

"
Class {
	#name : #GtLudoDieElement,
	#superclass : #BlElement,
	#instVars : [
		'die'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #'instance creation' }
GtLudoDieElement class >> for: aDie [
	^ self new
		die: aDie;
		yourself
]

{ #category : #accessing }
GtLudoDieElement >> die [
	^ die
]

{ #category : #accessing }
GtLudoDieElement >> die: aDie [
	die := aDie.
	self setUpAnnouncements
]

{ #category : #constants }
GtLudoDieElement >> dieWidth [
	"There is space for three dots plus spaces between and around them."
	^ 3 * self dotWidth + (4 * self dotSpace)
]

{ #category : #constants }
GtLudoDieElement >> dotSpace [
	"Space between a dot and the edge of the die or another dot"
	^ 10
]

{ #category : #constants }
GtLudoDieElement >> dotWidth [
	^ 20
]

{ #category : #constants }
GtLudoDieElement >> facePositions [
	"These are the positions on the 3x3 grid of the dots for each face value from 1 to 6.
	Note that there are n dot positions for face value n."

	^ {{2 @ 2}.
		{1 @ 3.
			3 @ 1}.
		{1 @ 3.
			2 @ 2.
			3 @ 1}.
		{1 @ 1.
			1 @ 3.
			3 @ 1.
			3 @ 3}.
		{1 @ 1.
			1 @ 3.
			2 @ 2.
			3 @ 1.
			3 @ 3}.
		{1 @ 1.
			1 @ 2.
			1 @ 3.
			3 @ 1.
			3 @ 2.
			3 @ 3}}
]

{ #category : #initialization }
GtLudoDieElement >> initialize [
	super initialize.
	self
		size: self dieWidth @ self dieWidth;
		background: Color paleBuff;
		border: (BlBorder paint: Color veryVeryLightGray width: 1);
		geometry: (BlRoundedRectangleGeometry cornerRadius: 12)
]

{ #category : #displaying }
GtLudoDieElement >> newDot [
	^ (BlElement new)
		geometry: BlCircleGeometry new;
		size: 20 @ 20;
		background: Color black;
		yourself
]

{ #category : #announcements }
GtLudoDieElement >> onRolled [
	self showFace: self die topFace
]

{ #category : #displaying }
GtLudoDieElement >> placeDotAt: aPosition [
	| location |
	self assert: ((1 to: 3) includes: aPosition x).
	self assert: ((1 to: 3) includes: aPosition y).
	location := aPosition * (self dotSpace + self dotWidth) - (self dotWidth @ self dotWidth).
	self
		addChild: (self newDot value relocate: location);
		yourself
]

{ #category : #announcements }
GtLudoDieElement >> setUpAnnouncements [
	self die announcer
		when: GtLudoDieRolled
		send: #onRolled
		to: self.
	self
		when: BlDoubleClickEvent
		do: [ :anEvent | 
			anEvent consumed: true.
			self die roll ].
	self onRolled
]

{ #category : #displaying }
GtLudoDieElement >> showFace: anInteger [
	self removeChildren.
	(self facePositions at: anInteger) do: [ :position | self placeDotAt: position ]
]
