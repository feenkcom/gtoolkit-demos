Class {
	#name : #KBBoardExample,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Kanban-Examples'
}

{ #category : #example }
KBBoardExample >> board [
	<gtExample>
	| board |
	board := (KBBoard named: 'Test Kanban' forDatabase: self databaseWithPages)
			withCardsTagged: 'ToDo';
			addListNamed: 'ASAP' withCardsTagged: {'ASAP'};
			addListNamed: 'Soon' withCardsTagged: {'Soon'};
			addListNamed: 'Video' withCardsTagged: {'Video'};
			addDefaultListNamed: 'Others';
			yourself.
	self assert: board lists size equals: 4.
	self
		assert: (board lists collect: #name) asSet
		equals: #('ASAP' 'Soon' 'Video' 'Others') asSet.
	self assert: (board lists collect: #size) asArray equals: #(3 2 1 1).
	^ board
]

{ #category : #example }
KBBoardExample >> database [
	<gtExample>
	| db |
	db := LeDatabase new.
	LeBasicDatabasesRegistry new
		defaultLogicalDatabase: (LeLogicalDatabase new primaryDB: db).
	db.
	^ db
]

{ #category : #example }
KBBoardExample >> databaseWithPages [
	<gtExample>
	| db |
	db := self database.
	self pageSpecs
		do: [ :dict | 
			db
				pageNamed: (dict at: #title)
				ifAbsent: [ db
						addPage: ((LePage named: (dict at: #title))
								addSnippet: (LeTextSnippet new
										string: (dict at: #tags);
										yourself);
								addSnippet: (LeTextSnippet new
										string: (dict at: #text);
										yourself);
								yourself) ] ].
	self assert: db pages size equals: 12.
	^ db
]

{ #category : #example }
KBBoardExample >> pageSpecs [
	<gtExample>
	^ {{#title -> 'Work on Kanban prototype'.
			#tags -> '[[ToDo]] [[ASAP]]'.
			#text -> 'We want Kanbans generated from Lepiter databases'}.
		{#title -> 'Create a Kanban test database'.
			#tags -> '[[ToDo]] [[ASAP]]'.
			#text -> 'We need a Lepiter database for testing'}.
		{#title -> 'Work  on test cases'.
			#tags -> '[[ToDo]] [[ASAP]]'.
			#text -> 'Test cases should use the test database'}.
		{#title -> 'Work on the Kanban UI'.
			#tags -> '[[ToDo]] [[Soon]]'.
			#text -> 'The graphical UI can come later, once the model is working'}.
		{#title -> 'Publish the Kanban demo'.
			#tags -> '[[ToDo]] [[Soon]]'.
			#text -> 'When this is working, publish the demo'}.
		{#title -> 'Create a video short'.
			#tags -> '[[ToDo]] [[Video]]'.
			#text -> 'At some point maybe create a short 7 minute video'}.
		{#title -> 'Write a blog post'.
			#tags -> '[[ToDo]]'.
			#text -> 'Maybe write a blog on the Kanban stuff'}.
		{#title -> 'Random thoughts'.
			#tags -> 'No tag for now'.
			#text -> 'SHould we also support a MinMap view?'}.
		{#title -> 'ToDo'.
			#tags -> ''.
			#text -> ''}.
		{#title -> 'ASAP'.
			#tags -> ''.
			#text -> ''}.
		{#title -> 'Soon'.
			#tags -> ''.
			#text -> ''}.
		{#title -> 'Video'.
			#tags -> ''.
			#text -> ''}
		} collect: #asDictionary
]
