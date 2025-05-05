Class {
	#name : #GtABAddressBookContactMergeExample,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-AddressBook-Examples'
}

{ #category : #'examples - telephone' }
GtABAddressBookContactMergeExample >> bostomTelephoneNumber [
	<gtExample>
	<return: #GtABTelephone>
	| telephone |
	telephone := GtABTelephone new
			prefix: '+1';
			number: '617-222-2334'.

	self assert: telephone prefix equals: '+1'.
	self assert: telephone number equals: '617-222-2334'.
	self assert: telephone fullNumber equals: '+1-617-222-2334'.

	^ telephone
]

{ #category : #'examples - addresses' }
GtABAddressBookContactMergeExample >> bostonAddress [
	<gtExample>
	<return: #GtABAddress>
	| address |
	address := GtABAddress new
			city: 'Boston';
			country: 'USA'.

	self assert: address city equals: 'Boston'.
	self assert: address country equals: 'USA'.
	self assert: address gtDisplayString equals: 'Boston, USA'.

	^ address
]

{ #category : #'examples - contacts' }
GtABAddressBookContactMergeExample >> brianKentContactWithBostonAddress [
	<gtExample>
	<return: #GtABContact>
	| contact |
	contact := GtABAddressBookExample new basicBrianKentContact
			addTelephone: self bostomTelephoneNumber;
			addAddress: self bostonAddress.

	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #'examples - can merge' }
GtABAddressBookContactMergeExample >> canMergeContactWithNoAddressesTelefonesAndNotes [
	<gtExample>
	<return: #GtABContact>
	| mainContact secondContact |
	mainContact := GtABAddressBookExample new basicBrianKentContact.
	secondContact := GtABAddressBookExample new basicBrianKentContact.

	self assert: (mainContact canMerge: secondContact).

	^ mainContact
]

{ #category : #'examples - can merge' }
GtABAddressBookContactMergeExample >> canMergeContactWithSameAddressAndTelephone [
	<gtExample>
	<return: #GtABContact>
	| mainContact secondContact |
	mainContact := GtABAddressBookExample new brianKentContact.
	secondContact := GtABAddressBookExample new brianKentContact.

	self assert: (mainContact canMerge: secondContact).

	^ mainContact
]

{ #category : #'examples - can merge' }
GtABAddressBookContactMergeExample >> canMergeContactWithTwoDifferentAddressesAndTelephones [
	<gtExample>
	<return: #GtABContact>
	| mainContact contactBoston |
	mainContact := GtABAddressBookExample new brianKentContact.
	contactBoston := self brianKentContactWithBostonAddress.

	self assert: (mainContact canMerge: contactBoston).

	^ mainContact
]

{ #category : #'examples - can merge' }
GtABAddressBookContactMergeExample >> cannotMergeDifferentContacts [
	<gtExample>
	<return: #GtABContact>
	| mainContact secondContact |
	mainContact := GtABAddressBookExample new brianKentContact.
	secondContact := GtABAddressBookExample new johnDoeContact.

	self assert: (mainContact canMerge: secondContact) not.

	^ mainContact
]

{ #category : #'examples - merge' }
GtABAddressBookContactMergeExample >> mergeContactIntoContactWithNoAddressContactWithAddress [
	<gtExample>
	<return: #GtABContact>
	| mainContact secondContact |
	mainContact := GtABAddressBookExample new basicBrianKentContact.
	secondContact := GtABAddressBookExample new brianKentContact.

	mainContact merge: secondContact.	"self assert: mainContact addresses size equals: 1."

	^ mainContact
]

{ #category : #'examples - merge' }
GtABAddressBookContactMergeExample >> mergeContactIntoContactWithNoAddressContactWithTelephone [
	<gtExample>
	<return: #GtABContact>
	| mainContact secondContact |
	mainContact := GtABAddressBookExample new basicBrianKentContact.
	secondContact := GtABAddressBookExample new brianKentContact.

	mainContact merge: secondContact.
	self assert: mainContact telephones size equals: 1.

	^ mainContact
]

{ #category : #'examples - merge' }
GtABAddressBookContactMergeExample >> mergeContactWithNoAddressesTelefonesAndNotes [
	<gtExample>
	<return: #GtABContact>
	| mainContact secondContact |
	mainContact := GtABAddressBookExample new basicBrianKentContact.
	secondContact := GtABAddressBookExample new basicBrianKentContact.

	mainContact merge: secondContact.
	self assert: mainContact addresses size equals: 0.
	self assert: mainContact telephones size equals: 0.
	self assert: mainContact notes size equals: 0.

	^ mainContact
]

{ #category : #'examples - merge' }
GtABAddressBookContactMergeExample >> mergeContactWithSameAddress [
	<gtExample>
	<return: #GtABContact>
	| mainContact secondContact |
	mainContact := GtABAddressBookExample new brianKentContact.
	secondContact := GtABAddressBookExample new brianKentContact.

	mainContact merge: secondContact.
	self assert: mainContact addresses size equals: 1.
	self assert: mainContact telephones size equals: 1.
	self assert: mainContact notes size equals: 0.

	^ mainContact
]

{ #category : #'examples - merge' }
GtABAddressBookContactMergeExample >> mergeContactsWithCommonAndDifferentAddresses [
	<gtExample>
	<return: #GtABContact>
	| bostonAddress miamiAddress mainContact secondContact |
	bostonAddress := self bostonAddress.
	miamiAddress := self miamiAddress.

	mainContact := GtABAddressBookExample new brianKentContact
			addAddress: bostonAddress.
	secondContact := GtABAddressBookExample new brianKentContact
			addAddress: miamiAddress.

	mainContact merge: secondContact.	"self assert: mainContact addresses size equals: 3."

	^ mainContact
]

{ #category : #'examples - merge' }
GtABAddressBookContactMergeExample >> mergeContactsWithDifferentAddressesAndTelephones [
	<gtExample>
	<return: #GtABContact>
	| mainContact contactBoston |
	mainContact := GtABAddressBookExample new brianKentContact.
	contactBoston := self brianKentContactWithBostonAddress.

	mainContact merge: contactBoston.	"self assert: mainContact addresses size equals: 2."
	self assert: mainContact telephones size equals: 2.
	self assert: mainContact notes size equals: 0.

	^ mainContact
]

{ #category : #'examples - addresses' }
GtABAddressBookContactMergeExample >> miamiAddress [
	<gtExample>
	<return: #GtABAddress>
	| address |
	address := GtABAddress new
			city: 'Miami';
			country: 'USA'.

	self assert: address city equals: 'Miami'.
	self assert: address country equals: 'USA'.
	self assert: address gtDisplayString equals: 'Miami, USA'.

	^ address
]
