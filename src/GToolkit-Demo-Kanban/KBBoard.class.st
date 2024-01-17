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
		'cards'
	],
	#category : #'GToolkit-Demo-Kanban'
}

{ #category : #accessing }
KBBoard class >> named: aBoardName forDatabase: aDatabaseName [
	^ self new
		named: aBoardName;
		database: aDatabaseName
]

{ #category : #accessing }
KBBoard >> addDefaultListNamed: aString [ 
]

{ #category : #accessing }
KBBoard >> addDefaultListNamed: aString withCardsNamed: anObject [ 
]

{ #category : #accessing }
KBBoard >> addListNamed: aString withCardsNamed: anObject [ 
]

{ #category : #accessing }
KBBoard >> addListNamed: aString withCardsTagged: anObject [ 
]

{ #category : #accessing }
KBBoard >> cards [
	^ cards
]

{ #category : #accessing }
KBBoard >> cards: aCardCollection [
	cards := aCardCollection
]

{ #category : #accessing }
KBBoard >> database [
	^ database
]

{ #category : #accessing }
KBBoard >> database: aDatabaseName [
	database := LeDatabasesRegistry getDatabaseByName: aDatabaseName
]

{ #category : #accessing }
KBBoard >> named: aBoardName [
	name := aBoardName
]

{ #category : #accessing }
KBBoard >> withCardsNamed: anObject [ 
]

{ #category : #accessing }
KBBoard >> withCardsTagged: aString [
	self cards: (self database pages select: [ :p | p hasTagNamed: aString ])
]
