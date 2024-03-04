"
I model an FCA concept. I hold the source concept, an extent and an intent.
My extend is a BitSet of FCA Elements and my intent is a BitSet of FCA Properties.
"
Class {
	#name : #FCAConcept,
	#superclass : #Object,
	#instVars : [
		'context',
		'extent',
		'intent'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #'instance creation' }
FCAConcept class >> context: anFCAContext extent: anFCAElementBitSet intent: anFCAPropertyBitSet [
	^ FCAConcept new
		context: anFCAContext;
		extent: anFCAElementBitSet;
		intent: anFCAPropertyBitSet;
		yourself
]

{ #category : #comparing }
FCAConcept >> = other [
	self == other ifTrue: [ ^ true ].
	(other isKindOf: self class) ifFalse: [ ^ false ].
	^ self extent = other extent and: [ self intent = other intent ]
]

{ #category : #contracts }
FCAConcept >> checkInvariant [
	"Check that the definition of a context holds."
	
	self assert: self extent 
		equals: (self context tau: self intent).
	self assert: self intent 
		equals: (self context sigma: self extent)
]

{ #category : #accessing }
FCAConcept >> context [
	^ context
]

{ #category : #accessing }
FCAConcept >> context: anFCAContext [
	context := anFCAContext
]

{ #category : #accessing }
FCAConcept >> extent [
	^ extent
]

{ #category : #accessing }
FCAConcept >> extent: anFCAElementBitSet [
	extent := anFCAElementBitSet
]

{ #category : #view }
FCAConcept >> gtExtentFor: aView [
	<gtView>
	^ aView forward
		title: 'Extent';
		priority: 10;
		object: [ self extent ];
		view: #gtItemsFor:
]

{ #category : #view }
FCAConcept >> gtIntentFor: aView [
	<gtView>
	^ aView forward
		title: 'Intent';
		priority: 20;
		object: [ self intent ];
		view: #gtItemsFor:
]

{ #category : #comparing }
FCAConcept >> hash [
	^ self extent hash bitXor: self intent hash
]

{ #category : #accessing }
FCAConcept >> intent [
	^ intent
]

{ #category : #accessing }
FCAConcept >> intent: anFCAPropertyBitSet [
	intent := anFCAPropertyBitSet
]

{ #category : #accessing }
FCAConcept >> printOn: aStream [
	self intent printElementsOn: aStream
]
