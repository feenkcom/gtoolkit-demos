"
I can be a parent of slideshows that make use of a mock database.
I exist so that such slideshows can use me as a superclass instead of directly using {{gtClass:name=TLeInMemoryDatabaseHolder}} as a trait.

My subclasses should override `databaseName` to point to the database to clone as an in-memory database.

I am similar to {{gtClass:name=InMemoryDatabaseHolder}} except that I am a subclass of {{gtClass:name=PrioritySlideshow}}.
"
Class {
	#name : #InMemoryDatabaseSlideshow,
	#superclass : #PrioritySlideshow,
	#traits : 'TLeInMemoryDatabaseHolder',
	#classTraits : 'TLeInMemoryDatabaseHolder classTrait',
	#category : #'GToolkit-Demo-Slideshows-Slideshows'
}

{ #category : #action }
InMemoryDatabaseSlideshow >> gtLoadDatabaseActionFor: anAction [
	<gtAction>
	database ifNil: [ ^ anAction empty ].
	^ anAction button
		tooltip: 'Load database';
		priority: 25;
		icon: BrGlamorousVectorIcons load;
		target: PrioritySlideshowActionTarget;
		action: [ :aButton :aModel :anEvent | aButton phlow spawnObject: self loadDatabase ]
]

{ #category : #action }
InMemoryDatabaseSlideshow >> gtUnloadDatabaseActionFor: anAction [
	<gtAction>
	database ifNil: [ ^ anAction empty ].
	^ anAction button
		tooltip: 'Unload database';
		priority: 26;
		icon: BrGlamorousVectorIcons close;
		target: PrioritySlideshowActionTarget;
		action: [ :aButton :aModel :anEvent | aButton phlow spawnObject: self unloadDatabase ]
]
