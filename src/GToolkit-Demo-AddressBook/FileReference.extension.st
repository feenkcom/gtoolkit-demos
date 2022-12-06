Extension { #name : #FileReference }

{ #category : #'*GToolkit-Demo-AddressBook' }
FileReference >> contactsFromFile [ 

	^ ((XMLDOMParser parse: self) // 'contact')
			collect: [ :each | GtABContact fromXML: each ]
]

{ #category : #'*GToolkit-Demo-AddressBook' }
FileReference >> gtInspectorContacts: aComposite [
	<gtInspectorPresentationOrder: 0>
	
	^ aComposite list 
		title: 'Contacts';
		display: [ self contactsFromFile ];
		format: #fullName;
		icon: #icon;
		when: [ self isAddressBookFile ]
]

{ #category : #'*GToolkit-Demo-AddressBook' }
FileReference >> isAddressBookFile [

	^ self isFile and: [ self extension = 'adr' ]
]

{ #category : #'*GToolkit-Demo-AddressBook' }
FileReference >> spotterForAddressFileFor: aSearch [
	<gtSearch>

	self isAddressBookFile
		ifFalse: [ ^ aSearch empty ].

	^ aSearch list
		title: 'Contacts';
		items: [ self contactsFromFile ];
		itemName: #fullName;
		filterBySubstring;
		wantsToDisplayOnEmptyQuery: true
]
