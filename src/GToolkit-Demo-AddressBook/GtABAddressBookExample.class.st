"
Address books are instances of the class {{gtClass:GtABAddressBook}}.
``` 
	GtABAddressBook new
		label: 'My contacts'.
```

Contacts are then instances of {{gtClass:GtABContact}}. They can have several properties, like name, address, description.
{{gtExample:GtABAddressBookExample>>#janeDoeContact}}

This contact will be dispayed then in the user interface as follows:
{{gtExample:GtABAddressBookExample>>#johnDoeContact|previewShow=#gtViewPreviewOn:|noCode}}

Contacts can be added using the {{gtMethod:GtABAddressBook>>#addContact:}}
{{gtExample:GtABAddressBookExample>>#myContactsAddressBook}}


"
Class {
	#name : #GtABAddressBookExample,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-AddressBook-Examples'
}

{ #category : #'examples - categories' }
GtABAddressBookExample >> acquaintancesCategory [
	<gtExample>
	<return: #GtABCategory>
	| category |
	category := GtABCategory new
			label: 'Acquaintances';
			addContact: self brianKentContact;
			addSubcategories: {self friendsCategory.
					self coworkersCategory}.

	self assert: category label equals: 'Acquaintances'.
	self assert: category contacts size equals: 1.
	self assert: category allContacts size equals: 3.
	self assert: category subcategories size equals: 2.

	^ category
]

{ #category : #'examples - search' }
GtABAddressBookExample >> addressBookContainsContactWithJohnFirstName [
	<gtExample>
	<return: #GtABAddressBook>
	| addressBook |
	addressBook := self contactsAddressBookWithCategories.

	self assert: (addressBook includesContactWithFirstName: 'John').

	^ addressBook
]

{ #category : #'examples - search' }
GtABAddressBookExample >> addressBookDoesNotContainContactWithMartinFirstName [
	<gtExample>
	<return: #GtABAddressBook>
	| addressBook |
	addressBook := self contactsAddressBookWithCategories.

	self assert: (addressBook includesContactWithFirstName: 'Martin') not.

	^ addressBook
]

{ #category : #'examples - contacts' }
GtABAddressBookExample >> basicBrianKentContact [
	<gtExample>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Brian';
			lastName: 'Kent';
			avatar: GtABContact johnDoeAvatar;
			description: (String loremIpsum: 200).

	self assert: contact firstName equals: 'Brian'.
	self assert: contact lastName equals: 'Kent'.
	self assert: contact fullName equals: 'Brian Kent'.
	self assert: contact description size equals: 200.
	self assert: contact addresses size equals: 0.
	self assert: contact telephones size equals: 0.
	self assert: contact notes size equals: 0.

	^ contact
]

{ #category : #'examples - addresses' }
GtABAddressBookExample >> berlinAddress [
	<gtExample>
	<return: #GtABAddress>
	| address |
	address := GtABAddress new
			city: 'Berlin';
			country: 'Germany'.

	self assert: address city equals: 'Berlin'.
	self assert: address country equals: 'Germany'.
	self assert: address gtDisplayString equals: 'Berlin, Germany'.

	^ address
]

{ #category : #'examples - addresses' }
GtABAddressBookExample >> bernAddress [
	<gtExample>
	<return: #GtABAddress>
	| address |
	address := GtABAddress new
			city: 'Bern';
			country: 'Switzerland'.

	self assert: address city equals: 'Bern'.
	self assert: address country equals: 'Switzerland'.
	self assert: address gtDisplayString equals: 'Bern, Switzerland'.

	^ address
]

{ #category : #'examples - telephone' }
GtABAddressBookExample >> bernTelephoneNumberOne [
	<gtExample>
	<return: #GtABTelephone>
	| telephone |
	telephone := GtABTelephone new
			prefix: '+41';
			number: '74574363'.

	self assert: telephone prefix equals: '+41'.
	self assert: telephone number equals: '74574363'.
	self assert: telephone fullNumber equals: '+41-74574363'.

	^ telephone
]

{ #category : #'examples - telephone' }
GtABAddressBookExample >> bernTelephoneNumberTwo [
	<gtExample>
	<return: #GtABTelephone>
	| telephone |
	telephone := GtABTelephone new
			prefix: '+41';
			number: '7765335341'.

	self assert: telephone prefix equals: '+41'.
	self assert: telephone number equals: '7765335341'.
	self assert: telephone fullNumber equals: '+41-7765335341'.

	^ telephone
]

{ #category : #'examples - contacts' }
GtABAddressBookExample >> brianKentContact [
	<gtExample>
	<return: #GtABContact>
	| contact |
	contact := self basicBrianKentContact
			addTelephone: self newYorkTelephoneNumber;
			addAddress: self newYorkAddress.

	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #'examples - notes' }
GtABAddressBookExample >> businessNote [
	<gtExample>
	<return: #GtABContactNote>
	| note |
	note := GtABContactNote new
			title: 'Business';
			content: 'Should contact back about a possible business collaboration'.

	self assert: note title equals: 'Business'.
	self assert: note content size equals: 59.

	^ note
]

{ #category : #'examples - notes' }
GtABAddressBookExample >> conferenceMeetingNote [
	<gtExample>
	<return: #GtABContactNote>
	| note |
	note := GtABContactNote new
			title: 'Meeting';
			content: 'We met at a conference in 2018'.

	self assert: note title equals: 'Meeting'.
	self assert: note content size equals: 30.

	^ note
]

{ #category : #'examples - notes' }
GtABAddressBookExample >> contactNote [
	<gtExample>
	<return: #GtABContactNote>
	| note |
	note := GtABContactNote new
			title: 'Reminder';
			content: 'Answers phone Monday-Friday from 8:00 to 16:00'.

	self assert: note title equals: 'Reminder'.
	self assert: note content size equals: 46.

	^ note
]

{ #category : #'examples - addressbook' }
GtABAddressBookExample >> contactsAddressBookWithCategories [
	<gtExample>
	<label: 'Friends address book'>
	<return: #GtABAddressBook>
	| addressBook |
	addressBook := GtABAddressBook new label: 'My contacts'.
	addressBook
		importCategories: {self familyCategory.
				self acquaintancesCategory}.

	self assert: addressBook categories size equals: 2.
	self assert: addressBook contacts size equals: 5.

	^ addressBook
]

{ #category : #'examples - categories' }
GtABAddressBookExample >> coworkersCategory [
	<gtExample>
	<return: #GtABCategory>
	| category |
	category := GtABCategory new
			label: 'Co-workers';
			addContact: self davidSmithContact.

	self assert: category label equals: 'Co-workers'.
	self assert: category contacts size equals: 1.
	self assert: category allContacts size equals: 1.
	self assert: category subcategories size equals: 0.

	^ category
]

{ #category : #'examples - contacts' }
GtABAddressBookExample >> davidSmithContact [
	<gtExample>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'David';
			lastName: 'Smith';
			avatar: GtABContact johnDoeAvatar;
			description: (String loremIpsum: 84);
			addTelephone: self parisTelephoneNumber;
			addAddress: self parisAddress;
			addNotes: {self conferenceMeetingNote.
					self businessNote}.

	self assert: contact firstName equals: 'David'.
	self assert: contact lastName equals: 'Smith'.
	self assert: contact fullName equals: 'David Smith'.
	self assert: contact description size equals: 84.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.
	self assert: contact notes size equals: 2.

	^ contact
]

{ #category : #'examples - categories' }
GtABAddressBookExample >> familyCategory [
	<gtExample>
	<return: #GtABCategory>
	| category |
	category := GtABCategory new
			label: 'Family';
			addContacts: {self janeDoeContact.
					self johnDoeContact}.

	self assert: category label equals: 'Family'.
	self assert: category contacts size equals: 2.
	self assert: category allContacts size equals: 2.
	self assert: category subcategories size equals: 0.

	^ category
]

{ #category : #'examples - categories' }
GtABAddressBookExample >> friendsCategory [
	<gtExample>
	<return: #GtABCategory>
	| category |
	category := GtABCategory new
			label: 'Friends';
			addContact: self jamesPoeContact.

	self assert: category label equals: 'Friends'.
	self assert: category contacts size equals: 1.
	self assert: category allContacts size equals: 1.
	self assert: category subcategories size equals: 0.

	^ category
]

{ #category : #'examples - telephone' }
GtABAddressBookExample >> germanyTelephoneNumber [
	<gtExample>
	<return: #GtABTelephone>
	| telephone |
	telephone := GtABTelephone new
			prefix: '+49';
			number: '795675134251'.

	self assert: telephone prefix equals: '+49'.
	self assert: telephone number equals: '795675134251'.
	self assert: telephone fullNumber equals: '+49-795675134251'.

	^ telephone
]

{ #category : #'examples - contacts' }
GtABAddressBookExample >> jamesPoeContact [
	<gtExample>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'James';
			lastName: 'Poe';
			avatar: GtABContact johnDoeAvatar;
			description: (String loremIpsum: 42);
			addTelephone: self germanyTelephoneNumber;
			addAddress: self berlinAddress.

	self assert: contact firstName equals: 'James'.
	self assert: contact lastName equals: 'Poe'.
	self assert: contact fullName equals: 'James Poe'.
	self assert: contact description size equals: 42.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #'examples - contacts' }
GtABAddressBookExample >> janeDoeContact [
	<gtExample>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'Jane';
			lastName: 'Doe';
			description: GtABContact loremIpsum;
			avatar: GtABContact janeDoeAvatar;
			addAddress: self bernAddress;
			addTelephone: self bernTelephoneNumberOne;
			addNotes: {self contactNote}.

	self assert: contact firstName equals: 'Jane'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: GtABContact loremIpsum.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.
	self assert: contact notes size equals: 1.

	^ contact
]

{ #category : #'examples - contacts' }
GtABAddressBookExample >> johnDoeContact [
	<gtExample>
	<return: #GtABContact>
	| contact |
	contact := GtABContact new
			firstName: 'John';
			lastName: 'Doe';
			description: GtABContact loremIpsum;
			avatar: GtABContact johnDoeAvatar;
			addAddress: self bernAddress;
			addTelephone: self bernTelephoneNumberTwo.

	self assert: contact firstName equals: 'John'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: GtABContact loremIpsum.
	self assert: contact addresses size equals: 1.
	self assert: contact telephones size equals: 1.

	^ contact
]

{ #category : #'examples - addressbook' }
GtABAddressBookExample >> myContactsAddressBook [
	<gtExample>
	<return: #GtABAddressBook>
	| addressBook |
	addressBook := GtABAddressBook new label: 'My contacts'.
	addressBook addContact: self johnDoeContact.
	addressBook addContact: self janeDoeContact.
	addressBook addContact: self brianKentContact.
	addressBook addContact: self davidSmithContact.
	addressBook addContact: self jamesPoeContact.

	self assert: addressBook contacts size equals: 5.
	self assert: addressBook categories size equals: 0.
	self assert: (addressBook includesContactWithFirstName: 'John').
	self assert: (addressBook includesContactWithFirstName: 'Jane').

	^ addressBook
]

{ #category : #'examples - addresses' }
GtABAddressBookExample >> newYorkAddress [
	<gtExample>
	<return: #GtABAddress>
	| address |
	address := GtABAddress new
			city: 'New York';
			country: 'USA'.

	self assert: address city equals: 'New York'.
	self assert: address country equals: 'USA'.
	self assert: address gtDisplayString equals: 'New York, USA'.

	^ address
]

{ #category : #'examples - telephone' }
GtABAddressBookExample >> newYorkTelephoneNumber [
	<gtExample>
	<return: #GtABTelephone>
	| telephone |
	telephone := GtABTelephone new
			prefix: '+1';
			number: '347-589-7181'.

	self assert: telephone prefix equals: '+1'.
	self assert: telephone number equals: '347-589-7181'.
	self assert: telephone fullNumber equals: '+1-347-589-7181'.

	^ telephone
]

{ #category : #'examples - addresses' }
GtABAddressBookExample >> parisAddress [
	<gtExample>
	<return: #GtABAddress>
	| address |
	address := GtABAddress new
			city: 'Paris';
			country: 'France'.

	self assert: address city equals: 'Paris'.
	self assert: address country equals: 'France'.
	self assert: address gtDisplayString equals: 'Paris, France'.

	^ address
]

{ #category : #'examples - telephone' }
GtABAddressBookExample >> parisTelephoneNumber [
	<gtExample>
	<return: #GtABTelephone>
	| telephone |
	telephone := GtABTelephone new
			prefix: '+33';
			number: '1725625372'.

	self assert: telephone prefix equals: '+33'.
	self assert: telephone number equals: '1725625372'.
	self assert: telephone fullNumber equals: '+33-1725625372'.

	^ telephone
]
