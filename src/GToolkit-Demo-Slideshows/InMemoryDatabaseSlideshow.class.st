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
