Class {
	#name : #GtP3F1Race,
	#superclass : #Object,
	#instVars : [
		'object',
		'p3Client'
	],
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Race >> date [
	^ self object at: #date
]

{ #category : #accessing }
GtP3F1Race >> gtViewDetailsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'Details';
		priority: 20;
		items: [ { 
			{ 'Name' . self name }.
			{ 'Date' . self date } } ];
		column: 'Key' text: #first;
		column: 'Value' text: #second;
		send: #last
]

{ #category : #accessing }
GtP3F1Race >> gtViewObjectFor: composite [
	<gtView>
	^ composite forward
		title: 'Object';
		priority: 30;
		object: [ self object ]
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
GtP3F1Race >> object [
	^ object
]

{ #category : #accessing }
GtP3F1Race >> object: anObject [
	object := anObject
]

{ #category : #accessing }
GtP3F1Race >> p3Client [
	^ p3Client
]

{ #category : #accessing }
GtP3F1Race >> p3Client: anObject [
	p3Client := anObject
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
