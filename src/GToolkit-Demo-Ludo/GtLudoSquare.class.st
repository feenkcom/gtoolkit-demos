Class {
	#name : #GtLudoSquare,
	#superclass : #Object,
	#instVars : [
		'token'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #initialization }
GtLudoSquare >> clear [
	self token: GtLudoToken blank
]

{ #category : #initialization }
GtLudoSquare >> initialize [
	self clear
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
	token := aLudoToken
]
