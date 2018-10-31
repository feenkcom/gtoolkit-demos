"
Address books are instances of the class ${class:GtABAddressBook}$.
[[[ 
	GtABAddressBook new
]]]

Contacts are then instances of ${class:GtABContact}$. They can have several properties, like name, address, description.
${example:GtABAddressBookExample>>#janeDoeContact}$

Contacts can be added using the ${method:GtABAddressBook>>#addContact:}$
${example:GtABAddressBookExample>>#myContactsAddressBook}$


"
Class {
	#name : #GtABAddressBookExample,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-AddressBook-Models'
}

{ #category : #'examples ' }
GtABAddressBookExample >> contactAddress [
	<gtExample>
	| address |
	address := GtABAddress new
		city: 'Bern';
		country: 'Switzerland';
		telephone: (GtABTelephone new 
			prefix: '0041'; 
			number: '074574363').

	self assert: address city equals: 'Bern'.
	self assert: address country equals: 'Switzerland'.
	self assert: address telephone notNil.
	
	^ address
]

{ #category : #'examples ' }
GtABAddressBookExample >> janeDoeContact [
	<gtExample>
	| contact |
	contact := GtABContact new
		firstName: 'Jane';
		lastName: 'Doe';
		description: self loremIpsum;
		address: self contactAddress.

	self assert: contact firstName equals: 'Jane'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: self loremIpsum.
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
		description: self loremIpsum;
		address: self contactAddress.

	self assert: contact firstName equals: 'John'.
	self assert: contact lastName equals: 'Doe'.
	self assert: contact description equals: self loremIpsum.
	self assert: contact address notNil.

	^ contact
]

{ #category : #accessing }
GtABAddressBookExample >> loremIpsum [
	"Return a constant string with one paragraph of text, the famous Lorem ipsum filler text.
	The result is pure ASCII (Latin words) and contains no newlines."
	
	^ 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
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
	self assert: addressBook contacts first firstName equals: 'John'.
	self assert: addressBook contacts second firstName equals: 'Jane'.
	
	^ addressBook
]
