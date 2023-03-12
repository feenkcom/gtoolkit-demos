Extension { #name : #GtSpotterStart }

{ #category : #'*GToolkit-Demo-AddressBook' }
GtSpotterStart >> gtSpotterAddressBookFor: aStep [
	"<gtSearch>"

	aStep listProcessor
		priority: -1;
		allCandidates: [ :x | {GtABAddressBook default} ];
		title: 'Address books';
		itemName: [ :addressBook | addressBook label ];
		matchSubstring;
		itemsLimit: 5;
		wantsToDisplayOnEmptyQuery: true
]
