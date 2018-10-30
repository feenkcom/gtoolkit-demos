"
I model an entry in an address book
"
Class {
	#name : #GtABContact,
	#superclass : #GtABDomainObject,
	#instVars : [
		'address',
		'firstName',
		'lastName',
		'avatar',
		'description'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #'instance-creation' }
GtABContact class >> first: first last: last [
	^self new 
		firstName: first;
		lastName: last;
		yourself
]

{ #category : #accessing }
GtABContact class >> fromPetit: aPPXmlElement [
	|dict|
	dict := Dictionary newFrom: (aPPXmlElement elements collect: [ :each | each elements isEmpty
		ifTrue: [ each name localName asSymbol -> each children first data ]
		ifFalse: [ each name localName asSymbol -> each ] ]).
	^ self new
		firstName: (dict at: #firstname ifAbsent: ['Unknown']);
		lastName: (dict at: #lastname ifAbsent: ['Unknown']);
		avatar: (PNGReadWriter formFromFileNamed: ('data/icons/',(dict at: #avatar ifAbsent: [nil])));
		description: (dict at: #description ifAbsent: ['Unknown']);
		address: (GtABAddress new
			city: (dict at: #city ifAbsent: ['Gotham']);
			country: (dict at: #country ifAbsent: ['Narnia']);
			telephone: (GtABTelephone fromPetit: (dict at: #telephone)))
]

{ #category : #accessing }
GtABContact class >> fromXML: aPPXmlElement [
	|dict|
	dict := Dictionary newFrom: (aPPXmlElement elements collect: [ :each | each elements isEmpty
		ifTrue: [ each name asSymbol -> each nodes first asString ]
		ifFalse: [ each name asSymbol -> each ] ]).
	^ self new
		firstName: (dict at: #firstname ifAbsent: ['Unknown']);
		lastName: (dict at: #lastname ifAbsent: ['Unknown']);
		avatar: (PNGReadWriter formFromFileNamed: ('data/icons/',(dict at: #avatar ifAbsent: [nil])));
		description: (dict at: #description ifAbsent: ['Unknown']);
		address: (GtABAddress new
			city: (dict at: #city ifAbsent: ['Gotham']);
			country: (dict at: #country ifAbsent: ['Narnia']);
			telephone: (GtABTelephone fromXML: (dict at: #telephone)))
]

{ #category : #accessing }
GtABContact >> address [
	^ address ifNil: [ address := GtABAddress new ]
]

{ #category : #accessing }
GtABContact >> address: anObject [
	address := anObject
]

{ #category : #accessing }
GtABContact >> avatar [
	^ avatar
]

{ #category : #accessing }
GtABContact >> avatar: anObject [
	avatar := anObject
]

{ #category : #accessing }
GtABContact >> description [
	^ description ifNil: [ '' ]
]

{ #category : #accessing }
GtABContact >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtABContact >> firstName [
	^ firstName
]

{ #category : #accessing }
GtABContact >> firstName: aString [
	firstName := aString
]

{ #category : #accessing }
GtABContact >> fullName [
	^firstName, ' ',lastName
]

{ #category : #printing }
GtABContact >> gtContactOn: aComposite [
	<gtInspectorPresentationOrder: 14>
	
	^ aComposite table
		title: [ 'Details' ];
		display: [ 
					{'name' -> self fullName.
					'city' -> self address city.
					'country' -> self address country.
					'telephone' -> self address telephone fullNumber } ];
		column: 'Detail' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
		
]

{ #category : #printing }
GtABContact >> gtPreviewOn: aComposite [
	<gtInspectorPresentationOrder: 11>
	
	^ aComposite morph 
		title: 'Preview';
		display: [ GtABPreviewMorph new contact: self ]
		
]

{ #category : #accessing }
GtABContact >> icon [
	^ self avatar scaledToSize: 24@24
]

{ #category : #accessing }
GtABContact >> lastName [
	^ lastName
]

{ #category : #accessing }
GtABContact >> lastName: aString [
	lastName := aString
]

{ #category : #accessing }
GtABContact >> previewMorph [
	^ GtABPreviewMorph new
		hSpaceFill;
		vSpaceFill;
		contact: self
]

{ #category : #printing }
GtABContact >> printOn: aStream [
	super printOn: aStream.
	aStream 
		nextPut: $(;
		nextPutAll: self fullName;
		nextPut: $)
]

{ #category : #printing }
GtABContact >> spotterPreviewIn: aComposite [
	<spotterPreview: 10>
	
	aComposite custom: 
		(self previewMorph asBrick
			vSpaceFill;
			hSpaceFill)
]

{ #category : #printing }
GtABContact >> spotterPreviewOldIn: aComposite [
	<spotterPreview: 10>
	
	aComposite table
		title: 'Preview';
		display: [ :anObject |
			{ 
				'name' -> self fullName.
				'city' -> self address city.
				'country' -> self address country.
				'telephone' -> self address telephone fullNumber } ];
		column: 'Detail'
			evaluated: #key
			styled: [ :aBrick | aBrick 
					marginRight: 15; 
					height: 30; 
					textPosition: #rightCenter;  
					textColor: Color lightGray ];
		column: 'Value'
			evaluated: #value
			styled: [ :aBrick | aBrick 
					marginLeft: 15; 
					height: 30 ];
		entity: self.
]

{ #category : #accessing }
GtABContact >> telephone: aTelephoneNumber [

	self address telephone: aTelephoneNumber
]
