"
I am a composite graphical Element holding the game state (a GtLudoBoardElement) as well as a Feedback element.
"
Class {
	#name : #GtLudoGameElement,
	#superclass : #BlElement,
	#instVars : [
		'game',
		'feedbackLabel'
	],
	#category : #'GToolkit-Demo-Ludo-UI'
}

{ #category : #'instance creation' }
GtLudoGameElement class >> for: aGame [
	^ self new
		  initializeFor: aGame;
		  yourself
]

{ #category : #feedback }
GtLudoGameElement >> feedback: aString [
	feedbackLabel text: aString
]

{ #category : #initialization }
GtLudoGameElement >> feedbackElement [
	| feedbackElement |
	feedbackElement := BlElement new background: Color paleBuff.
	feedbackElement
		layout: BlLinearLayout new alignCenter;
		constraintsDo:
				[ :c | 
					c vertical fitContent.
					c horizontal matchParent ].
	feedbackLabel := (BrLabel new)
		aptitude:
				((BrGlamorousLabelAptitude new)
						fontSize: 20;
						yourself);
		yourself.
	feedbackElement addChild: feedbackLabel.
	feedbackLabel text: 'PLACEHOLDER'.
	^ feedbackElement
]

{ #category : #acccessing }
GtLudoGameElement >> game [
	^ game
]

{ #category : #initialization }
GtLudoGameElement >> initialize [
	super initialize.
	self
		layout: BlLinearLayout vertical;
		border: (BlBorder paint: Color gray width: 0.1)
]

{ #category : #initialization }
GtLudoGameElement >> initializeFor: aGame [
	game := aGame.
	self
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent ].
	self
		addChild: (aGame boardElement
				addDieElement;
				yourself).
	self addChild: self feedbackElement.
	self onFeedbackUpdate.
	game announcer
		when: GtLudoBoardFeedbackUpdated
		send: #onFeedbackUpdate
		to: self.
	game die announcer
		when: GtLudoDieRolled
		do: [ game playerToRoll ifFalse: [ (self query // GtLudoDieElement) anyOne disable ] ].
	game announcer
		when: GtLudoGameUpdated
		do: [ (game isOver not and: [ game playerToRoll ])
				ifTrue: [ (self query // GtLudoDieElement) anyOne enable ] ]
]

{ #category : #feedback }
GtLudoGameElement >> onFeedbackUpdate [
	self feedback: self game feedback
]
