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

{ #category : #accessing }
FCAProperty class >> for: anObject in: aContext [
	^ self new
		rawProperty: anObject;
		context: aContext;
		yourself
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
	^ aView list
		title: 'Elements';
		priority: 10;
		items: [ self elements asOrderedCollection ]
]

{ #category : #initialization }
FCAProperty >> initialize [
	self elements: BitSet empty
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
FCAProperty >> value [
	^ self rawProperty
]
