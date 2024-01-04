Class {
	#name : #GtP3F1Demo,
	#superclass : #GtP3F1ClientObject,
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Demo >> f1RacesInSeason: year [
	| statement result |
	statement := p3Client format: 'SELECT * FROM races WHERE year = $1 ORDER BY date ASC'.
	result := statement query: { year }.
	^ GtP3F1Races new
		p3Client: self p3Client;
		collection: result recordsAsDictionaries;
		yourself
]

{ #category : #accessing }
GtP3F1Demo >> f1Seasons [
	| result |
	result := p3Client query: 'SELECT * FROM seasons ORDER BY year DESC'.
	^ result recordsAsDictionaries.
]

{ #category : #accessing }
GtP3F1Demo >> gtViewF1SeasonsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'F1 Seasons';
		priority: 20;
		items: [ self f1Seasons ];
		column: 'Year' text: [ :each | each at: #year ];
		column: 'URL' text: [ :each | each at: #url ];
		send: [ :each | self f1RacesInSeason: (each at: #year) ]
]
