"
I am an ordinary 6-sided die with a graphical display.


```
GtLudoDie new
```


"
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

{ #category : #converting }
GtLudoDie >> asElement [
	^ GtLudoDieElement for: self
]

{ #category : #'gt - extensions' }
GtLudoDie >> gtLiveFor: aView [
	<gtView>
	^ self asElement gtLiveFor: aView
]

{ #category : #initialization }
GtLudoDie >> initialize [
	announcer := Announcer new.
	self roll
]

{ #category : #announcements }
GtLudoDie >> notifyRolled [
	self announcer announce: GtLudoDieRolled new
]

{ #category : #rolling }
GtLudoDie >> roll [
	topFace := (1 to: 6) atRandom.
	self notifyRolled.
	^ topFace
]

{ #category : #'test - support' }
GtLudoDie >> roll: aValue [
	"For testing and playback -- allow the rolled value to be explicitly set."
	self assert: ((1 to: 6) includes: aValue).
	topFace := aValue.
	self notifyRolled.
	^ topFace
]

{ #category : #undo }
GtLudoDie >> rollBack: aValue [
	"Undo  an invalid roll. Do not notify"
	self assert: ((1 to: 6) includes: aValue).
	topFace := aValue.
	^ topFace
]

{ #category : #accessing }
GtLudoDie >> topFace [
	^ topFace
]
