Class {
	#name : #GtP3F1Demo,
	#superclass : #Object,
	#instVars : [
		'p3Client'
	],
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

{ #category : #accessing }
GtP3F1Demo >> p3Client [
	^ p3Client
]

{ #category : #accessing }
GtP3F1Demo >> p3Client: anObject [
	p3Client := anObject
]

{ #category : #'as yet unclassified' }
GtP3F1Demo >> url: urlString [
	p3Client := P3Client url: urlString.
]
