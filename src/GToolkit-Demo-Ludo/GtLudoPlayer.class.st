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
	^ self tokens select: #inGoalState
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
	^ self tokens select: #inPlay
]

{ #category : #accessing }
GtLudoPlayer >> startTokens [
	^ self tokens select: #inStartState
]

{ #category : #accessing }
GtLudoPlayer >> tokens [
	^ tokens
]
