Class {
	#name : 'GtModelDescription',
	#superclass : 'Object',
	#instVars : [
		'snippetsCollection'
	],
	#category : 'GToolkit-Demo-MoldableDevelopment'
}

{ #category : 'accesing' }
GtModelDescription >> addressBookClassDescription [
	| text |
	text := 'So we create an address book that can hold multiple contacts. We also assign a label to it.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : 'accesing' }
GtModelDescription >> addressBookClassDescriptionSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 16;
		newTextWithFormat: (self addressBookClassDescription);
		element: [ self coderOnClass: GtABAddressBook ];
		elementWeight: 0.6.
]

{ #category : 'accesing' }
GtModelDescription >> addressBookExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 17;
		newFadedText: 
			('Here is an address book example with two contacts added' asRopedText );
		element: [ GtPlaygroundLiveSlide new
			snippets: snippetsCollection;
			asElement ].
]

{ #category : 'accesing' }
GtModelDescription >> addressBookIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 15;
		newTextWithFormat: 
			('But now we want to be able to handle multiple contacts.' asRopedText
				glamorousRegularFont;
				fontSize: 20).
]

{ #category : 'accesing' }
GtModelDescription >> addressClassDescription [
	| text |
	text := 'We start with the address class. It stores the city and the country so we make getter and setter methods for those.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : 'accesing' }
GtModelDescription >> addressClassDescriptionSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 7;
		newTextWithFormat: (self addressClassDescription);
		element: [ self coderOnClass: GtABAddress ];
		elementWeight: 0.6
]

{ #category : 'accesing' }
GtModelDescription >> addressClassExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 8;
		newFadedText: ('You can inspect the snippet below to see how an address object looks like' asRopedText);
		element: [GtPlaygroundLiveSlide new
			snippets: {snippetsCollection at: 1};
			asElement].
]

{ #category : 'accesing' }
GtModelDescription >> categoriesIntroductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 18;
		newTextWithFormat: ('To extend the model even more, we added categories to the address book, for a better organization.' asRopedText
			glamorousRegularFont;
			fontSize: 20).
]

{ #category : 'accesing' }
GtModelDescription >> categoryClassDescription [
	| text |
	text := 'A category can hold contacts and other categories, referred to as subcategories. It also has a label to better identify it.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : 'accesing' }
GtModelDescription >> categoryClassDescriptionSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 19;
		newTextWithFormat: (self categoryClassDescription);
		element: [ self coderOnClass: GtABCategory ];
		elementWeight: 0.6.
]

{ #category : 'accesing' }
GtModelDescription >> categoryExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 20;
		newFadedText: ('The example below shows an address book with multiple categories and contacts.' asRopedText);
		element: [ GtExampleLiveSlide new
			method: (GtABAddressBookExample>>#contactsAddressBookWithCategories);
			asElement ].
]

{ #category : 'accesing' }
GtModelDescription >> coderOnClass: aClass [
	| coderElement container |
	
	container := BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		background: Color white;
		aptitude: BrShadowAptitude.
	
	coderElement := (GtPharoBehaviorCoder forClass: aClass) asElement.
	
	^ container
		addChild: coderElement.
]

{ #category : 'accesing' }
GtModelDescription >> contactClassDescription [
	| text |
	text := 'Next we can work on the class for contacts. Besides the address, telephone and notes, it will have a first name, a last name and an avatar. Some custom views are also defined here for a better visualization of the objects.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : 'accesing' }
GtModelDescription >> contactClassDescriptionSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 13;
		newTextWithFormat: (self contactClassDescription);
		element: [ self coderOnClass: GtABContact ];
		elementWeight: 0.6.
]

{ #category : 'accesing' }
GtModelDescription >> contactClassExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 14;
		newFadedText: ('You can play around with the example below and inspect it to see how it looks' asRopedText);
		element: [GtPlaygroundLiveSlide new
			snippets: {
				snippetsCollection at: 1.
				snippetsCollection at: 2.
				snippetsCollection at: 3.
				snippetsCollection at: 4};
			asElement].
]

{ #category : 'accesing' }
GtModelDescription >> descriptionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 5;
		newTextWithFormat: self introductionText.
]

{ #category : 'initialization' }
GtModelDescription >> initialize [
	snippetsCollection := {
		'address := GtABAddress new
	city: ''Bern'';
	country: ''Switzerland''.'.
		'telephone := GtABTelephone new
	prefix:''41'';
	number: ''074574363''.'.
		'note := GtABContactNote new
	title: ''Working Schedule'';
	content: ''Monday-Friday from 8:00 to 16:00''.'.
		'janeDoeContact := GtABContact new
	firstName: ''Jane'';
	lastName: ''Doe'';
	avatar: GtABContact janeDoeAvatar;
	description: GtABContact loremIpsum;
	address: address;
	telephone: telephone;
	addNote: note.'.
		'johnDoeContact := GtABContact new
	firstName: ''John'';
	lastName: ''Doe'';
	avatar: GtABContact johnDoeAvatar;
	description: GtABContact loremIpsum;
	address: address;
	telephone: telephone;
	addNote: note.'.
		'addressBook := GtABAddressBook new
	label: ''My contacts'';
	addContact: janeDoeContact;
	addContact: johnDoeContact.'}.
]

{ #category : 'accesing' }
GtModelDescription >> introductionSlideFor: aSlide [
	<gtSlide>
	^ aSlide text
		priority: 6;
		newTextWithFormat: 
			('Now let''s take a closer look at each of the classes, starting from the bottom.' asRopedText
				glamorousRegularFont;
				fontSize: 20).
]

{ #category : 'accesing' }
GtModelDescription >> introductionText [
	| text |
	text := 'In this tutorial we will take a closer look at how to model something in Gt. 
The example we chose is an address book that holds contacts and optionally it can have categories to group the contacts in. As for a contact, we can have a name, an avatar, a description, a phone number, an address and notes. The last 3 will be modeled as individual objects so they will each have their own class.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : 'accesing' }
GtModelDescription >> noteClassDescription [
	| text |
	text := 'Each contact can also have notes. They are different kinds of information about that contact like a reminder or a working schedule. A note has a title and the content. On top of the getter and setter methods, a note has a view method, creating a custom visualization for the object.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : 'accesing' }
GtModelDescription >> noteClassDescriptionSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 11;
		newTextWithFormat: (self noteClassDescription);
		element: [ self coderOnClass: GtABContactNote ];
		elementWeight: 0.6.
]

{ #category : 'accesing' }
GtModelDescription >> noteClassExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 12;
		newFadedText: ('Inspect the note below and check its particular view' asRopedText);
			element: [GtPlaygroundLiveSlide new
				snippets: {snippetsCollection at: 3};
				asElement].
]

{ #category : 'accesing' }
GtModelDescription >> telephoneClassDescription [
	| text |
	text := 'Next we have the telephone number. It holds the number and the prefix. Like we did for the address, we have getter and setter methods for these. On top of that we have a method that returns the full number: prefix-number.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : 'accesing' }
GtModelDescription >> telephoneClassDescriptionSlideFor: aSlide [
	<gtSlide>
	^ aSlide textAndElement
		priority: 9;
		newTextWithFormat: (self telephoneClassDescription);
		element: [ self coderOnClass: GtABTelephone ];
		elementWeight: 0.6.
]

{ #category : 'accesing' }
GtModelDescription >> telephoneClassExampleSlideFor: aSlide [
	<gtSlide>
	^ aSlide labelAndElement
		priority: 10;
		newFadedText: ('Below you can inspect a telephone object' asRopedText);
		element: [GtPlaygroundLiveSlide new
			snippets: {snippetsCollection at: 2};
			asElement].
]

{ #category : 'accesing' }
GtModelDescription >> titleSlideFor: aSlide [
	<gtSlide>
	^ aSlide title
		priority: 1;
		titleWithFormat: ('Model Description' asRopedText
			fontSize: 70;
			glamorousRegularFont).
]
