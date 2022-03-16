Class {
	#name : #GtMemoryCardEventListener,
	#superclass : #BlEventListener,
	#instVars : [
		'game',
		'animation'
	],
	#category : #'GToolkit-Demo-Memory-UI'
}

{ #category : #'mouse handlers' }
GtMemoryCardEventListener >> clickEvent: anEvent [
	self game ifNil: [ ^ self ].
	self game chooseCard: anEvent currentTarget card
]

{ #category : #accessing }
GtMemoryCardEventListener >> game [
	^ game
]

{ #category : #accessing }
GtMemoryCardEventListener >> game: anObject [
	game := anObject
]

{ #category : #'mouse handlers' }
GtMemoryCardEventListener >> mouseEnterEvent: anEvent [
	self stopAnimation.
	animation := (BlTransformAnimation scale: 1.1 @ 1.1)
		absolute;
		duration: 0.5 seconds.
	anEvent currentTarget addAnimation: animation
]

{ #category : #'mouse handlers' }
GtMemoryCardEventListener >> mouseLeaveEvent: anEvent [
	self stopAnimation.
	animation := (BlTransformAnimation scale: 1.0 @ 1.0)
		absolute;
		duration: 0.5 seconds.
	anEvent currentTarget addAnimation: animation
]

{ #category : #private }
GtMemoryCardEventListener >> stopAnimation [
	animation ifNotNil: [ :anAnimation | anAnimation isRunning ifTrue: #stop ].
]
