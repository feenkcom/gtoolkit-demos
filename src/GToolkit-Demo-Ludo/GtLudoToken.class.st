"
I am a token belonging to a LudoPlayer. I move around the LudoBoard, following the rules of the game.
I know my state (#start, #play or #goal) and when I am in play, I know which square I am on.

A blank token is just a dummy placeholder, with a blank name, and the state #blank. (It is a kind of Null Object.)
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
	^ (self named: self blankName)
		beBlank;
		yourself
]

{ #category : #constants }
GtLudoToken class >> blankName [
	^ ' '
]

{ #category : #assertions }
GtLudoToken >> assertValidState [
	self assert: (#(blank start play goal) includes: state)
]

{ #category : #state }
GtLudoToken >> beBlank [
	state := #blank
]

{ #category : #moving }
GtLudoToken >> enterPlayOnSquare: aSquare [
	state := #play.
	^ self goToSquare: aSquare
]

{ #category : #accessing }
GtLudoToken >> goToSquare: aSquare [
	square := aSquare.
	aSquare token: self.
	^ aSquare
]

{ #category : #initialization }
GtLudoToken >> initialize [
	super initialize.
	state := #start
	"Should we initialize square to a dummy square?
	It is only expected to have a value if state is #play."
]

{ #category : #testing }
GtLudoToken >> isBlank [
	^  state = #blank
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
