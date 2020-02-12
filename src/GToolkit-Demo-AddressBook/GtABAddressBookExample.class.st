"
Address books are instances of the class ${class:GtABAddressBook}$.
[[[ 
	GtABAddressBook new
		label: 'My contacts'.
]]]

Contacts are then instances of ${class:GtABContact}$. They can have several properties, like name, address, description.
${example:GtABAddressBookExample>>#janeDoeContact}$

This contact will be dispayed then in the user interface as follows:
${example:GtABAddressBookExample>>#johnDoeContact|show=#gtViewPreviewOn:|noCode}$

Contacts can be added using the ${method:GtABAddressBook>>#addContact:}$
${example:GtABAddressBookExample>>#myContactsAddressBook}$

The class ${class:GtABCartoonAddressBookExample}$ contains an example of a larger address book.
${example:GtABCartoonAddressBookExample>>#cartoonAddressBook}$





"
Class {
	#name : #GtABAddressBookExample,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-AddressBook-Examples'
}

{ #category : #'examples ' }
GtABAddressBookExample >> addressTelephone [
	<gtExample>
	| telephone |
	telephone := GtABTelephone new 
		prefix: '41'; 
		number: '074574363'.
	
	self assert: telephone prefix equals: '41'.
	self assert: telephone number equals: '074574363'.
	self assert: telephone fullNumber equals: '+41-074574363'.
	
	^ telephone
]

{ #category : #'examples ' }
GtABAddressBookExample >> contactAddress [
	<gtExample>
	| address |
	address := GtABAddress new
		city: 'Bern';
		country: 'Switzerland';
		telephone: self addressTelephone.

	self assert: address city equals: 'Bern'.
	self assert: address country equals: 'Switzerland'.
	self assert: address telephone notNil.
	
	^ address
]

{ #category : #'as yet unclassified' }
GtABAddressBookExample >> contactNote [
	<gtExample>
	| note |
	note := GtABContactNote new
		title: 'Reminder';
		content: 'Answers phone Monday-Friday from 8:00 to 16:00' asRopedText.
	
	self assert: note title equals: 'Reminder'.
	self assert: note content size equals: 46.
	
	^ note.
]

{ #category : #'as yet unclassified' }
GtABAddressBookExample >> contactsAddressBookWithCategories [
	<gtExample>
	| addressBook familyCategory acquaintancesCategory friendsCategory coworkersCategory |
	
	friendsCategory := GtABCategory new
		label: 'Friends';
		addContact: (GtABContact new
			firstName: 'James';
			lastName: 'Poe';
			address: self contactAddress).
	coworkersCategory := GtABCategory new
		label: 'Coworkers';
		addContact: (GtABContact new
			firstName: 'David';
			lastName: 'Smith';
			address: self contactAddress).
	acquaintancesCategory := GtABCategory new
		label: 'Acquaintances';
		addContact: (GtABContact new
			firstName: 'Brian';
			lastName: 'Kent';
			address: self contactAddress);
		addSubcategories: { friendsCategory. coworkersCategory }.
	familyCategory := GtABCategory new
		label: 'Family';
		addContacts: { self janeDoeContact. self johnDoeContact }.
		
	addressBook := GtABAddressBook new
		label: 'My contacts'.
	addressBook addCategories: { familyCategory. acquaintancesCategory }.
	
	self assert: familyCategory label equals: 'Family'.
	self assert: friendsCategory contacts size equals: 1.
	self assert: coworkersCategory label equals: 'Coworkers'.
	self assert: acquaintancesCategory label size equals: 13.
	self assert: addressBook categories size equals: 2.
	
	^ addressBook. 
]

{ #category : #'examples ' }
GtABAddressBookExample >> janeDoeContact [
	<gtExample>
	| contact |
	contact := GtABContact new
		firstName: 'Jane';
		lastName: 'Doe';
		description: GtABContact loremIpsum;
		avatar: GtABContact janeDoeAvatar;
		address: self contactAddress;
		addNotes: { self contactNote }.

	self assert: contact firstName equals: 'Jane'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: GtABContact loremIpsum.
	self assert: contact address notNil.

	^ contact
]

{ #category : #'examples ' }
GtABAddressBookExample >> johnDoeContact [
	<gtExample>
	| contact |
	contact := GtABContact new
		firstName: 'John';
		lastName: 'Doe';
		description: GtABContact loremIpsum;
		avatar: GtABContact johnDoeAvatar;
		address: self contactAddress;
		addNotes: { self contactNote }.
	
	self assert: contact firstName equals: 'John'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: GtABContact loremIpsum.
	self assert: contact address notNil.

	^ contact
]

{ #category : #'examples ' }
GtABAddressBookExample >> myContactsAddressBook [
	<gtExample>
	| addressBook |
	addressBook := GtABAddressBook new
		label: 'My contacts'.
	addressBook addContact: self johnDoeContact.
	addressBook addContact: self janeDoeContact.
	
	self assert: addressBook contacts size equals: 2.
	self assert: (addressBook includesContactWithName: 'John*').
	self assert: (addressBook includesContactWithName: 'Jane*').
	
	^ addressBook
]
