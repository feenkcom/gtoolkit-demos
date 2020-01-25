"
I model an address book that can hold a list of contacts.
"
Class {
	#name : #GtABAddressBook,
	#superclass : #Object,
	#instVars : [
		'label',
		'contacts'
	],
	#classInstVars : [
		'default'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #browsing }
GtABAddressBook class >> contactsAddressesSearch [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter 
			on: GtABAddressBook default
			withProcessors: {
				GtABAddressBook>>#gtSpotterForAddressesFor:.
				GtABAddress>>#gtSpotterForPeopleFor: });
		openCenteredInWorld
]

{ #category : #browsing }
GtABAddressBook class >> contactsBrowser [

	GTInspector new
  		filterByMethods: {GtABAddressBook>>#gtInspectorContactsOn: . GtABContact>>#gtInspectorContactOn:};
  		openOn: GtABAddressBook default
]

{ #category : #browsing }
GtABAddressBook class >> contactsSearch [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter on: GtABAddressBook default);
		openCenteredInWorld
]

{ #category : #accessing }
GtABAddressBook class >> default [
	^ default ifNil: [ 
		default := self new
			label: 'My contacts'.
		self loadDefaultDataIn: default.
		default ]
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomInspector [

	GTInspector new
  		filterByMethods: {GtABAddressBook>>#gtInspectorContactsOn: . GtABContact>>#gtInspectorContactOn:};
  		openOn: GtABAddressBook default
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomSpotter [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter
			withProcessors: {
				GTSpotter>>#spotterAddressBookFor:.
				GtABAddressBook>>#gtSpotterForAddressesFor:.
				GtABAddressBook>>#gtSpotterForPeopleFor:.
				GtABAddressBook>>#gtSpotterForTelephonesFor:.
				GtABAddress>>#gtSpotterForPeopleFor:.
				GtABTelephone>>#spotterForContactsFor: });
		openCenteredInWorld
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomSpotterOnAddressBook [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter on: GtABAddressBook default);
		openCenteredInWorld
]

{ #category : #examples }
GtABAddressBook class >> exampleCustomSpotterOnAddressBookContactsOnly [

	GTSpotterMorph new
		extent: 400@500;
		spotterModel: (GTSpotter 
			on: GtABAddressBook default
			withProcessors: {
				GtABAddressBook>>#gtSpotterForPeopleFor: });
		openCenteredInWorld
]

{ #category : #'class initialization' }
GtABAddressBook class >> initialize [

	"ABAddressBook default loadFromFile: 'data/cartoon.adr'."
	self reset
]

{ #category : #private }
GtABAddressBook class >> loadDefaultDataIn: anAddressBook [

	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Andrei';
		lastName: 'Chis';
		description: self loremIpsum;
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new prefix: '41-7'; number: '12345678'))).
				
	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Aliaksei';
		lastName: 'Syrel';
		description: self loremIpsum;
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new  prefix: '41-7'; number: '11223344'))).
				
	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Tudor';
		lastName: 'Girba';
		description: self loremIpsum;
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new prefix: '41-7'; number: '11224455'))).
				
				
	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Juraj';
		lastName: 'Kubelka';
		description: self loremIpsum;
		address: (
			GtABAddress new
				city: 'Santiago';
				country: 'Chile';
				telephone: (GtABTelephone  new prefix: '56-5'; number: '54321345'))).
				
	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Stefan';
		lastName: 'Reichhart';
		description: self loremIpsum;
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new prefix: '33-5'; number: '55326449'))).
				
	anAddressBook contacts add: (
	GtABContact new
		firstName: 'John';
		lastName: 'Doe';
		description: self loremIpsum;
		address: (
			GtABAddress new
				city: 'Lille';
				country: 'France';
				telephone: (GtABTelephone  new prefix: '33-5'; number: '32455555'))).
			
		
]

{ #category : #accessing }
GtABAddressBook class >> reset [
	default := nil
]

{ #category : #adding }
GtABAddressBook >> addContact: aContact [
	self contacts addLast: aContact
]

{ #category : #adding }
GtABAddressBook >> addContacts: aList [
	self contacts addAll: aList
]

{ #category : #accessing }
GtABAddressBook >> contacts [
	^ contacts ifNil: [ contacts := LinkedList new ]
]

{ #category : #accessing }
GtABAddressBook >> contacts: anObject [
	contacts := anObject
]

{ #category : #filtering }
GtABAddressBook >> contactsWithAddress: anAddress [
	^self contacts select: [ :each | each address = anAddress ] 
]

{ #category : #filtering }
GtABAddressBook >> contactsWithTelephone: aNumber [
	^self contacts select: [ :each | each address telephone number = aNumber ] 
]

{ #category : #ui }
GtABAddressBook >> gtGtSpotterForAddressesFor: aStep [
	<gtSearch>
	^ aStep listProcessor
		priority: 10;
		title: 'Addresses' translated;
		allCandidates: [ (self contacts collect: #address as: Set) asOrderedCollection ];
		candidatesLimit: 7;
		itemName: [ :each | each city , ', ' , each country ];
		matchSubstrings
]

{ #category : #ui }
GtABAddressBook >> gtGtSpotterForPeopleFor: aStep [
	<gtSearch>
	^ aStep listProcessor
		priority: 5;
		title: 'People';
		allCandidates: [ self contacts ];
		filter: GTFilterSubstrings;
		candidatesLimit: 7;
		itemName:
				[ :aContact | aContact lastName asUppercase , ', ' , aContact firstName ]
]

{ #category : #ui }
GtABAddressBook >> gtGtSpotterForTelephonesFor: aStep [
	<gtSearch>
	^ aStep listProcessor
		priority: 15;
		title: 'Telephones' translated;
		allCandidates: [ self contacts collect: [ :aContact | aContact address telephone ] ];
		matchSubstrings
]

{ #category : #ui }
GtABAddressBook >> gtInspectorContactsOn: aComposite [
	<gtInspectorPresentationOrder: 5>
	aComposite table
		title: 'Contacts' translated;
		display: [ self contacts ];
		column: 'Name' evaluated: [ :aContact | aContact fullName ];
		column: 'Telephone' evaluated: [ :aContact | 
			aContact address telephone ]
]

{ #category : #searching }
GtABAddressBook >> gtSpotterForAddressesFor: aStep [
	<spotterOrder: 10>
	^ aStep listProcessor 
		title: 'Addresses' translated;
		allCandidates: [ (self contacts collect: #address as: Set) asOrderedCollection ];
		candidatesLimit: 7;
		itemName: [:each | each city, ', ', each country];
		matchSubstrings
]

{ #category : #searching }
GtABAddressBook >> gtSpotterForPeopleFor: aStep [
	<spotterOrder: 5>
	^ aStep listProcessor 
		title: 'People';
		allCandidates: [ self contacts ];
		filter: GTFilterSubstrings;
		candidatesLimit: 7;
		itemName: [ :aContact | aContact lastName asUppercase, ', ' , aContact firstName ]
]

{ #category : #searching }
GtABAddressBook >> gtSpotterForTelephonesFor: aStep [
	<spotterOrder: 15>
	^ aStep listProcessor 
		title: 'Telephones' translated;
		allCandidates: [ self contacts collect: [ :aContact | aContact address telephone ] ];
		matchSubstrings
]

{ #category : #ui }
GtABAddressBook >> gtSpotterPreviewIn: aComposite [
	<spotterPreview: 10>
	aComposite list
		title: 'People' translated;
		display: #yourself;
		format: [ :contact | GTSpotterItemBrick new text: contact fullName; disable ];
		entity: self contacts
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsCardsListOn: aView [
	<gtView>
	^ aView list 
		title: 'Cards' translated;
		priority: 8;
		items: [ self contacts ];
		itemStencil: [ :aContact |
			|container iconElement aText textElement|
			container := BlElement new
				layout: BlFlowLayout horizontal;
				constraintsDo: [ :c | 
					c horizontal matchParent.
					c vertical fitContent.
					c margin: (BlInsets all: 10)].

			aContact avatar ifNotNil: [ 
				iconElement := BlElement new
					size: (124@124);
					background: (aContact avatar scaledToSize: 124@124).
				container
					addChild: iconElement ].
	
			aText := aContact fullName asRopedText
				fontSize: 40.
			textElement := BlTextElement new
					constraintsDo: [ :c |
						c flow vertical alignCenter.
						c padding: (BlInsets all: 10) ];
				text: aText.
	
			container 
				addChild: textElement.
			container ]
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsIconsCircularOn: aView [
	<gtView>
	self contacts size > 2 ifFalse: [ ^ aView ].
	^ aView mondrian
		title: 'Circular' translated;
		priority: 50;
		painting: [ :view |
			view nodes
				shape: [ :aContact | 
					(aContact avatar scaledToSize: 124@124) asElement ];
				with: self contacts.
			view layout circle
				radius: 200 ]
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsOn: aView [
	<gtView>
	^ aView columnedList 
		title: 'Contacts' translated;
		priority: 5;
		items: [ self contacts ];
		column: 'Name' 
			format: [ :aContact | aContact fullName ];
		column: 'Telephone' 
			format: [ :aContact | aContact address telephone ]
]

{ #category : #testing }
GtABAddressBook >> includesContactWithName: aPattern [
	^ self contacts anySatisfy: [ :aContact | 
		aPattern match: aContact fullName ]
]

{ #category : #accessing }
GtABAddressBook >> label [
	^ label ifNil: [ '' ]
]

{ #category : #accessing }
GtABAddressBook >> label: anObject [
	label := anObject
]

{ #category : #printing }
GtABAddressBook >> printOn: aStream [

	aStream nextPutAll: self label
]
