Class {
	#name : #GtLudoDieElement,
	#superclass : #BlElement,
	#instVars : [
		'die'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #accessing }
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
	self die announcer
		when: GtLudoDieRolled
		send: #onRolled
		to: self.
	self onRolled
]

{ #category : #accessing }
GtLudoDieElement >> dieWidth [
	"There is space for three dots plus spaces between and around them."
	^ 3 * self dotWidth + (4 * self dotSpace)
]

{ #category : #accessing }
GtLudoDieElement >> dotSpace [
	"Space between a dot and the edge of the die or another dot"
	^ 10
]

{ #category : #accessing }
GtLudoDieElement >> dotWidth [
	^ 20
]

{ #category : #accessing }
GtLudoDieElement >> facePositions [
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

{ #category : #accessing }
GtLudoDieElement >> initialize [
	super initialize.
	self
		size: self dieWidth @ self dieWidth;
		background: Color paleBuff;
		border: (BlBorder paint: Color veryVeryLightGray width: 1);
		geometry: (BlRoundedRectangleGeometry cornerRadius: 12)
]

{ #category : #accessing }
GtLudoDieElement >> newDot [
	^ (BlElement new)
		geometry: BlCircleGeometry new;
		size: 20 @ 20;
		background: Color black;
		yourself
]

{ #category : #accessing }
GtLudoDieElement >> onRolled [
	self showFace: self die topFace
]

{ #category : #accessing }
GtLudoDieElement >> placeDotAt: aPosition [
	| location |
	self assert: ((1 to: 3) includes: aPosition x).
	self assert: ((1 to: 3) includes: aPosition y).
	location := aPosition * (self dotSpace + self dotWidth) - (self dotWidth @ self dotWidth).
	self
		addChild: (self newDot value relocate: location);
		yourself
]

{ #category : #accessing }
GtLudoDieElement >> showFace: anInteger [
	self removeChildren.
	(self facePositions at: anInteger) do: [ :position | self placeDotAt: position ]
]
