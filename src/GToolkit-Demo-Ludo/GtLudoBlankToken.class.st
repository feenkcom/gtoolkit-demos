"
I am a dummy token with no name (a kind of Null Object), so that squares that do not currently hold a real token do not have to hold nil, and have tio perform nil checks.
"
Class {
	#name : #GtLudoBlankToken,
	#superclass : #GtLudoToken,
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoBlankToken >> blankName [
	^ ' '
]

{ #category : #accessing }
GtLudoBlankToken >> initialize [
	super initialize.
	self name: self blankName
]

{ #category : #accessing }
GtLudoBlankToken >> isBlank [
	^ true
]
