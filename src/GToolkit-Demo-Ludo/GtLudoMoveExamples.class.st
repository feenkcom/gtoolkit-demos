Class {
	#name : #GtLudoMoveExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Ludo-Examples'
}

{ #category : #accessing }
GtLudoMoveExamples >> landingOnOwnPlayerToken [
	<gtExample>
	| move |
	move := GtLudoRecordingGameExamples new playerAenterAndLandsOnTokenA moves last.
	^ move
]
