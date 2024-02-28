"
I represent a currency for a kind of Money.

I am a clone of GtDCurrency, but without any reference to Price classes, so that I can be used for a hands-on tutorial.
"
Class {
	#name : #GtTCurrency,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classVars : [
		'Currencies'
	],
	#category : #'GToolkit-Tutorial-Prices-Model'
}

{ #category : #accessing }
GtTCurrency class >> currencies [
	^ Currencies ifNil: [ Currencies := Dictionary new ]
]

{ #category : #accessing }
GtTCurrency class >> euros [
	^ self currencies at: #EUR ifAbsentPut: [ self new name: #EUR ]
]

{ #category : #accessing }
GtTCurrency class >> reset [
	Currencies := nil
]

{ #category : #accessing }
GtTCurrency class >> usd [
	^ self currencies at: #USD ifAbsentPut: [ self new name: #USD ]
]

{ #category : #accessing }
GtTCurrency >> name [
	^ name
]

{ #category : #accessing }
GtTCurrency >> name: anObject [
	name := anObject
]
