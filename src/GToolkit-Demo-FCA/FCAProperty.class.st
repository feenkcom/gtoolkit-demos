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
	"NB: Set context later"
	^ self new
		rawProperty: anObject;
		yourself
]

{ #category : #deprecated }
FCAProperty class >> for: anObject in: aContext [
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
	^ elements ifNil: [ elements := self context emptyBitSet ]
]

{ #category : #accessing }
FCAProperty >> elements: aBitSet [
	elements := aBitSet
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
