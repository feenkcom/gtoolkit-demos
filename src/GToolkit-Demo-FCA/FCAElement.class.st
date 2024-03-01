"
I encapsulate an object used as an element in an FCA Context.
"
Class {
	#name : #FCAElement,
	#superclass : #FCAInContext,
	#instVars : [
		'element'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #accessing }
FCAElement class >> for: anObject in: aContext [
	^ self new
		element: anObject;
		context: aContext;
		yourself
]

{ #category : #accessing }
FCAElement >> element [
	^ element
]

{ #category : #accessing }
FCAElement >> element: anObject [
	element := anObject
]

{ #category : #printing }
FCAElement >> gtDisplayOn: stream [
	stream nextPutAll: element printString
]

{ #category : #accessing }
FCAElement >> gtPropertiesFor: aView [
	<gtView>
	^ aView list
		title: 'Properties';
		priority: 10;
		items: [ self properties ]
]

{ #category : #accessing }
FCAElement >> properties [
	^ self context properties
		select: [ :property | self context element: self value hasProperty: property value ]
]

{ #category : #accessing }
FCAElement >> value [
	^ self element
]
