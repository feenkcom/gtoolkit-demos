"
I am an ordinary 6-sided die with a graphical display.


```
GtLudoDie new inspect
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

{ #category : #accessing }
GtLudoDie >> topFace [
	^ topFace
]
