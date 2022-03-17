Class {
	#name : #GtMemoryCardElement,
	#superclass : #BlElement,
	#instVars : [
		'card',
		'face',
		'back'
	],
	#category : #'GToolkit-Demo-Memory-UI'
}

{ #category : #'visual properties' }
GtMemoryCardElement >> backgroundColor [
	^ Color lightBlue
]

{ #category : #accessing }
GtMemoryCardElement >> card [
	^ card
]

{ #category : #accessing }
GtMemoryCardElement >> card: aDMGCard [
	card ifNotNil: [ :anOldCard | anOldCard announcer unsubscribe: self ].
	card := aDMGCard.
	card announcer when: GtMemoryCardFlipped send: #onFlipped to: self.
	card announcer when: GtMemoryCardDisappeared send: #onDisappear to: self.
	self onUpdated.
]

{ #category : #'visual properties' }
GtMemoryCardElement >> cardSize [
	^ 80 @ 80
]

{ #category : #'visual properties' }
GtMemoryCardElement >> foregroundColor [
	^ Color gray
]

{ #category : #initialization }
GtMemoryCardElement >> initialize [
	super initialize.
	self layout: BlFrameLayout new.
	self size: self cardSize.
	self background: self backgroundColor.
	self geometry: (BlRoundedRectangleGeometry cornerRadius: 12).
	self initializeFace.
	self addChild: face.
	self initializeBack.
	self addChild: back.
]

{ #category : #initialization }
GtMemoryCardElement >> initializeBack [
	back := BlElement new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
	back
		addChild: (BlLineElement new
			border: (BlBorder paint: self foregroundColor width: 1);
			fromAnchor: (BlElementTopLeftAnchor new referenceElement: back);
			toAnchor: (BlElementBottomRightAnchor new referenceElement: back);
			yourself);
		addChild: (BlLineElement new
			border: (BlBorder paint: self foregroundColor width: 1);
			fromAnchor: (BlElementTopRightAnchor new referenceElement: back);
			toAnchor: (BlElementBottomLeftAnchor new referenceElement: back);
			yourself).
]

{ #category : #initialization }
GtMemoryCardElement >> initializeFace [
	face := BlTextElement new text: '?' asRopedText.
	face constraintsDo: [ :c |
		c frame horizontal alignCenter.
		c frame vertical alignCenter ].
	face visibility: BlVisibility hidden.
]

{ #category : #hooks }
GtMemoryCardElement >> onDisappear [
	self visibility: BlVisibility hidden.
]

{ #category : #hooks }
GtMemoryCardElement >> onFlipped [
	self card isFlipped
		ifTrue: [ self onFlippedFace ] 
		ifFalse: [ self onFlippedBack ]
]

{ #category : #hooks }
GtMemoryCardElement >> onFlippedBack [
	face visibility: BlVisibility hidden.
	back visibility: BlVisibility visible.
]

{ #category : #hooks }
GtMemoryCardElement >> onFlippedFace [
	face visibility: BlVisibility visible.
	back visibility: BlVisibility hidden.
]

{ #category : #hooks }
GtMemoryCardElement >> onUpdated [
	self card ifNil: [ ^ self ].
	face text: (self card symbol asString asRopedText
		fontSize: self symbolFontSize;
		foreground: self foregroundColor).
	self onFlipped.
]

{ #category : #'visual properties' }
GtMemoryCardElement >> symbolFontSize [
	^ 50
]
