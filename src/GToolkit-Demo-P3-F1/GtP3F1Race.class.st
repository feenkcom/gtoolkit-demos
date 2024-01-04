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
GtP3F1Race >> date [
	^ self object at: #date
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
GtP3F1Race >> gtViewResultsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'Results';
		priority: 25;
		items: [ self results ];
		column: 'Position' text: [ :each | (each at: #position) ifNil: [ '' ] ];
		column: 'Driver' text: [ :each | each at: #driverref ];
		column: 'Time' text: [ :each | (each at: #time) ifNil: [ '' ]  ]
]

{ #category : #accessing }
GtP3F1Race >> name [
	^ self object at: #name
]

{ #category : #accessing }
GtP3F1Race >> raceId [
	^ self object at: #raceid
]

{ #category : #accessing }
GtP3F1Race >> results [
	| statement result |
	statement := p3Client format: 'SELECT * FROM results , drivers WHERE raceid = $1 AND results.driverid = drivers.driverid'.
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
