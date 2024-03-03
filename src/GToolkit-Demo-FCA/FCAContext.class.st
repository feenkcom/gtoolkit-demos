"
I am an implementation of Formal Concept Analysis for GT.
"
Class {
	#name : #FCAContext,
	#superclass : #Object,
	#instVars : [
		'elements',
		'properties',
		'incidence'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #'instance creation' }
FCAContext class >> elements: anElementCollection properties: aPropertyCollection propertyMap: anElementToPropertiesBlock [
	"Create wrapped elements and properties for the input data, and initialize their properties and elements slots with BitSets representing the incidence."

	| context wrappedElements wrappedProperties propertyMap |
	wrappedElements := (anElementCollection
			collect: [ :each | FCAElement for: each in: context ]) asBitSet.
	wrappedProperties := (aPropertyCollection
			collect: [ :each | FCAProperty for: each in: context ]) asBitSet.
	context := self new
			elements: wrappedElements;
			properties: wrappedProperties;
			yourself.

	propertyMap := (wrappedProperties asOrderedCollection
			collect: [ :p | p value -> p ]) asDictionary.
	wrappedElements
		do: [ :elt | 
			| props |
			props := ((anElementToPropertiesBlock value: elt value)
					collect: [ :p | propertyMap at: p ]) asBitSet.
			elt properties: props.
			props do: [ :prop | prop elements add: elt ] ].

	^ context
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

{ #category : #accessing }
FCAContext >> elements [
	^ elements
]

{ #category : #accessing }
FCAContext >> elements: aBitSet [
	elements := aBitSet
]

{ #category : #view }
FCAContext >> gtElementsFor: aView [
	<gtView>
	^ aView list
		title: 'Elements';
		priority: 10;
		items: [ self elements asOrderedCollection ]
]

{ #category : #view }
FCAContext >> gtIncidenceFor: aView [
	"See also Array2D>>#gtTableFor:"

	<gtView>
	| view |
	view := aView columnedList
			title: 'Incidence';
			priority: 30;
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

{ #category : #view }
FCAContext >> gtPropertiesFor: aView [
	<gtView>
	^ aView list
		title: 'Properties';
		priority: 20;
		items: [ self properties asOrderedCollection ]
]

{ #category : #accessing }
FCAContext >> properties [
	^ properties
]

{ #category : #accessing }
FCAContext >> properties: aBitSet [
	properties := aBitSet
]

{ #category : #computing }
FCAContext >> sigma: anElementBitSet [
	"Compute the common properties of the element set."

	^ anElementBitSet
		inject: self properties
		into: [ :result :elt | result intersection: elt properties ]
]

{ #category : #computing }
FCAContext >> tau: anPropertyBitSet [
	"Compute the common elements of the property set."

	^ anPropertyBitSet
		inject: self elements
		into: [ :result :prop | result intersection: prop elements ]
]
