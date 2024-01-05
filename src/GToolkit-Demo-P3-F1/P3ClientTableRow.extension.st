Extension { #name : #P3ClientTableRow }

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> gtViewRaceConstructorStandingsFor: composite [
	<gtView>
	self table name = 'races' ifFalse: [ ^ composite empty ].
	^ composite columnedList
		title: 'Constructor standings';
		priority: 30;
		items: [ self raceConstructorStandings ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ each at: #positiontext ] ];
		column: 'Constructor' text: [ :each | each at: #constructorref ];
		column: 'Points' text: [ :each | (each at: #points) asInteger ];
		column: 'Wins' text: [ :each | each at: #wins ]
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> gtViewRaceDetailsFor: composite [
	<gtView>
	self table name = 'races' ifFalse: [ ^ composite empty ].
	^ composite columnedList
		title: 'Race';
		priority: 20;
		items: [ { 
			{ 'Name' . self row at: #name }.
			{ 'Date' . self row at: #date }.
			{ 'Season' . self row at: #year }.
			{ 'Round' . self row at: #round }.
			{ 'URL' . self row at: #url } } ];
		column: 'Key' text: #first;
		column: 'Value' text: #second;
		send: #last
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> gtViewRaceDriverStandingsFor: composite [
	<gtView>
	self table name = 'races' ifFalse: [ ^ composite empty ].
	^ composite columnedList
		title: 'Driver standings';
		priority: 30;
		items: [ self raceDriverStandings ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ each at: #positiontext ] ];
		column: 'Driver' text: [ :each | each at: #driverref ];
		column: 'Points' text: [ :each | (each at: #points) asInteger ];
		column: 'Wins' text: [ :each | each at: #wins ]
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> gtViewRaceResultsFor: composite [
	<gtView>
	self table name = 'races' ifFalse: [ ^ composite empty ].
	^ composite columnedList
		title: 'Results';
		priority: 25;
		items: [ self raceResults ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ each at: #positiontext ] ];
		column: 'Driver' text: [ :each | each at: #driverref ];
		column: 'Time' text: [ :each | (each at: #time) ifNil: [ '' ]  ];
		column: 'Points' text: [ :each | (each at: #points) asInteger ];
		column: 'Grid' text: [ :each | each at: #grid ]
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> raceConstructorStandings [
	| statement result |
	statement := self client format: 'SELECT * FROM constructorstandings, constructors WHERE raceid = $1 AND constructorstandings.constructorid = constructors.constructorid ORDER BY constructorstandings.position ASC'.
	result := statement query: { self row at: #raceid }.
	^ result recordsAsDictionaries
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> raceDriverStandings [
	| statement result |
	statement := self client format: 'SELECT * FROM driverstandings, drivers WHERE raceid = $1 AND driverstandings.driverid = drivers.driverid ORDER BY driverstandings.position ASC'.
	result := statement query: { self row at: #raceid }.
	^ result recordsAsDictionaries
]

{ #category : #'*GToolkit-Demo-P3-F1' }
P3ClientTableRow >> raceResults [
	| statement result |
	statement := self client format: 'SELECT * FROM results , drivers WHERE raceid = $1 AND results.driverid = drivers.driverid'.
	result := statement query: { self row at: #raceid }.
	^ result recordsAsDictionaries
]
