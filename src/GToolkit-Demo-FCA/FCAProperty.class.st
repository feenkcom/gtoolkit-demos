"
I encapsulate aproperty of an element in an FCA Context.
"
Class {
	#name : #FCAProperty,
	#superclass : #FCAInContext,
	#instVars : [
		'property'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #accessing }
FCAProperty class >> for: anObject in: aContext [
	^ self new
		property: anObject;
		context: aContext;
		yourself
]

{ #category : #accessing }
FCAProperty >> elements [
	^ self context elements
		select: [ :element | self context element: element value hasProperty: self value ]
]

{ #category : #printing }
FCAProperty >> gtDisplayOn: stream [
	stream nextPutAll: property printString
]

{ #category : #accessing }
FCAProperty >> gtElementsFor: aView [
	<gtView>
	^ aView list
		title: 'Elements';
		priority: 10;
		items: [ self elements ]
]

{ #category : #accessing }
FCAProperty >> property [
	^ property
]

{ #category : #accessing }
FCAProperty >> property: anObject [
	property := anObject
]

{ #category : #accessing }
FCAProperty >> value [
	^ self property
]
