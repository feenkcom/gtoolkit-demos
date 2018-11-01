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

{ #category : #ui }
GtABContact >> gtInspectorContactOn: aComposite [
	<gtInspectorPresentationOrder: 5>
	
	^ aComposite table
		title: 'Details' translated;
		display: [ {
			'Name' -> self fullName.
			'City' -> self address city.
			'Country' -> self address country.
			'Telephone' -> self address telephone fullNumber } ];
		column: 'Detail' evaluated: #key;
		column: 'Value' evaluated: #value;
		send: #value
]

{ #category : #ui }
GtABContact >> gtInspectorPreviewOn: aComposite [
	<gtInspectorPresentationOrder: 6>
	
	^ aComposite morph 
		title: 'Preview' translated;
		display: [ GtABPreviewMorph new contact: self ]
		
]

{ #category : #ui }
GtABContact >> gtSpotterPreviewIn: aComposite [
	<spotterPreview: 10>
	| previewMorph |
	previewMorph := GtABPreviewMorph new
		hSpaceFill;
		vSpaceFill;
		contact: self.
	aComposite custom: previewMorph asBrick
		vSpaceFill;
		hSpaceFill
]

{ #category : #ui }
GtABContact >> gtViewContactDetailsOn: aView [
	<gtView>
	^ aView explicit 
		title: 'Details' translated;
		priority: 5;
		stencil: [
			| list |
			list := BrColumnedList new display: {
				'Name' -> self fullName.
				'City' -> self address city.
				'Country' -> self address country.
				'Telephone' -> self address telephone fullNumber }.
			list addEventHandler: (GtInspectorListToSelectHandler new).
			list column 
				title: 'Detail';
				stencil: [ :assoc | BrListLabelStencil matchParent: assoc key ].
			list column 
				title: 'Value';
				stencil: [ :assoc | BrListLabelStencil matchParent: assoc value ].
			list ]
]

{ #category : #ui }
GtABContact >> gtViewPreviewOn: aView [
	<gtView>
	^ aView explicit
		title: 'Preview' translated;
		priority: 6;
		stencil: [
			"Use the old morph for now"
			((GtABPreviewMorph new contact: self) extent: 500@800)
				imageForm asElement asPannableElement ]
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

{ #category : #accessing }
GtABContact >> telephone: aTelephoneNumber [

	self address telephone: aTelephoneNumber
]
