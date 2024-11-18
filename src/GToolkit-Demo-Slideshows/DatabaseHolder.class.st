Class {
	#name : #DatabaseHolder,
	#superclass : #Object,
	#instVars : [
		'db'
	],
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #accessing }
DatabaseHolder >> db [
	"Transient Lepiter database for the dynamically created pages.
	NB: We need to create a transient registry as well, so that links will work within the database."

	db
		ifNil: [ db := LeDatabase new monitor: LeVolatileMonitor new.
			LeBasicDatabasesRegistry new
				defaultLogicalDatabase: (LeLogicalDatabase new primaryDB: db).
			db ].
	^ db
]

{ #category : #view }
DatabaseHolder >> gtDatabaseFor: aView [
	<gtView>
	self db pages ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Database';
		priority: 80;
		object: [ self db ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #actions }
DatabaseHolder >> gtRefreshDbActionFor: anAction [
	<gtAction>
	^ anAction explicit
		priority: 15;
		stencil: [ | button |
			button := BrButton new
					"id: GtInspectorInspectButtonId;"
					aptitude: BrGlamorousButtonWithIconAptitude;
					icon: BrGlamorousIcons refresh;
					label: 'Refresh database';
					action: [ :aButton :aModel :anEvent | aButton phlow spawnObject: self renewDb ].
			button ]
]

{ #category : #initalization }
DatabaseHolder >> initialize [
	super initialize.
	self initializeDb.
]

{ #category : #initialization }
DatabaseHolder >> initializeDb [
	"Automatically load all pages defined in methods with a <lePage> pragma.
	Alternatively, overwrite this method to explicitly add pages."

	self pageMethods
		do: [ :m | 
			| page |
			page := self perform: m selector.
			(self db hasPageNamed: page title) ifFalse: [ self db addPage: page ] ]
]

{ #category : #accessing }
DatabaseHolder >> pageMethods [
	^ self class methods select: [ :m | m hasPragmaNamed: #lePage ]
]

{ #category : #actions }
DatabaseHolder >> renewDb [
	"Recreate the db from scratch, eg after adding new pages."
	db := LeDatabase new.
	LeBasicDatabasesRegistry new
		defaultLogicalDatabase: (LeLogicalDatabase new primaryDB: db).
	self initializeDb.
	^ db
]
