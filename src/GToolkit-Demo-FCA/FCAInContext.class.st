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

{ #category : #mondrian }
FCAInContext >> bigraphNodeColor [
	^ self subclassResponsibility
]

{ #category : #mondrian }
FCAInContext >> bigraphNodeElement [
	"We could override the default circle size in a data slot of the context."

	^ BlElement new
		geometry: BlCircleGeometry new;
		size: 2 @ 2;
		background: self bigraphNodeColor;
		aptitude: (BrGlamorousWithExplicitTooltipAptitude content: self tooltip)
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

{ #category : #action }
FCAInContext >> gtSpawnRawValueFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Inspect raw value';
		priority: 20;
		icon: BrGlamorousVectorIcons into;
		action: [ :element | element phlow spawnObject: self rawValue ]
]

{ #category : #comparing }
FCAInContext >> hash [
	^ self value hash
]

{ #category : #testing }
FCAInContext >> isElement [
	^ false
]

{ #category : #testing }
FCAInContext >> isProperty [
	^ false
]

{ #category : #action }
FCAInContext >> rawValue [
	^ self subclassResponsibility
]

{ #category : #mondrian }
FCAInContext >> tooltip [
	^ [ BrLabel new
		aptitude: BrGlamorousLabelAptitude new glamorousRegularFontAndSize;
		padding: (BlInsets all: 2);
		text: self printString;
		alignCenter ] asStencil
]

{ #category : #accessing }
FCAInContext >> value [
	^ self subclassResponsibility
]
