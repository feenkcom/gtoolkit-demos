"
I  am a player on a Ludo Board. I have a name, and I have tokens that may be in play.
"
Class {
	#name : #GtLudoPlayer,
	#superclass : #GtLudoNamedEntity,
	#instVars : [
		'tokens'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoPlayer >> goalTokens [
	^ self tokens select: #isInGoalState
]

{ #category : #initialization }
GtLudoPlayer >> initializeTokens [
	self assert: self name first isUppercase.
	tokens := { 
		          (GtLudoToken named: self name).
		          (GtLudoToken named: self name asLowercase) } asOrderedCollection
]

{ #category : #accessing }
GtLudoPlayer >> playTokens [
	^ self tokens select: #isInPlay
]

{ #category : #accessing }
GtLudoPlayer >> startTokens [
	^ self tokens select: #isInStartState
]

{ #category : #accessing }
GtLudoPlayer >> tokens [
	^ tokens
]
