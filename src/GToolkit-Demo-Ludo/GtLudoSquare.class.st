Class {
	#name : #GtLudoSquare,
	#superclass : #Object,
	#instVars : [
		'token',
		'announcer'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #accessing }
GtLudoSquare >> announcer [
	^ announcer
]

{ #category : #accessing }
GtLudoSquare >> blank [
	^ ' '
]

{ #category : #initialization }
GtLudoSquare >> clear [
	self token: GtLudoToken blank
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

{ #category : #accessing }
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
	token := aLudoToken.
	self notifyUpdated
]
