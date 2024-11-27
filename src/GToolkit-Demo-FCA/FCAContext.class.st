"
I am an implementation of Formal Concept Analysis for GT.
I am instantiated with (1) a collection of elements, (2) a collection of properties, and (3) a mapping from elements to their properties.
For example:
```
FCAContext
	elements: #(a b c)
	properties: #(x y)
	propertyMap: [ :elt | 
		{#a -> #(x).
			#b -> #(y).
			#c -> #(x y)} asDictionary at: elt ]
```

You can also send me `printMessage:` (respectively `propertyPrintMessage:` or `elementPrintMessage:`) to change the default printing of elements or properties from `printString`.
"
Class {
	#name : #FCAContext,
	#superclass : #Object,
	#instVars : [
		'elements',
		'properties',
		'concepts',
		'elementPrintMessage',
		'propertyPrintMessage'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #accessing }
FCAContext class >> contextForDatabaseNamed: databaseName [
	| tags  pages database |
	database := LeDatabase databaseNamed: databaseName.
	pages := database pages.
	tags := pages flatCollect: #tags.

	^  (FCAContext
			elements: pages
			properties: tags
			propertyMap: #tags)
			printMessage: #title;
			yourself
]

{ #category : #'instance creation' }
FCAContext class >> elements: anElementCollection properties: aPropertyCollection propertyMap: anElementToPropertiesBlock [
	"Create wrapped elements and properties for the input data, and initialize their properties and elements slots with BitSets representing the incidence."

	| context wrappedElements wrappedProperties propertyMap |
	wrappedElements := (anElementCollection
			collect: [ :each | FCAElement for: each ]) asBitSet.
	wrappedProperties := (aPropertyCollection
			collect: [ :each | FCAProperty for: each ]) asBitSet.

	context := self new
			elements: wrappedElements;
			properties: wrappedProperties.

	propertyMap := (wrappedProperties asOrderedCollection
			collect: [ :p | p value -> p ]) asDictionary.
	wrappedElements
		do: [ :elt | 
			| props |
			props := (((anElementToPropertiesBlock value: elt value)
					collect: [ :p | propertyMap at: p ifAbsent: nil ]) select: #notNil)
					asBitSet.
			elt properties: props.
			props do: [ :prop | prop elements add: elt ] ].

	^ context
]

{ #category : #accessing }
FCAContext class >> forDatabaseNamed: databaseName [
	"Generate an FCA context for all the pages and tags of a Lepiter database."

	| tags pages database |
	database := LeDatabase databaseNamed: databaseName.
	pages := database pages reject: #isUnnamedPage.
	tags := pages flatCollect: #tags.

	^ (FCAContext
		elements: pages
		properties: tags
		propertyMap: #tags)
		printMessage: #title;
		yourself
]

{ #category : #'instance creation' }
FCAContext class >> forDatabaseNamed: databaseName topTags: aNumber [
	"Generate an FCA context for all the pages and the top N tags of a Lepiter database."
	| tags pages database |
	database := LeDatabase databaseNamed: databaseName.
	pages := database pages reject: #isUnnamedPage.
	tags := ((pages flatCollect: #tags) asBag sortedCounts
			copyFrom: 1
			to: aNumber) collect: #value.
	^ (FCAContext
		elements: pages
		properties: tags
		propertyMap: [ :page | page tags intersection: tags ])
		printMessage: #title;
		yourself
]

{ #category : #accessing }
FCAContext class >> forDatabaseNamed: databaseName withOnlyTagsNamed: aTagNameCollection [
	"Generate an FCA context for all the pages and the listed tags of a Lepiter database."

	| tags pages database |
	database := LeDatabase databaseNamed: databaseName.
	pages := database pages reject: #isUnnamedPage.
	tags := aTagNameCollection collect: [ :title | database pageNamed: title ].
	pages := pages select: [ :each | (tags intersection: each tags) notEmpty ].
	^ (FCAContext
		elements: pages
		properties: tags
		propertyMap: [ :page | page tags intersection: tags ])
		printMessage: #title;
		yourself
]

{ #category : #'instance creation' }
FCAContext class >> forDatabaseNamed: databaseName withOnlyTopTags: aNumber [
	"Generate an FCA context for just the pages with the top N tags of a Lepiter database."

	| tags pages database |
	database := LeDatabase databaseNamed: databaseName.

	pages := database pages reject: #isUnnamedPage.
	pages := pages reject: [ :each | each tags isEmpty ].
	tags := ((pages flatCollect: #tags) asBag sortedCounts copyFrom: 1 to: aNumber)
			collect: #value.
	pages := pages select: [ :each | (tags intersection: each tags) notEmpty ].

	^ (FCAContext
		elements: pages
		properties: tags
		propertyMap: [ :page | page tags intersection: tags ])
		printMessage: #title;
		yourself
]

{ #category : #'instance creation' }
FCAContext class >> forDatabaseNamed: databaseName withTagsNamed: aTagNameCollection [
	"Generate an FCA context for all the pages and the listed tags of a Lepiter database."
	| tags pages database |
	database := LeDatabase databaseNamed: databaseName.
	pages := database pages reject: #isUnnamedPage.
	tags := aTagNameCollection collect: [ :title | database pageNamed: title ].
	^ (FCAContext
		elements: pages
		properties: tags
		propertyMap: [ :page | page tags intersection: tags ])
		printMessage: #title;
		yourself
]

{ #category : #accessing }
FCAContext >> bigraphFor: mondrian [
	| nodes |
	nodes := self elements asOrderedCollection copyWithAll: self properties.

	mondrian nodes
		shape: [ :each | each bigraphNodeElement ];
		with: nodes.
	mondrian edges
		stencil: [ BlLineElement new
				border: (BlBorder paint: (Color lightGray alpha: 0.4) width: 0.2) ];
		connectToAll: [ :node | node isProperty ifTrue: [ node elements ] ifFalse: [ node properties ] ].
	mondrian layout force.
	^ mondrian
]

{ #category : #computing }
FCAContext >> bottomUpBuilder [
	^ FCABottomUpConceptBuilder new
		context: self;
		yourself
]

{ #category : #computing }
FCAContext >> builder [
	^ self bottomUpBuilder
]

{ #category : #contracts }
FCAContext >> checkInvariant [
	"NB: can be a bit slow to check"

	self elements
		do: [ :elt | 
			self properties
				do: [ :prop | 
					self
						assert: (elt properties includes: prop)
						equals: (prop elements includes: elt) ] ].
	^ self
]

{ #category : #computing }
FCAContext >> closureFor: anFCAElementBitSet [
	| props elts |
	props := self sigma: anFCAElementBitSet.
	elts := self tau: props.
	^ FCAConcept
		context: self
		extent: elts
		intent: props
]

{ #category : #accessing }
FCAContext >> concepts [
	^ concepts
		ifNil: [ concepts := self builder computeConcepts asOrderedCollection ]
]

{ #category : #accessing }
FCAContext >> conceptsSortedBySize [
	^ self concepts sorted: [ :c1 :c2 | c1 extent size > c2 extent size ]
]

{ #category : #printing }
FCAContext >> defaultPrintMessage [
	"The default message to send to a raw element or property to ge a printable String."
	^ #printString
]

{ #category : #accessing }
FCAContext >> edges [
	^ self concepts flatCollect: [ :c1 | c1 smaller collect: [ :c2 | c1 -> c2 ] ]
]

{ #category : #printing }
FCAContext >> elementPrintMessage [
	^ elementPrintMessage ifNil: [ self defaultPrintMessage ]
]

{ #category : #printing }
FCAContext >> elementPrintMessage: aSymbol [
	elementPrintMessage := aSymbol
]

{ #category : #accessing }
FCAContext >> elements [
	^ elements
]

{ #category : #accessing }
FCAContext >> elements: aBitSet [
	elements := aBitSet.
	elements do: [ :each | each context: self ]
]

{ #category : #accessing }
FCAContext >> gtBigraphFor: aView [
	"This can be very slow to display so we move the view to the end if it's too big."

	<gtView>
	| maxSize title priority |
	maxSize := 200.
	title := 'Bigraph'.
	priority := 60.
	self elements size + self properties size > maxSize
		ifTrue: [ title := 'Bigraph (slow)'.
			priority := 160 ].
	^ aView mondrian
		title: title;
		priority: priority;
		painting: [ :aMondrian | self bigraphFor: aMondrian ];
		actionUpdateButton
]

{ #category : #view }
FCAContext >> gtConceptsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Concepts';
		priority: 30;
		items: [ self conceptsSortedBySize ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: '#Elements'
			text: [ :item | item extent size printString ]
			width: 80;
		column: '#Properties'
			text: [ :item | item intent size printString ]
			width: 80;
		column: 'ΔProperties'
			text: [ :item | item deltaLabel ]
			width: 100;
		column: 'Properties'
			text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #view }
FCAContext >> gtElementsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Elements';
		priority: 10;
		items: [ self elements asOrderedCollection ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Elements' text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #view }
FCAContext >> gtIncidenceFor: aView [
	"See also Array2D>>#gtTableFor:"

	<gtView>
	| view |
	view := aView columnedList
			title: 'Incidence';
			priority: 40;
			items: [ self elements asOrderedCollection ];
			column: 'Index'
				text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
				width: 45;
			column: 'Element'
				text: [ :element | element ]
				width: 100.

	self properties
		do: [ :property | 
			view
				column: property value printString
				text: [ :element | (element hasProperty: property) ifTrue: [ 'x' ] ifFalse: [ '' ] ]
				width: 60 ].

	^ view actionUpdateButton
]

{ #category : #accessing }
FCAContext >> gtLatticeFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Lattice';
		priority: 50;
		painting: [ :aMondrian | 
			self latticeFor: aMondrian ];
		actionUpdateButton
]

{ #category : #view }
FCAContext >> gtPropertiesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Properties';
		priority: 20;
		items: [ self properties asOrderedCollection ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Properties' text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #accessing }
FCAContext >> latticeFor: aMondrian [
	| nodes |
	nodes := self concepts.
	aMondrian nodes
		shape: [ :each | each mondrianNodeElement ];
		with: nodes.
	aMondrian edges
		connect: self edges
		from: #key
		to: #value.
	"aMondrian layout tree."
	"aMondrian layout dominanceTree."
	aMondrian layout sugiyama.
	^ aMondrian
]

{ #category : #accessing }
FCAContext >> latticeFor: aMondrian withPositions: aPointCollection [
	| nodes |
	nodes := self concepts.
	aMondrian nodes
		shape: [ :each | each mondrianNodeElement ];
		with: nodes.
	aMondrian edges
		connect: self edges
		from: #key
		to: #value.

	aMondrian layout custom: BlBasicLayout new.
	aMondrian root children
		withIndexDo: [ :child :n | child relocate: (aPointCollection at: n) ].

	^ aMondrian
]

{ #category : #printing }
FCAContext >> printMessage: aSymbol [
	self elementPrintMessage: aSymbol.
	self propertyPrintMessage: aSymbol
]

{ #category : #accessing }
FCAContext >> properties [
	^ properties
]

{ #category : #accessing }
FCAContext >> properties: aBitSet [
	properties := aBitSet.
	properties do: [ :each | each context: self ]
]

{ #category : #printing }
FCAContext >> propertyPrintMessage [
	^ propertyPrintMessage ifNil: [ self defaultPrintMessage ]
]

{ #category : #printing }
FCAContext >> propertyPrintMessage: aSymbol [
	propertyPrintMessage := aSymbol
]

{ #category : #computing }
FCAContext >> sigma: anElementBitSet [
	"Compute the common properties of the element set."

	^ anElementBitSet
		inject: self properties
		into: [ :result :elt | result intersection: elt properties ]
]

{ #category : #accessing }
FCAContext >> simpleLatticeFor: aMondrian [
	"Bare bones lattice without sizes, labels or tooltips."

	| nodes |
	nodes := self concepts.
	aMondrian nodes
		shape: [ :x | 
			BlElement new
				size: 10 @ 10;
				border: Color black;
				background: Color white ];
		with: nodes.
	aMondrian edges
		connect: self edges
		from: #key
		to: #value.
	aMondrian layout tree.
	^ aMondrian
]

{ #category : #computing }
FCAContext >> tau: anPropertyBitSet [
	"Compute the common elements of the property set."

	^ anPropertyBitSet
		inject: self elements
		into: [ :result :prop | result intersection: prop elements ]
]

{ #category : #accessing }
FCAContext >> top [
	^ self concepts detect: [ :c | c intent isEmpty ]
]
