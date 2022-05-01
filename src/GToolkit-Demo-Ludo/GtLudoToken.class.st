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

{ #category : #accessing }
GtLudoToken class >> blank [
	^ self named: self blankName
]

{ #category : #accessing }
GtLudoToken class >> blankName [
	^ ' '
]

{ #category : #accessing }
GtLudoToken >> enterPlayOnSquare: aSquare [

	"Where do we take into account if the square is already occupied, by a token of the same player or another one? 
	NB: This is the job of the Game, not the Board or the Token."

	aSquare token: self.
	state := #play.
	square := aSquare.
	^ aSquare
]

{ #category : #testing }
GtLudoToken >> inGoalState [
	^ state = #goal
]

{ #category : #testing }
GtLudoToken >> inPlay [
	^ state = #play
]

{ #category : #testing }
GtLudoToken >> inStartState [
	^ state = #start
]

{ #category : #initialization }
GtLudoToken >> initialize [
	super initialize.
	state := #start
	"Should we initialize square to a dummy square?
	It is only expected to have a value if state is #play."
]

{ #category : #accessing }
GtLudoToken >> isBlank [
	^  self name = self class blankName
]

{ #category : #accessing }
GtLudoToken >> state [
	^ state
]
