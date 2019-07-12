"
I hold all data relevant for an address
"
Class {
	#name : #GtABAddress,
	#superclass : #GtABDomainObject,
	#instVars : [
		'city',
		'country',
		'telephone'
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
GtABAddress >> gtGtSpotterForPeopleFor: aStep [
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

{ #category : #searching }
GtABAddress >> gtSpotterForPeopleFor: aStep [
	<spotterOrder: 10>
	
	(aStep hasPreviousNavigationFromClass: GtABAddressBook ) ifFalse: [ ^ self  ].
	
	^ aStep listProcessor 
		title: 'People';
		itemName: [ :contact | contact fullName ];
		allCandidates: [ 
			aStep previousStep origin contactsWithAddress: self ];
		candidatesLimit: 10;
		matchSubstrings
]

{ #category : #ui }
GtABAddress >> gtSpotterPreviewIn: aComposite [
	<spotterPreview: 10>
	
	aComposite table
		title: 'Preview';
		display: [ :anObject |
			{ 
				'city' -> self city.
				'country' -> self country.
				'telephone' -> self telephone fullNumber } ];
		column: 'Detail'
			evaluated: #key
			styled: [ :aBrick | aBrick textPosition: #rightCenter; margin: #(0 15 0 0); textColor: Color lightGray; height: 30 ];
		column: 'Value'
			evaluated: #value
			styled: [ :aBrick | aBrick margin: #(0 0 0 15); height: 30 ];
		entity: self.
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

{ #category : #accessing }
GtABAddress >> telephone [
	^ telephone
]

{ #category : #accessing }
GtABAddress >> telephone: anObject [
	telephone := anObject
]
