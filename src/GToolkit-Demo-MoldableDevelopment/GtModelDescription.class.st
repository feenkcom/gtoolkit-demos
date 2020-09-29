Class {
	#name : #GtModelDescription,
	#superclass : #BrStencil,
	#instVars : [
		'snippetsCollection'
	],
	#category : #'GToolkit-Demo-MoldableDevelopment'
}

{ #category : #'as yet unclassified' }
GtModelDescription >> addressBookClassDescription [
	| text |
	text := 'So we create an address book that can hold multiple contacts. We also assign a label to it.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtModelDescription >> addressClassDescription [
	| text |
	text := 'We start with the address class. It stores the city and the country so we make getter and setter methods for those.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtModelDescription >> categoryClassDescription [
	| text |
	text := 'A category can hold multiple contacts and categories, referred to as subcategories. It also has a label to better identify it.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtModelDescription >> coderOnClass: aClass [
	| coderElement container |
	
	container := BlElement new
		constraintsDo: [ :c |
			c vertical matchParent.
			c horizontal matchParent ];
		layout: BlLinearLayout horizontal;
		margin: (BlInsets all: 5);
		background: Color white;
		look: BrShadowLook.
	
	coderElement := (GtClassCoder forClass: aClass) asElement.
	
	^ container
		addChild: coderElement.
]

{ #category : #'as yet unclassified' }
GtModelDescription >> contactClassDescription [
	| text |
	text := 'Now we can implement the contact class. Besides the address, telephone and notes, it will have a first name, a last name and an avatar. Some custom views are also defined here for a better visualization of a contact object.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #accessing }
GtModelDescription >> contactExample [
	^ GtPlaygroundLiveSlide new
		snippets: { 
			'anAddress := GtABAddress new
	city: ''Bern'';
	country: ''Switzerland''.
aTelephone := GtABTelephone new
	prefix: ''41'';
	number: ''074574363''.
aNote := GtABContactNote new
	title: ''Reminder'';
	content: ''Call John Doe Friday at 8:00 pm''.
contact := GtABContact new
	firstName: ''Jane'';
	lastName: ''Doe'';
	description: GtABContact loremIpsum;
	avatar: GtABContact janeDoeAvatar;
	address: anAddress;
	telephone: aTelephone;
	addNote: aNote.
contact.' };
		asElement.
]

{ #category : #'as yet unclassified' }
GtModelDescription >> contactExampleText [
	| text |
	text := 'This playground snippet creates a contact object. You can tweak the informations for the contact however you like and then you can inspect it to see the visualizations.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'api - instantiation' }
GtModelDescription >> create [
	| show |
	show := GtSlideShow new.
	show
		slides:
			{
				(GtTitleLiveSlide new
					titleWithFormat: ('Model Description' asRopedText
						fontSize: 70;
						glamorousRegularFont)).
				(GtTextLiveSlide new
					newTextWithFormat: (self introductionText)).
				(GtTextLiveSlide new
					newTextWithFormat: ('Now let''s take a closer look at each of the classes, starting from the bottom.' asRopedText
						glamorousRegularFont;
						fontSize: 20)).
				(GtTextAndElementLiveSlide new
					newTextWithFormat: (self addressClassDescription);
					element: [ self coderOnClass: GtABAddress ];
					elementWeight: 0.6).
				(GtLabelAndElementLiveSlide new
					newText: ('You can inspect the snippet below to see how an address object looks like' asRopedText);
					element: [GtPlaygroundLiveSlide new
						snippets: {snippetsCollection at: 1};
						asElement]).
				(GtTextAndElementLiveSlide new
					newTextWithFormat: (self telephoneClassDescription);
					element: [ self coderOnClass: GtABTelephone ];
					elementWeight: 0.6).
				(GtLabelAndElementLiveSlide new
					newText: ('Below you can inspect a telephone object' asRopedText);
					element: [GtPlaygroundLiveSlide new
						snippets: {snippetsCollection at: 2};
						asElement]).
				(GtTextAndElementLiveSlide new
					newTextWithFormat: (self noteClassDescription);
					element: [ self coderOnClass: GtABContactNote ];
					elementWeight: 0.6).
				(GtLabelAndElementLiveSlide new
					newText: ('Inspect the note below and check its particular view' asRopedText);
					element: [GtPlaygroundLiveSlide new
						snippets: {snippetsCollection at: 3};
						asElement]).
				(GtTextAndElementLiveSlide new
					newTextWithFormat: (self contactClassDescription);
					element: [ self coderOnClass: GtABContact ];
					elementWeight: 0.6).
				(GtLabelAndElementLiveSlide new
					newText: ('You can play around with the example below and inspect it to see how it looks' asRopedText);
					element: [GtPlaygroundLiveSlide new
						snippets: {
							snippetsCollection at: 1.
							snippetsCollection at: 2.
							snippetsCollection at: 3.
							snippetsCollection at: 4};
						asElement]).
				(GtTextLiveSlide new
					newTextWithFormat: ('But now we want to be able to handle multiple contacts.' asRopedText
						glamorousRegularFont;
						fontSize: 20)).
				(GtTextAndElementLiveSlide new
					newTextWithFormat: (self addressBookClassDescription);
					element: [ self coderOnClass: GtABAddressBook ];
					elementWeight: 0.6).
				(GtLabelAndElementLiveSlide new
					newText: ('Here is an address book example with two contacts added' asRopedText );
					element: [ GtPlaygroundLiveSlide new
						snippets: snippetsCollection;
						asElement ]).
				(GtTextLiveSlide new
					newTextWithFormat: ('To extend the model even more, we can add categories to our address book, for a better organization.' asRopedText
						glamorousRegularFont;
						fontSize: 20)).
				(GtTextAndElementLiveSlide new
					newTextWithFormat: (self categoryClassDescription);
					element: [ self coderOnClass: GtABCategory ];
					elementWeight: 0.6).
				(GtLabelAndElementLiveSlide new
					newText: ('The example below shows an address book with multiple categories and contacts.' asRopedText);
					element: [ GtExampleLiveSlide new
						method: (GtABAddressBookExample>>#contactsAddressBookWithCategories);
						asElement ]).
			}.
	^ show.
]

{ #category : #initialization }
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

{ #category : #intro }
GtModelDescription >> introductionText [
	| text |
	text := 'In this tutorial we will take a closer look at how to model something in Gt. 
The example we chose is an address book that holds contacts and optionally it can have categories to group the contacts in. As for the contact, it has a name, an avatar, a description, a phone, an address and notes. The last 3 will be modeled as individual objects so they will each have their own class.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtModelDescription >> noteClassDescription [
	| text |
	text := 'Each contact can also have notes. They are different kinds of information about that contact like a reminder or a working schedule. A note has a title and the content. On top of the getter and setter methods, a note has a view method, creating a custom visualization for the object.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]

{ #category : #'as yet unclassified' }
GtModelDescription >> telephoneClassDescription [
	| text |
	text := 'Next we have implement the telephone number. It holds the number and the prefix. Like we did for the address, we have getter and setter methods for these. On top of that we have a method that returns the full number: prefix-number.' asRopedText.
	
	^ text
		glamorousRegularFont;
		fontSize: 20;
		foreground: Color black.
]
