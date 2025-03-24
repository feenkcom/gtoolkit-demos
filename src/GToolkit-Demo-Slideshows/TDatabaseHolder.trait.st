"
I decorate a class with a transient Lepiter database.
Pages are defined as methods with a `<page>` pragma.
My users should send `initializeDatabase` in their `initialize` method.
"
Trait {
	#name : #TDatabaseHolder,
	#instVars : [
		'database'
	],
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #accessing }
TDatabaseHolder >> database [
	"Transient Lepiter database for the dynamically created pages.
	NB: We need to create a transient registry as well, so that links will work within the database."

	^ database
		ifNil: [ database := LeDatabase new monitor: LeVolatileMonitor new.
			LeBasicDatabasesRegistry new
				defaultLogicalDatabase: (LeLogicalDatabase new primaryDB: database).
			database ]
]

{ #category : #accessing }
TDatabaseHolder >> db [
	"Convenience method for backward compatibility."
	^ self database
]

{ #category : #action }
TDatabaseHolder >> gtDatabaseFor: aView [
	<gtView>
	self database pages ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Database';
		priority: 80;
		object: [ self database ];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #action }
TDatabaseHolder >> gtRefreshDatabaseActionFor: anAction [
	<gtAction>
	^ anAction explicit
		priority: 15;
		stencil: [ | button |
			button := BrButton new
					"id: GtInspectorInspectButtonId;"
					aptitude: BrGlamorousButtonWithIconAptitude;
					icon: BrGlamorousIcons refresh;
					label: 'Refresh database';
					action: [ :aButton :aModel :anEvent | aButton phlow spawnObject: self renewDatabase ].
			button ]
]

{ #category : #'as yet unclassified' }
TDatabaseHolder >> initializeDatabase [
	"Automatically load all pages defined in methods with a <lePage> pragma.
	Alternatively, overwrite this method to explicitly add pages."

	self pageMethods
		do: [ :m | 
			| page |
			page := self perform: m selector.
			(self database hasPageNamed: page title) ifFalse: [ self database addPage: page ] ]
]

{ #category : #acccessing }
TDatabaseHolder >> pageMethods [
	^ self class allMethods select: [ :m | m hasPragmaNamed: #lePage ]
]

{ #category : #actions }
TDatabaseHolder >> renewDatabase [
	"Recreate the database from scratch, eg after adding new pages."

	database := LeDatabase new.
	LeBasicDatabasesRegistry new
		defaultLogicalDatabase: (LeLogicalDatabase new primaryDB: database).
	self initializeDatabase.
	^ database
]
