"
I model a simple telefon number


"
Class {
	#name : #GtABTelephone,
	#superclass : #GtABContactField,
	#instVars : [
		'prefix',
		'number'
	],
	#category : 'GToolkit-Demo-AddressBook-Models'
}

{ #category : #accessing }
GtABTelephone class >> fromPetit: aPPXmlElement [
	|dict|
	dict := Dictionary newFrom: (aPPXmlElement elements collect: [ :each | each name localName asSymbol -> each children first data]).
	^ self new
		prefix: (dict at: #prefix ifAbsent: ['000']);
		number: (dict at: #number ifAbsent: ['00000'])
]

{ #category : #accessing }
GtABTelephone class >> fromXML: aPPXmlElement [
	|dict|
	dict := Dictionary newFrom: (aPPXmlElement elements collect: [ :each | each name asSymbol -> each nodes first asString]).
	^ self new
		prefix: (dict at: #prefix ifAbsent: ['000']);
		number: (dict at: #number ifAbsent: ['00000'])
]

{ #category : #comparing }
GtABTelephone >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^false].
	^anObject number = number and: [ anObject prefix = prefix ]
]

{ #category : #accessing }
GtABTelephone >> fullNumber [

	^ prefix,'-',number
]

{ #category : #ui }
GtABTelephone >> gtSpotterForContactsFor: aStep [
	<gtSearch>
	(aStep hasPreviousNavigationFromClass: GtABAddressBook)
		ifFalse: [ ^ self ].
	^ aStep listProcessor
		priority: 10;
		title: 'Contacts';
		candidatesLimit: Float infinity;
		allCandidates: [ aStep previousStep origin contactsWithTelephone: self number ];
		matchSubstring
]

{ #category : #comparing }
GtABTelephone >> hash [
	^number hash bitXor: prefix hash
]

{ #category : #accessing }
GtABTelephone >> number [
	^ number
]

{ #category : #accessing }
GtABTelephone >> number: anObject [
	number := anObject
]

{ #category : #accessing }
GtABTelephone >> prefix [
	^ prefix
]

{ #category : #accessing }
GtABTelephone >> prefix: anObject [
	prefix := anObject
]

{ #category : #printing }
GtABTelephone >> printOn: aStream [
	aStream nextPutAll: self fullNumber
]
