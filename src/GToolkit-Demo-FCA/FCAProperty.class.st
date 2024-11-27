"
I encapsulate aproperty of an element in an FCA Context.
"
Class {
	#name : #FCAProperty,
	#superclass : #FCAInContext,
	#instVars : [
		'rawProperty',
		'elements'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #'instance creation' }
FCAProperty class >> for: anObject [ 
	^ self new
		rawProperty: anObject;
		yourself
]

{ #category : #deprecated }
FCAProperty class >> for: anObject in: aContext [
	self deprecated: 'Use for: and set context later from the context itself.'.
	^ self new
		rawProperty: anObject;
		context: aContext;
		yourself
]

{ #category : #mondrian }
FCAProperty >> bigraphNodeColor [
	^ Color blue
]

{ #category : #accessing }
FCAProperty >> elements [
	^ elements
]

{ #category : #accessing }
FCAProperty >> elements: anObject [
	elements := anObject
]

{ #category : #accessing }
FCAProperty >> gtElementsFor: aView [
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

{ #category : #initialization }
FCAProperty >> initialize [
	self elements: BitSet empty
]

{ #category : #testing }
FCAProperty >> isProperty [
	^ true
]

{ #category : #printing }
FCAProperty >> printOn: stream [
	stream nextPutAll: (self value perform: self context propertyPrintMessage)
]

{ #category : #accessing }
FCAProperty >> rawProperty [
	^ rawProperty
]

{ #category : #accessing }
FCAProperty >> rawProperty: anObject [
	rawProperty := anObject
]

{ #category : #accessing }
FCAProperty >> rawValue [
	^ self rawProperty
]

{ #category : #accessing }
FCAProperty >> value [
	^ self rawProperty
]
