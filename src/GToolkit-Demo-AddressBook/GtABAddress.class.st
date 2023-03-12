"
I hold all data relevant for an address


"
Class {
	#name : #GtABAddress,
	#superclass : #GtABContactField,
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
	^ self city = anObject city and: [ self country = anObject country ]
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
GtABAddress >> gtSpotterForPeopleFor: aSearch [
	<gtSearch>
	(aSearch hasPreviousNavigationFromClass: GtABAddressBook)
		ifFalse: [ ^ aSearch empty ].
	^ aSearch list
		priority: 10;
		title: 'People';
		itemName: [ :contact | contact fullName ];
		items: [ aSearch previousStep origin contactsWithAddress: self ];
		itemsLimit: 10;
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
