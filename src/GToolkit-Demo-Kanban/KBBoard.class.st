"
I am a Kanban Board interface to a Lepiter database.
I consist of a number of Lists of Cards, where each Card is a Note from the database.
The idea is to populate the Board from those Notes that correspond to tasks.
If task Notes are tagged, i.e., with tags like “ToDo” and “Done”, then we can automatically populate Lists to create an initial Board.
Once a Board exists, Cards can be manually moved within or between Lists using an API or a suitable GUI.
Newly created or modified Notes could be added automatically to a given List if they match a trigger condition (i.e., presence of a tag).
A board can be stored in various ways, e.g., by storing it as a special kind of Note, or as a storeString ....

"
Class {
	#name : #KBBoard,
	#superclass : #Object,
	#instVars : [
		'database',
		'name',
		'uncategorized',
		'lists'
	],
	#category : #'GToolkit-Demo-Kanban-Model'
}

{ #category : #accessing }
KBBoard class >> named: aBoardName forDatabase: aDatabase [
	^ self new
		named: aBoardName;
		database: aDatabase
]

{ #category : #accessing }
KBBoard class >> named: aBoardName forDatabaseNamed: aDatabaseName [
	^ self new
		named: aBoardName;
		database: (LeDatabasesRegistry getDatabaseByName: aDatabaseName)
]

{ #category : #accessing }
KBBoard >> addDefaultListNamed: aListName [
	| list |
	list := KBList named: aListName.
	list addAll: uncategorized.
	uncategorized := OrderedCollection new.
	lists addLast: list
]

{ #category : #accessing }
KBBoard >> addDefaultListNamed: aString withCardsNamed: anObject [ 
	self notYetImplemented
]

{ #category : #accessing }
KBBoard >> addListNamed: aString withCardsNamed: anObject [ 
	self notYetImplemented
]

{ #category : #accessing }
KBBoard >> addListNamed: aListName withCardsTagged: aTagNameCollection [
	| list matchingCards oldsize |
	oldsize := uncategorized size.

	list := KBList named: aListName.
	matchingCards := self cards: uncategorized matchingTags: aTagNameCollection.
	list addAll: matchingCards.
	uncategorized removeAll: matchingCards.
	lists addLast: list.

	self assert: oldsize equals: matchingCards size + uncategorized size.
]

{ #category : #accessing }
KBBoard >> cards: cards matchingTags: aTagNameCollection [
	^ cards
		select: [ :c | (c page tags collect: #title) includesAll: aTagNameCollection ]
]

{ #category : #accessing }
KBBoard >> database [
	^ database
]

{ #category : #accessing }
KBBoard >> database: aDatabase [
	database := aDatabase
]

{ #category : #view }
KBBoard >> gtListsFor: aView [
<gtView>
^ aView forward
	title: 'Lists';
	priority: 10;
	object: lists;
	view: #gtItemsFor:
]

{ #category : #initalization }
KBBoard >> initialize [
	uncategorized := OrderedCollection new.
	lists := OrderedCollection new.
	
]

{ #category : #testing }
KBBoard >> invariant [
	name ifNil: [ ^ false ].
	database ifNil: [ ^ false ].
	^ true
]

{ #category : #accessing }
KBBoard >> lists [
	^ lists
]

{ #category : #accessing }
KBBoard >> lists: anObject [
	lists := anObject
]

{ #category : #accessing }
KBBoard >> named: aBoardName [
	name := aBoardName
]

{ #category : #accessing }
KBBoard >> uncategorized [
	^ uncategorized
]

{ #category : #accessing }
KBBoard >> uncategorized: aCardCollection [
	uncategorized := aCardCollection
]

{ #category : #accessing }
KBBoard >> withCardsNamed: anObject [ 
	self notYetImplemented
]

{ #category : #accessing }
KBBoard >> withCardsTagged: aString [
	self
		uncategorized: ((self database pages select: [ :p | p hasTagNamed: aString ])
				collect: [ :p | KBCard forPage: p ])
]
