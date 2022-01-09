Extension { #name : #GTSpotter }

{ #category : #'*GToolkit-Demo-AddressBook' }
GTSpotter >> spotterAddressBookFor: aStep [
     <spotterOrder: -1>
     aStep listProcessor
          allCandidates: [:x | { GtABAddressBook default } ];
          title: 'Address books';
          itemName: [ :addressBook | addressBook label];
          matchSubstring;
			 candidatesLimit: 5;
          wantsToDisplayOnEmptyQuery: true
]
