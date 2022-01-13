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
FileReference >> spotterForAddressFileFor: aStep [
	<spotterOrder: 40>

	self isAddressBookFile
		ifFalse: [^ self].

	aStep listProcessor
		title: 'Contacts';
		allCandidates: [ self contactsFromFile ];
		itemName: #fullName;
		filter: GtFilterSubstrings;
		wantsToDisplayOnEmptyQuery: true
]
