"
I am a square on the Ludo Board.

There are some 40 squares for playing, but there are also some special squares to hold the tokens that are in the #start or #goal states.
"
Class {
	#name : #GtLudoSquare,
	#superclass : #Object,
	#instVars : [
		'token',
		'announcer'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #announcements }
GtLudoSquare >> announcer [
	^ announcer
]

{ #category : #initialization }
GtLudoSquare >> clear [
	GtLudoToken blank goToSquare: self
]

{ #category : #initialization }
GtLudoSquare >> initialize [
	super initialize.
	announcer := Announcer new.
	self clear
]

{ #category : #accessing }
GtLudoSquare >> isEmpty [
	^  self token isBlank
]

{ #category : #announcements }
GtLudoSquare >> notifyUpdated [
	self announcer announce: GtLudoSquareUpdated new
]

{ #category : #printing }
GtLudoSquare >> printOn: aStream [
	aStream nextPutAll: self token name
]

{ #category : #accessing }
GtLudoSquare >> token [
	^ token
]

{ #category : #accessing }
GtLudoSquare >> token: aLudoToken [
	self assert: aLudoToken square equals: self.
	token := aLudoToken.
	self notifyUpdated
]
