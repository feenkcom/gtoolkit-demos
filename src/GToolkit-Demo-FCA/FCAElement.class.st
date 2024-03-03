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

{ #category : #accessing }
FCAElement class >> for: anObject in: aContext [
	^ self new
		rawElement: anObject;
		context: aContext;
		yourself
]

{ #category : #accessing }
FCAElement >> gtPropertiesFor: aView [
	<gtView>
	^ aView list
		title: 'Properties';
		priority: 10;
		items: [ self properties asOrderedCollection ]
]

{ #category : #testing }
FCAElement >> hasProperty: aProperty [
	^ self properties includes: aProperty
]

{ #category : #initialization }
FCAElement >> initialize [
	self properties: BitSet empty
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
