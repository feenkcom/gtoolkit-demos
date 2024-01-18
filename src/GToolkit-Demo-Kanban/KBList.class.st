Class {
	#name : #KBList,
	#superclass : #Object,
	#instVars : [
		'name',
		'cards'
	],
	#category : #'GToolkit-Demo-Kanban-Model'
}

{ #category : #'instance creation' }
KBList class >> named: aListName [
	^ self new
		name: aListName;
		yourself
]

{ #category : #accessing }
KBList >> add: aCard [
	cards addLast: aCard
]

{ #category : #accessing }
KBList >> addAll: aCardCollection [
	cards addAll: aCardCollection
]

{ #category : #accessing }
KBList >> cards [
	^ cards
]

{ #category : #accessing }
KBList >> cards: anObject [
	cards := anObject
]

{ #category : #view }
KBList >> gtCardsFor: aView [
	<gtView>
	^ aView forward
		title: 'Cards';
		priority: 10;
		object: cards;
		view: #gtItemsFor:
]

{ #category : #accessing }
KBList >> gtDisplayOn: aStream [
	self printOn: aStream.
	aStream
		space;
		nextPut: $[;
		print: self size;
		nextPutAll: (' item' asPluralBasedOn: self size);
		nextPut: $];
		space
]

{ #category : #initalization }
KBList >> initialize [
	cards := OrderedCollection new
]

{ #category : #accessing }
KBList >> name [
	^ name
]

{ #category : #accessing }
KBList >> name: anObject [
	name := anObject
]

{ #category : #printing }
KBList >> printOn: aStream [
	aStream
		nextPutAll: name
]

{ #category : #accessing }
KBList >> size [
	^ cards size
]
