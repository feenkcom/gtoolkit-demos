"
I encapsulate an object used as an element in an FCA Context.
"
Class {
	#name : #FCAElement,
	#superclass : #FCAInContext,
	#instVars : [
		'rawElement',
		'properties'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #'instance creation' }
FCAElement class >> for: anObject [
	^ self new
		rawElement: anObject;
		yourself
]

{ #category : #deprecated }
FCAElement class >> for: anObject in: aContext [
	self deprecated: 'Use for: and set context later from the context itself.'.
	^ self new
		rawElement: anObject;
		context: aContext;
		yourself
]

{ #category : #view }
FCAElement >> gtPropertiesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Properties';
		priority: 30;
		items: [ self properties asOrderedCollection ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Properties' text: [ :item | item printString ];
		actionUpdateButton
]

{ #category : #action }
FCAElement >> gtSpawnRawElementFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Inspect raw element';
		priority: 20;
		icon: BrGlamorousIcons into;
		action: [ :element | element phlow spawnObject: self rawElement ]
]

{ #category : #testing }
FCAElement >> hasProperties: aPropertyBitSet [
	^ self properties includesAll: aPropertyBitSet
]

{ #category : #testing }
FCAElement >> hasProperty: aProperty [
	^ self properties includes: aProperty
]

{ #category : #initialization }
FCAElement >> initialize [
	self properties: BitSet empty
]

{ #category : #printing }
FCAElement >> printOn: stream [
	stream nextPutAll: (self value perform: self context elementPrintMessage)
]

{ #category : #accessing }
FCAElement >> properties [
	^ properties
]

{ #category : #accessing }
FCAElement >> properties: anObject [
	properties := anObject
]

{ #category : #accessing }
FCAElement >> rawElement [
	^ rawElement
]

{ #category : #accessing }
FCAElement >> rawElement: anObject [
	rawElement := anObject
]

{ #category : #accessing }
FCAElement >> value [
	^ self rawElement
]
