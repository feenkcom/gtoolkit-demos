Class {
	#name : #GtP3F1Races,
	#superclass : #Object,
	#instVars : [
		'collection',
		'p3Client'
	],
	#category : #'GToolkit-Demo-P3-F1'
}

{ #category : #accessing }
GtP3F1Races >> collection [
	^ collection
]

{ #category : #accessing }
GtP3F1Races >> collection: anObject [
	collection := anObject
]

{ #category : #accessing }
GtP3F1Races >> gtViewCollectionFor: composite [
	<gtView>
	^ composite forward
		title: 'Collection';
		priority: 30;
		object: [ self collection ]
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

{ #category : #accessing }
GtP3F1Races >> p3Client [
	^ p3Client
]

{ #category : #accessing }
GtP3F1Races >> p3Client: anObject [
	p3Client := anObject
]
