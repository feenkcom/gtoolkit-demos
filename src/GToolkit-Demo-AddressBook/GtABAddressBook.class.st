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

{ #category : #accessing }
GtABAddressBook class >> default [
	^ default ifNil: [ 
		default := self new
			label: 'My contacts'.
		default ]
]

{ #category : #'class initialization' }
GtABAddressBook class >> initialize [

	"ABAddressBook default loadFromFile: 'data/cartoon.adr'."
	self reset
]

{ #category : #accessing }
GtABAddressBook class >> reset [
	default := nil
]

{ #category : #adding }
GtABAddressBook >> addCategories: aCollectionOfCategories [
	aCollectionOfCategories do: [ :aCategory |
		self addCategory: aCategory ]
]

{ #category : #adding }
GtABAddressBook >> addCategory: aCategory [
	self assert: [ aCategory notNil ].
	self assert: [ aCategory addressBook isNil ].
	
	self categories addLast: aCategory.
	aCategory addressBook: self.
]

{ #category : #adding }
GtABAddressBook >> addContact: aContact [
	self contacts addLast: aContact.
]

{ #category : #adding }
GtABAddressBook >> addContacts: aList [
	self contacts addAll: aList
]

{ #category : #adding }
GtABAddressBook >> addOrMergeContact: aContact [
	"Add the given contact or merge it into an existing contact if possible."
	self contacts do: [ :anotherContact |
		(anotherContact canMerge: aContact) ifTrue: [ 
			anotherContact merge: aContact.
			^ self ] ].
	
	"If there was no merge, add the new contact to the address book."
	self addContact: aContact
	
]

{ #category : #accessing }
GtABAddressBook >> allContacts [
	^ self contacts
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
	^self contacts select: [ :aContact | 
		aContact address = anAddress ] 
]

{ #category : #filtering }
GtABAddressBook >> contactsWithTelephone: aNumber [
	^self contacts select: [ :aContact | 
		aContact telephones anySatisfy: [ :aTelephone | 
			aTelephone number = aNumber ] ]
]

{ #category : #ui }
GtABAddressBook >> gtGtSpotterForAddressesFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 10;
		title: 'Addresses' translated;
		items: [ (self contacts collect: #address as: Set) asOrderedCollection ];
		itemName: [ :each | each city , ', ' , each country ];
		filterBySubstring;
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #ui }
GtABAddressBook >> gtGtSpotterForPeopleFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 5;
		title: 'People';
		items: [ self contacts ];
		filterBySubstring;
		itemName: [ :aContact | aContact lastName asUppercase , ', ' , aContact firstName ];
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #ui }
GtABAddressBook >> gtGtSpotterForTelephonesFor: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 15;
		title: 'Telephones' translated;
		items: [ self contacts flatCollect: [ :aContact | aContact telephones ] ];
		filterBySubstring;
		wantsToDisplayOnEmptyQuery: true
]

{ #category : #accessing }
GtABAddressBook >> gtViewCategoriesTreeWithContactsOn: aView [
	<gtView>

	(self categories isEmpty) ifTrue: [^ aView empty].
	^ aView tree
		title: 'Contacts Tree' translated;
		items: [ self categories ];
		children: [ :each |
			(each isCategory)
				ifTrue: [ each subcategories, each contacts ]
				ifFalse: [ #() ] ].
]

{ #category : #accessing }
GtABAddressBook >> gtViewContactsAddressOn: aView [
	<gtView>
	
	(self categories isEmpty) ifTrue: [^ aView empty].
	^ aView columnedTree
		title: 'Contacts Address' translated;
		items: [self categories];
		column: 'Contact' text: [:each | each];
		column: 'City' text: [:each | 
			(each isCategory)
				ifTrue: ['' asRopedText]
				ifFalse: [each address city]];
		column: 'Country' text: [:each |
			(each isCategory)
				ifTrue: ['' asRopedText]
				ifFalse: [each address country]];
		children: [ :each |
			(each isCategory)
				ifTrue: [ each subcategories, each contacts ]
				ifFalse: [ #() ] ].
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsIconsCircularOn: aView [
	<gtView>
	self contacts size > 2 ifFalse: [ ^ aView empty].
	^ aView mondrian
		title: 'Circular' translated;
		priority: 50;
		painting: [ :view |
			view nodes
				stencil: [ :aContact | 
					(aContact avatar scaledToSize: 124@124) asElement ];
				with: self contacts.
			view layout circle
				radius: 200 ]
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsListOn: aView [
	<gtView>
	^ aView list
		title: 'Contacts List' translated;
		priority: 8;
		items: [ self contacts ];
		itemText: [ :aContact | aContact fullName asRopedText ]
]

{ #category : #ui }
GtABAddressBook >> gtViewContactsOn: aView [
	<gtView>
	^ aView columnedList
		title: 'Contacts with details' translated;
		priority: 5;
		items: [ self contacts ];
		column: 'Avatar' 
			icon: [ :aContact | aContact avatar asElement asScalableElement size: 32 @ 32 ]
			width: 75;
		column: 'Name' text: [ :aContact | aContact fullName ];
		column: 'Phone' text: [ :aContact | aContact telephone ]
]

{ #category : #adding }
GtABAddressBook >> importCategories: aCollectionOfCategories [
	aCollectionOfCategories do: [ :aCategory |
		self importCategory: aCategory  ]
]

{ #category : #adding }
GtABAddressBook >> importCategory: aCategory [
	self addCategory: aCategory.
	aCategory allContactsDo: [ :aContact |
		self addContact: aContact ]
]

{ #category : #testing }
GtABAddressBook >> includesContactWithFirstName: aFirstName [
	^ self contacts anySatisfy: [ :aContact | 
		aFirstName = aContact firstName ]
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
