"
I model a category in the addressbook.
"
Class {
	#name : #GtABCategory,
	#superclass : #GtABHierarchyObject,
	#instVars : [
		'label',
		'contacts',
		'subcategories'
	],
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #adding }
GtABCategory >> addContact: aContact [
	self contacts addLast: aContact.
]

{ #category : #adding }
GtABCategory >> addContacts: aCollection [
	self contacts addAll: aCollection.
]

{ #category : #adding }
GtABCategory >> addSubcategories: aCollection [
	self subcategories addAll: aCollection.
]

{ #category : #adding }
GtABCategory >> addSubcategory: aCategory [
	self subcategories addLast: aCategory.
]

{ #category : #accessing }
GtABCategory >> allContacts [
	"Return the contacts from this category and from all subcategories"
	| allSubcontacts |
	allSubcontacts := OrderedCollection new.
	self subcategories do: [ :each |
		allSubcontacts addAll: each allContacts ].
	allSubcontacts addAll: self contacts.
	
	^ allSubcontacts.
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
	isCategory := true.
]

{ #category : #accessing }
GtABCategory >> label [
	^ label.
]

{ #category : #accessing }
GtABCategory >> label: anObject [
	label := anObject.
]

{ #category : #printing }
GtABCategory >> printOn: aStream [

	aStream nextPutAll: self label
]

{ #category : #accessing }
GtABCategory >> subcategories [
	^ subcategories
]
