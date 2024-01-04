Class {
	#name : #GtP3F1Season,
	#superclass : #GtP3F1Object,
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Season class >> tableName [
	^ 'seasons'
]

{ #category : #accessing }
GtP3F1Season >> f1Races [
	| statement result |
	statement := p3Client format: 'SELECT * FROM races WHERE year = $1 ORDER BY date ASC'.
	result := statement query: { self year }.
	^ result recordsAsDictionaries collect: [ :each |
		GtP3F1Race new
			p3Client: self p3Client;
			object: each;
			yourself ]
]

{ #category : #accessing }
GtP3F1Season >> gtDetails [
	^ {
		{ #Year . self year } .
		{ #URL . self url }
	}
]

{ #category : #accessing }
GtP3F1Season >> gtViewRacesFor: composite [
	<gtView>
	^ composite columnedList
		title: 'Races';
		priority: 20;
		items: [ self f1Races ];
		column: 'Round' text: #round;
		column: 'Name' text: #name weight: 2;
		column: 'Date' text: #date
]

{ #category : #printing }
GtP3F1Season >> printOn: stream [
	super printOn: stream.
	stream nextPut: $(; print: self year; nextPut: $)
]

{ #category : #accessing }
GtP3F1Season >> url [
	^ self object at: #url
]

{ #category : #accessing }
GtP3F1Season >> year [
	^ self object at: #year
]
