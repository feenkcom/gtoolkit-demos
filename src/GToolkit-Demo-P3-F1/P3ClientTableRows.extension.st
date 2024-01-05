Extension { #name : #P3ClientTableRows }

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRows >> gtViewRacesIn: composite [
	<gtView>
	self table name = 'races' ifFalse: [ ^ composite empty ].
	^ composite columnedList
		title: 'Races';
		priority: 20;
		items: [ self rows ];
		column: 'Round' text: [ :each | each at: #round ];
		column: 'Name' text: [ :each | each at: #name ];
		column: 'Date' text: [ :each | each at: #date ];
		send: [ :row | 
			P3ClientTableRow new 
				table: self table; 
				row: row; 
				yourself ]
]
