Class {
	#name : #GtP3F1Races,
	#superclass : #GtP3F1Collection,
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Races class >> tableName [
	^ 'races'
]

{ #category : #accessing }
GtP3F1Races >> gtViewRacesIn: composite [
	<gtView>
	^ composite columnedList
		title: 'Races';
		priority: 20;
		items: [ self collection ];
		column: 'Name' text: [ :each | each at: #name ];
		column: 'Date' text: [ :each | each at: #date ];
		column: 'Round' text: [ :each | each at: #round ];
		send: [ :each | GtP3F1Race new p3Client: self p3Client; object: each; yourself ]
]
