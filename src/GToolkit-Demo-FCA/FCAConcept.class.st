"
I model an FCA concept. I hold the source concept, an extent and an intent.
My extent is a BitSet of FCA Elements and my intent is a BitSet of FCA Properties.
"
Class {
	#name : #FCAConcept,
	#superclass : #Object,
	#instVars : [
		'context',
		'extent',
		'intent',
		'smaller',
		'bigger'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #'instance creation' }
FCAConcept class >> context: anFCAContext extent: anFCAElementBitSet intent: anFCAPropertyBitSet [
	^ FCAConcept new
		context: anFCAContext;
		extent: anFCAElementBitSet;
		intent: anFCAPropertyBitSet;
		yourself
]

{ #category : #comparing }
FCAConcept >> < otherConcept [
	^ self <= otherConcept and: [ self ~= otherConcept ]
]

{ #category : #comparing }
FCAConcept >> <= otherConcept [
	self == otherConcept ifTrue: [ ^ true ].
	(otherConcept class == self class) ifFalse: [ ^ false ].
	^ self extent <= otherConcept extent
]

{ #category : #comparing }
FCAConcept >> <> otherConcept [
	"self and other are incomparable"

	^ (self < otherConcept) not and: [ (self > otherConcept) not ]
]

{ #category : #comparing }
FCAConcept >> = other [
	self == other ifTrue: [ ^ true ].
	(other isKindOf: self class) ifFalse: [ ^ false ].
	^ self extent = other extent and: [ self intent = other intent ]
]

{ #category : #comparing }
FCAConcept >> > otherConcept [
	^ otherConcept < self
]

{ #category : #comparing }
FCAConcept >> >= otherConcept [
	^ otherConcept <= self
]

{ #category : #accessing }
FCAConcept >> bigger [
	"Directly bigger concepts."
	^ bigger ifNil: [ bigger := OrderedCollection new ]
]

{ #category : #accessing }
FCAConcept >> bigger: anObject [
	bigger := anObject
]

{ #category : #contracts }
FCAConcept >> checkInvariant [
	"Check that the definition of a context holds."
	
	self assert: self extent 
		equals: (self context tau: self intent).
	self assert: self intent 
		equals: (self context sigma: self extent)
]

{ #category : #accessing }
FCAConcept >> context [
	^ context
]

{ #category : #accessing }
FCAConcept >> context: anFCAContext [
	context := anFCAContext
]

{ #category : #printing }
FCAConcept >> deltaLabel [
	self intentDelta ifEmpty: [ ^ '()' ].
	^ '(' , (String cr join: (self intentDelta collect: #printString)) , ')'
]

{ #category : #accessing }
FCAConcept >> extent [
	^ extent
]

{ #category : #accessing }
FCAConcept >> extent: anFCAElementBitSet [
	extent := anFCAElementBitSet
]

{ #category : #accessing }
FCAConcept >> extentDelta [
	"The new elements introduced by this concept (if any)."

	^ self extent
		difference: ((self smaller collect: #extent)
				inject: BitSet empty
				into: [ :union :each | union union: each ])
]

{ #category : #accessing }
FCAConcept >> fullSize [
	^ self extent size
]

{ #category : #view }
FCAConcept >> gtBiggerFor: aView [
	<gtView>
	self bigger isEmpty ifTrue: [ ^ aView empty ].
	^ aView forward
		title: 'Bigger concepts';
		priority: 40;
		object: [ self bigger ];
		view: #gtItemsFor:
]

{ #category : #view }
FCAConcept >> gtDeltaExtentFor: aView [
	<gtView>
	self extentDelta isEmpty ifTrue: [ ^ aView empty ].
	^ aView columnedList
		title: 'Δ Extent';
		priority: 11;
		items: [ self extentDelta asOrderedCollection ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Elements' text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #view }
FCAConcept >> gtDeltaIntentFor: aView [
	<gtView>
	self intentDelta isEmpty ifTrue: [ ^ aView empty ].
	^ aView columnedList
		title: 'Δ Intent';
		priority: 21;
		items: [ self intentDelta asOrderedCollection ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Elements' text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #view }
FCAConcept >> gtExtentFor: aView [
	<gtView>
	self extent isEmpty ifTrue: [ ^ aView empty ].
	^ aView columnedList
		title: 'Extent';
		priority: 10;
		items: [ self extent asOrderedCollection ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Elements' text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #view }
FCAConcept >> gtIntentFor: aView [
	<gtView>
	self intent isEmpty ifTrue: [ ^ aView empty ].
	^ aView columnedList
		title: 'Intent';
		priority: 20;
		items: [ self intent asOrderedCollection ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Properties' text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #view }
FCAConcept >> gtSmallerFor: aView [
	<gtView>
	self smaller isEmpty ifTrue: [ ^ aView empty ].
	^ aView forward
		title: 'Smaller concepts';
		priority: 30;
		object: [ self smaller ];
		view: #gtItemsFor:
]

{ #category : #accessing }
FCAConcept >> gtSubLatticeFor: aView [
	<gtView>
	^ aView mondrian
		title: 'Sublattice';
		priority: 50;
		painting: [ :aMondrian | 
			self subContext latticeFor: aMondrian ];
		actionUpdateButton
]

{ #category : #comparing }
FCAConcept >> hash [
	^ self extent hash bitXor: self intent hash
]

{ #category : #accessing }
FCAConcept >> intent [
	^ intent
]

{ #category : #accessing }
FCAConcept >> intent: anFCAPropertyBitSet [
	intent := anFCAPropertyBitSet
]

{ #category : #accessing }
FCAConcept >> intentDelta [
	"The new properties introduced by this concept (if any)."

	^ self intent
		difference: ((self bigger collect: #intent)
				inject: BitSet empty
				into: [ :union :each | union union: each ])
]

{ #category : #combining }
FCAConcept >> join: other [
	| props |
	props := self intent intersection: other intent.
	^ FCAConcept
		context: self context
		extent: (self context tau: props)
		intent: props
]

{ #category : #combining }
FCAConcept >> meet: other [
	| elts |
	elts := self extent intersection: other extent.
	^ FCAConcept
		context: self context
		extent: elts
		intent: (self context sigma: elts)
]

{ #category : #mondrian }
FCAConcept >> mondrianNodeElement [
	"My size (area) reflects the incremental number of new elements in this concept.
	If that's zero, my background is cyan."

	| size background |
	size := (10 * (self extentDelta size + 1) nthRoot: 2) roundUpTo: 1.
	background := self extentDelta isEmpty
			ifTrue: [ Color lightCyan ]
			ifFalse: [ Color white ].
	^ BlElement new
		size: size @ size;
		border: (BlBorder paint: Color black width: 0.2);
		background: background;
		aptitude: (BrGlamorousWithTooltipAptitude content: self tooltip)
]

{ #category : #accessing }
FCAConcept >> printOn: aStream [
	self intent printElementsOn: aStream
]

{ #category : #accessing }
FCAConcept >> smaller [
	"Directly smaller concepts."
	^ smaller ifNil: [ smaller := OrderedCollection new ]
]

{ #category : #accessing }
FCAConcept >> smaller: anObject [
	smaller := anObject
]

{ #category : #accessing }
FCAConcept >> subContext [
	"Build a subcontext whose elements only have the properties of this concept."

	| properties elements |
	elements := (self context elements
			select: [ :each | each hasProperties: self intent ]) asOrderedCollection
			collect: #value.
	properties := self context properties asOrderedCollection collect: #value.
	^ (FCAContext
		elements: elements
		properties: properties
		propertyMap: #tags)
		printMessage: #title;
		yourself
]

{ #category : #mondrian }
FCAConcept >> tooltip [
	^ [ BrLabel new
		aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
		padding: (BlInsets all: 2);
		text: self printString;
		alignCenter ] asStencil
]
