"
I am an abstract superclass of entities in a given FCA context.
"
Class {
	#name : #FCAInContext,
	#superclass : #Object,
	#instVars : [
		'context'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #testing }
FCAInContext class >> isAbstract [
	^ self = FCAInContext
]

{ #category : #comparing }
FCAInContext >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self value = anObject value
]

{ #category : #accessing }
FCAInContext >> context [
	^ context
]

{ #category : #accessing }
FCAInContext >> context: anObject [
	context := anObject
]

{ #category : #printing }
FCAInContext >> gtDisplayOn: stream [
	stream nextPutAll: self value printString
]

{ #category : #accessing }
FCAInContext >> gtLiveFor: aView [
	<gtView>
	^ aView forward
		title: 'Live';
		priority: 20;
		object: [self value];
		view: #gtLiveFor:;
		actionUpdateButton
]

{ #category : #comparing }
FCAInContext >> hash [
	^ self value hash
]

{ #category : #accessing }
FCAInContext >> value [
	^ self subclassResponsibility
]
