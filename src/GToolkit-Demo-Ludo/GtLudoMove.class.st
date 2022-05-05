Class {
	#name : #GtLudoMove,
	#superclass : #Object,
	#instVars : [
		'token',
		'roll'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #'instance creation' }
GtLudoMove class >> forRoll: aNumber tokenName: aString inGame: aGame [
	^ (self new)
		roll: aNumber;
		token: (aGame tokenNamed: aString);
		yourself
]

{ #category : #accessing }
GtLudoMove >> roll [
	^ roll
]

{ #category : #accessing }
GtLudoMove >> roll: aNumber [
	self assert: ((1 to: 6) includes: aNumber) description: 'Number must be a valid die roll from 1 to 6'.
	roll := aNumber
]

{ #category : #accessing }
GtLudoMove >> token [
	^ token
]

{ #category : #accessing }
GtLudoMove >> token: aToken [
	token := aToken
]
