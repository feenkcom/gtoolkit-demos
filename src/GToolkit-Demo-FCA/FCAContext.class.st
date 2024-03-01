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

{ #category : #accessing }
FCAContext class >> elements: elements properties: properties incidence: incidence [
	^ self new
		elements: elements;
		properties: properties;
		incidence: incidence;
		yourself
]

{ #category : #accessing }
FCAContext >> element: element hasProperty: property [
	"NB: The arguments are the raw objects, not the wrapped ones."

	^ self incidence value: element value: property
]

{ #category : #accessing }
FCAContext >> elements [
	^ elements
]

{ #category : #accessing }
FCAContext >> elements: aCollection [
	elements := aCollection collect: [ :each | FCAElement for: each ]
]

{ #category : #view }
FCAContext >> gtElementsFor: aView [
	<gtView>
	^ aView list
		title: 'Elements';
		priority: 10;
		items: [ self elements ]
]

{ #category : #view }
FCAContext >> gtIncidenceFor: aView [
	"See also Array2D>>#gtTableFor:"

	<gtView>
	| view |
	view := aView columnedList
			title: 'Incidence';
			priority: 30;
			items: [ self elements ];
			column: 'Index'
				text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
				width: 45;
			column: 'Element'
				text: [ :element | element ]
				width: 100.

	self properties
		do: [ :property | 
			view
				column: property property printString
				text: [ :element | (self element: element value hasProperty: property value ) ifTrue: [ 'x' ] ifFalse: [ '' ] ] 
				width: 60]
					.

	^ view actionUpdateButton
]

{ #category : #view }
FCAContext >> gtPropertiesFor: aView [
	<gtView>
	^ aView list
		title: 'Properties';
		priority: 20;
		items: [ self properties ]
]

{ #category : #accessing }
FCAContext >> incidence [
	^ incidence
]

{ #category : #accessing }
FCAContext >> incidence: aTwoArgumentBlock [
	incidence := aTwoArgumentBlock
]

{ #category : #accessing }
FCAContext >> properties [
	^ properties
]

{ #category : #accessing }
FCAContext >> properties: aCollection [
	properties := aCollection collect: [ :each | FCAProperty for: each ]
]
