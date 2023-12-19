Extension { #name : #P3ClientTableRow }

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> gtViewRaceDetailsFor: composite [
	<gtView>
	self table name = 'races' ifFalse: [ ^ composite empty ].
	^ composite columnedList
		title: 'Race';
		priority: 20;
		items: [ { 
			{ 'Name' . self row at: #name }.
			{ 'Date' . self row at: #date } } ];
		column: 'Key' text: #first;
		column: 'Value' text: #second;
		send: #last
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> gtViewResultsFor: composite [
	<gtView>
	self table name = 'races' ifFalse: [ ^ composite empty ].
	^ composite columnedList
		title: 'Results';
		priority: 25;
		items: [ self raceResults ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ '' ] ];
		column: 'Driver' text: [ :each | each at: #driverref ];
		column: 'Time' text: [ :each | (each at: #time) ifNil: [ '' ]  ]
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> raceResults [
	| statement result |
	statement := self client format: 'SELECT * FROM results , drivers WHERE raceid = $1 AND results.driverid = drivers.driverid'.
	result := statement query: { self row at: #raceid }.
	^ result recordsAsDictionaries
]
