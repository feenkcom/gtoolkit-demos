"
I model a category in the addressbook.


"
Class {
	#name : #GtABCategory,
	#superclass : #Object,
	#instVars : [
		'label',
		'contacts',
		'subcategories',
		'addressBook'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #adding }
GtABCategory >> addContact: aContact [
	self contacts addLast: aContact.
]

{ #category : #adding }
GtABCategory >> addContacts: aCollectionOfContacts [
	aCollectionOfContacts do: [ :aContact |
		self addContact: aContact ]
]

{ #category : #adding }
GtABCategory >> addSubcategories: aCollectionOfCategories [
	aCollectionOfCategories do: [ :aCategory |
		self addSubcategory: aCategory ]
]

{ #category : #adding }
GtABCategory >> addSubcategory: aSubCategory [
	self assert: [ aSubCategory isNotNil ].
	self assert: [ aSubCategory addressBook isNil ].
	
	self subcategories addLast: aSubCategory.
	self addressBookDo: [ :anAddressBook |
		aSubCategory addressBook: anAddressBook ]
]

{ #category : #accessing }
GtABCategory >> addressBook [
	^ addressBook
]

{ #category : #accessing }
GtABCategory >> addressBook: anAddressBook [
	self assert: [ 
		anAddressBook notNil and: [ 
			addressBook isNil ] ].
	 
	addressBook := anAddressBook.
	self subcategories do: [ :aSubCategory |
		aSubCategory addressBook: anAddressBook ]
]

{ #category : #accessing }
GtABCategory >> addressBookDo: aBlock [ 	
	self addressBook ifNotNil: [ :anAddressBook |
		aBlock value: anAddressBook ]
]

{ #category : #accessing }
GtABCategory >> allContacts [
	"Return the contacts from this category and from all subcategories"
	| allSubcontacts |
	allSubcontacts := OrderedCollection new.
	self allContactsDo: [ :aContact |
		allSubcontacts add: aContact ].
	^ allSubcontacts
]

{ #category : #accessing }
GtABCategory >> allContactsDo: aBlock [
	self contacts do: [ :aContact | 
		aBlock value: aContact ].
	self subcategories do: [ :aSubCategory |
		aSubCategory allContactsDo: aBlock ]
	
]

{ #category : #traversing }
GtABCategory >> allSubcategoriesDo: aBlock [ 
	self subcategories do: [ :aSubCategory |
		aBlock value: aSubCategory.
		aSubCategory allSubcategoriesDo: aBlock ]
]

{ #category : #accessing }
GtABCategory >> contacts [
	"Return the contacts from this category only"
	^ contacts.
]

{ #category : #initialization }
GtABCategory >> initialize [
	contacts := OrderedCollection new.
	subcategories := OrderedCollection new.
]

{ #category : #testing }
GtABCategory >> isCategory [
	^ true
]

{ #category : #accessing }
GtABCategory >> label [
	^ label.
]

{ #category : #accessing }
GtABCategory >> label: aString [
	label := aString.
]

{ #category : #printing }
GtABCategory >> printOn: aStream [

	aStream nextPutAll: self label
]

{ #category : #accessing }
GtABCategory >> subcategories [
	^ subcategories
]
