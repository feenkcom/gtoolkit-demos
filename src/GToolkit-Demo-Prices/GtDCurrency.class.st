Class {
	#name : #GtDCurrency,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classVars : [
		'Currencies'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #accessing }
GtDCurrency class >> currencies [
	^ Currencies ifNil: [ Currencies := Dictionary new ]
]

{ #category : #accessing }
GtDCurrency class >> gtEUR [
	^ self currencies at: #EUR ifAbsentPut: [ self new name: #EUR ]
]

{ #category : #accessing }
GtDCurrency class >> gtUSD [
	^ self currencies at: #USD ifAbsentPut: [ self new name: #USD ]
]

{ #category : #accessing }
GtDCurrency class >> reset [
	Currencies := nil
]

{ #category : #accessing }
GtDCurrency >> name [
	^ name
]

{ #category : #accessing }
GtDCurrency >> name: anObject [
	name := anObject
]

{ #category : #accessing }
GtDCurrency >> printOn: aStream [
aStream nextPutAll: self name
]
