Class {
	#name : #GtLudoDie,
	#superclass : #Object,
	#instVars : [
		'topFace',
		'announcer'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoDie >> announcer [
	^ announcer
]

{ #category : #accessing }
GtLudoDie >> asElement [
	^ GtLudoDieElement for: self
]

{ #category : #accessing }
GtLudoDie >> gtDieFor: aView [

	"This is a new method"
]

{ #category : #accessing }
GtLudoDie >> gtLiveFor: aView [
	<gtView>
	^ self asElement gtLiveFor: aView
]

{ #category : #accessing }
GtLudoDie >> initialize [
	announcer := Announcer new.
	self roll
]

{ #category : #accessing }
GtLudoDie >> notifyRolled [
	self announcer announce: GtLudoDieRolled new
]

{ #category : #accessing }
GtLudoDie >> roll [
	topFace := (1 to: 6) atRandom.
	self notifyRolled.
	^ topFace
]

{ #category : #accessing }
GtLudoDie >> topFace [
	^ topFace
]
