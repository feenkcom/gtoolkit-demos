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
	"NB: set context later"

	^ self new
		rawElement: anObject;
		yourself
]

{ #category : #deprecated }
FCAElement class >> for: anObject in: aContext [
	^ self new
		rawElement: anObject;
		context: aContext;
		yourself
]

{ #category : #mondrian }
FCAElement >> bigraphNodeColor [
	^ Color red
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

{ #category : #testing }
FCAElement >> hasProperties: aPropertyBitSet [
	^ self properties includesAll: aPropertyBitSet
]

{ #category : #testing }
FCAElement >> hasProperty: aProperty [
	^ self properties includes: aProperty
]

{ #category : #testing }
FCAElement >> isElement [
	^ true
]

{ #category : #printing }
FCAElement >> printOn: stream [
	stream nextPutAll: (self value perform: self context elementPrintMessage)
]

{ #category : #accessing }
FCAElement >> properties [
	^ properties ifNil: [ properties := self context emptyBitSet ]
]

{ #category : #accessing }
FCAElement >> properties: aBitSet [
	properties := aBitSet
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
FCAElement >> rawValue [
	^ self rawElement
]

{ #category : #accessing }
FCAElement >> value [
	^ self rawElement
]
