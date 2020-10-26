"
I hold all data relevant for an address
"
Class {
	#name : #GtABAddress,
	#superclass : #GtABDomainObject,
	#instVars : [
		'city',
		'country'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #comparing }
GtABAddress >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ city = anObject city and: [ country = anObject country ]
]

{ #category : #accessing }
GtABAddress >> city [
	^ city
]

{ #category : #accessing }
GtABAddress >> city: anObject [
	city := anObject
]

{ #category : #accessing }
GtABAddress >> country [
	^ country
]

{ #category : #accessing }
GtABAddress >> country: anObject [
	country := anObject
]

{ #category : #ui }
GtABAddress >> gtSpotterForPeopleFor: aStep [
	<gtSearch>
	(aStep hasPreviousNavigationFromClass: GtABAddressBook)
		ifFalse: [ ^ self ].
	^ aStep listProcessor
		priority: 10;
		title: 'People';
		itemName: [ :contact | contact fullName ];
		allCandidates: [ aStep previousStep origin contactsWithAddress: self ];
		candidatesLimit: 10;
		matchSubstrings
]

{ #category : #comparing }
GtABAddress >> hash [

	^ city hash bitXor: country hash
	
]

{ #category : #printing }
GtABAddress >> printOn: aStream [

	aStream nextPutAll: self city.
	aStream nextPutAll: ', '.
	aStream nextPutAll: self country
]
