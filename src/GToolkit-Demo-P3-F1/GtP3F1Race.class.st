Class {
	#name : #GtP3F1Race,
	#superclass : #GtP3F1Object,
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Race class >> tableName [
	^ 'races'
]

{ #category : #accessing }
GtP3F1Race >> constructorStandings [
	| statement result |
	statement := p3Client format: 'SELECT * FROM constructorstandings, constructors WHERE raceid = $1 AND constructorstandings.constructorid = constructors.constructorid ORDER BY constructorstandings.position ASC'.
	result := statement query: { self raceId }.
	^ result recordsAsDictionaries
]

{ #category : #accessing }
GtP3F1Race >> date [
	^ self object at: #date
]

{ #category : #accessing }
GtP3F1Race >> driverStandings [
	| statement result |
	statement := p3Client format: 'SELECT * FROM driverstandings, drivers WHERE raceid = $1 AND driverstandings.driverid = drivers.driverid ORDER BY driverstandings.position ASC'.
	result := statement query: { self raceId }.
	^ result recordsAsDictionaries
]

{ #category : #accessing }
GtP3F1Race >> gtDetails [
	^ { 
		{ 'Name' . self name } .
		{ 'Date' . self date } .
		{ 'Season' . self season } .
		{ 'Round' . self round } .
		{ 'URL' . self url }
	} 
]

{ #category : #accessing }
GtP3F1Race >> gtViewConstructorStandingsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'Constructor standings';
		priority: 40;
		items: [ self constructorStandings ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ each at: #positiontext ] ];
		column: 'Constructor' text: [ :each | each at: #constructorref ];
		column: 'Points' text: [ :each | (each at: #points) asInteger ];
		column: 'Wins' text: [ :each | each at: #wins ]
]

{ #category : #accessing }
GtP3F1Race >> gtViewDriverStandingsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'Driver standings';
		priority: 30;
		items: [ self driverStandings ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ each at: #positiontext ] ];
		column: 'Driver' text: [ :each | each at: #driverref ];
		column: 'Points' text: [ :each | (each at: #points) asInteger ];
		column: 'Wins' text: [ :each | each at: #wins ]
]

{ #category : #accessing }
GtP3F1Race >> gtViewResultsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'Results';
		priority: 25;
		items: [ self results ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ each at: #positiontext ] ];
		column: 'Driver' text: [ :each | each at: #driverref ];
		column: 'Time' text: [ :each | (each at: #time) ifNil: [ '' ]  ];
		column: 'Points' text: [ :each | (each at: #points) asInteger ];
		column: 'Grid' text: [ :each | each at: #grid ]
]

{ #category : #accessing }
GtP3F1Race >> name [
	^ self object at: #name
]

{ #category : #printing }
GtP3F1Race >> printOn: stream [
	super printOn: stream.
	stream 
		nextPut: $(; 
		nextPutAll: self name; 
		space; 
		print: self season; 
		nextPut: $)
]

{ #category : #accessing }
GtP3F1Race >> raceId [
	^ self object at: #raceid
]

{ #category : #accessing }
GtP3F1Race >> results [
	| statement result |
	statement := p3Client format: 'SELECT * FROM results , drivers WHERE raceid = $1 AND results.driverid = drivers.driverid ORDER BY results.position ASC'.
	result := statement query: { self raceId }.
	^ result recordsAsDictionaries
]

{ #category : #accessing }
GtP3F1Race >> round [
	^ self object at: #round
]

{ #category : #accessing }
GtP3F1Race >> season [
	^ self year
]

{ #category : #accessing }
GtP3F1Race >> url [
	^ self object at: #url
]

{ #category : #accessing }
GtP3F1Race >> year [
	^ self object at: #year
]
