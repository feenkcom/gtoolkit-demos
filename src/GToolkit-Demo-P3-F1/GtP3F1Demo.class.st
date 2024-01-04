Class {
	#name : #GtP3F1Demo,
	#superclass : #GtP3F1ClientObject,
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Demo >> f1Seasons [
	| result |
	result := p3Client query: 'SELECT * FROM seasons ORDER BY year DESC'.
	^ result recordsAsDictionaries collect: [ :each | 
		GtP3F1Season new 
			p3Client: self p3Client; 
			object: each; 
			yourself ]
]

{ #category : #accessing }
GtP3F1Demo >> gtCloseActionFor: anAction [
	<gtAction>
	^ anAction button
		icon: BrGlamorousVectorIcons shutdown;
		tooltip: 'Close PostgreSQL client connection';
		priority: 10;
		action: [ self p3Client close ]
]

{ #category : #accessing }
GtP3F1Demo >> gtViewF1SeasonsFor: composite [
	<gtView>
	^ composite columnedList
		title: 'F1 Seasons';
		priority: 20;
		items: [ self f1Seasons ];
		column: 'Year' text: #year;
		column: 'URL' text: #url weight: 2
]

{ #category : #accessing }
GtP3F1Demo >> gtViewP3ClientFor: composite [
	<gtView>
	^ composite forward
		title: 'P3 Client';
		priority: 80;
		object: [ self p3Client ];
		view: #gtViewDetailsIn:
]
