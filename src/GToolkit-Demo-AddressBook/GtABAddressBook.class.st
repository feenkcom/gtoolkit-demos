"
I model an address book that can hold a list of contacts.
"
Class {
	#name : #GtABAddressBook,
	#superclass : #Object,
	#instVars : [
		'label',
		'contacts',
		'categories'
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
		telephone: (GtABTelephone  new prefix: '41-7'; number: '12345678');
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland')).

	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Aliaksei';
		lastName: 'Syrel';
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland';
				telephone: (GtABTelephone  new  prefix: '41-7'; number: '11223344'))).

	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Tudor';
		lastName: 'Girba';
		telephone: (GtABTelephone  new prefix: '41-7'; number: '11224455');
		address: (
			GtABAddress new
				city: 'Bern';
				country: 'Switzerland')).
				
				
	anAddressBook contacts add: (
	GtABContact new
		firstName: 'Juraj';
		lastName: 'Kubelka';
		telephone: (GtABTelephone  new prefix: '56-5'; number: '54321345');
		address: (
			GtABAddress new
				city: 'Santiago';
				country: 'Chile')).
]

{ #category : #accessing }
GtABAddressBook class >> reset [
	default := nil
]

{ #category : #adding }
GtABAddressBook >> addCategories: aCollection [
	self categories addAll: aCollection.
]

{ #category : #adding }
GtABAddressBook >> addCategory: aCategory [
	self categories addLast: aCategory.
]

{ #category : #adding }
GtABAddressBook >> addContact: aContact [
	self contacts addLast: aContact
]

{ #category : #adding }
GtABAddressBook >> addContacts: aList [
	self contacts addAll: aList
]

{ #category : #'as yet unclassified' }
GtABAddressBook >> allContacts [
	" Returns the contacts from all categories and the ones that have no category"
	| allContacts |
	allContacts := OrderedCollection new.
	self categories do: [ :each |
		allContacts addAll: each allContacts ].
	allContacts addAll: self contacts.
	
	^ allContacts.
]

{ #category : #accessing }
GtABAddressBook >> categories [
	^ categories.
]

{ #category : #accessing }
GtABAddressBook >> contacts [
	"Returns the contacts that are not in any category"
	^ contacts
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

{ #category : #'as yet unclassified' }
GtABAddressBook >> gtViewCategoriesTreeWithContactsOn: aView [
	<gtView>

	^ aView tree
		title: 'Contacts Tree' translated;
		items: [ self categories ];
		children: [ :each |
			(each isCategory)
				ifTrue: [ each subcategories, each contacts ]
				ifFalse: [ #() ] ].
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
				with: self allContacts.
			view layout circle
				radius: 200 ]
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsListOn: aView [
	<gtView>
	^ aView list 
		title: 'Contacts' translated;
		priority: 8;
		items: [ self allContacts ];
		itemFormat: [ :aContact |
			aContact fullName asRopedText ].
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsOn: aView [
	<gtView>
	^ aView columnedList 
		title: 'Contacts Avatars' translated;
		priority: 5;
		items: [ self allContacts ];
		column: 'Avatar' do: [ :aColumn | 
			aColumn 
				rowStencil: [ :aContact | aContact avatar asElement asScalableElement size: 32@32];
				noResize ];
		column: 'Name' 
			format: [ :aContact | aContact fullName ];
		column: 'Phone'
			format: [ :aContact | aContact telephone ].
]

{ #category : #testing }
GtABAddressBook >> includesContactWithName: aPattern [
	^ self contacts anySatisfy: [ :aContact | 
		aPattern match: aContact fullName ]
]

{ #category : #initialization }
GtABAddressBook >> initialize [
	contacts := OrderedCollection new.
	categories := OrderedCollection new.
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
