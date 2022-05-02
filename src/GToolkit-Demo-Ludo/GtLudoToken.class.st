"
I am a token belonging to a LudoPlayer. I move around the LudoBoard, following the rules of the game.
I know my state (#start, #play or #goal) and when I am in play, I know which square I am on.

"
Class {
	#name : #GtLudoToken,
	#superclass : #GtLudoNamedEntity,
	#instVars : [
		'state',
		'square'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #'instance creation' }
GtLudoToken class >> blank [
	^ GtLudoBlankToken new
]

{ #category : #assertions }
GtLudoToken >> assertValidState [
	self assert: (#(start play goal) includes: state)
]

{ #category : #moving }
GtLudoToken >> enterPlayOnSquare: aSquare [
	state := #play.
	^ self goToSquare: aSquare
]

{ #category : #accessing }
GtLudoToken >> goToSquare: aSquare [
	self square ifNotNil: [ self square clear ].
	square := aSquare.
	aSquare token: self.
	^ aSquare
]

{ #category : #initialization }
GtLudoToken >> initialize [
	super initialize.
	state := #start
]

{ #category : #testing }
GtLudoToken >> isBlank [
	^  false
]

{ #category : #testing }
GtLudoToken >> isInGoalState [
	^ state = #goal
]

{ #category : #testing }
GtLudoToken >> isInPlay [
	^ state == #play
]

{ #category : #testing }
GtLudoToken >> isInStartState [
	^ state == #start
]

{ #category : #accessing }
GtLudoToken >> square [
	^ square
]

{ #category : #accessing }
GtLudoToken >> state [
	self assertValidState.
	^ state
]
