Class {
	#name : #Subtitle,
	#superclass : #Object,
	#instVars : [
		'number',
		'lines',
		'start',
		'end',
		'newStart',
		'newEnd'
	],
	#category : #'GToolkit-Demo-Subtitles-Model'
}

{ #category : #comparing }
Subtitle >> = other [
	self == other ifTrue: [ ^ true ].
	self class = other class ifFalse: [ ^ false ].
	^ self number = other number
		and: [ self start = other start
				and: [ self end = other end and: [ self lines = other lines ] ] ]
]

{ #category : #conversion }
Subtitle >> asDuration: aTime [
	"Add a DAYS field and change the comma to a period."
	^ ('00:' , aTime replaceAll: $, with: $.) asDuration
]

{ #category : #accessing }
Subtitle >> end [
	^ end
]

{ #category : #accessing }
Subtitle >> end: aDuration [
	end := aDuration.
	self newEnd: end.
]

{ #category : #accessing }
Subtitle >> endAsDuration: aDuration [
	self end: (self asDuration: aDuration)
]

{ #category : #accessing }
Subtitle >> gtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Items';
		priority: 10;
		object: [ {'number' -> self number asString.
				'start' -> self start asString.
				'end' -> self end asString.
				'lines' -> (' ' join: self lines)} asOrderedDictionary ];
		view: #gtItemsFor:
]

{ #category : #comparing }
Subtitle >> hash [
	^ self lines hash
]

{ #category : #accessing }
Subtitle >> initialize [
	number := 1.
	lines := OrderedCollection new.
	start := Duration new.
	end := Duration new.
]

{ #category : #accessing }
Subtitle >> joinedLines [
	^ ' ' join: self lines
]

{ #category : #accessing }
Subtitle >> lines [
	^ lines
]

{ #category : #accessing }
Subtitle >> lines: aCollection [
	lines := aCollection asOrderedCollection
]

{ #category : #accessing }
Subtitle >> newEnd [
	^ newEnd
]

{ #category : #accessing }
Subtitle >> newEnd: aDuration [
	newEnd := aDuration
]

{ #category : #accessing }
Subtitle >> newStart [
	^ newStart
]

{ #category : #accessing }
Subtitle >> newStart: aDuration [
	newStart := aDuration
]

{ #category : #accessing }
Subtitle >> number [
	^ number
]

{ #category : #accessing }
Subtitle >> number: anInteger [
	number := anInteger
]

{ #category : #accessing }
Subtitle >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: self number asString;
		nextPutAll: ', ';
		nextPutAll: self start asString;
		nextPutAll: ')'
]

{ #category : #accessing }
Subtitle >> start [
	^ start
]

{ #category : #accessing }
Subtitle >> start: aDuration [
	start := aDuration.
	self newStart: start.
]

{ #category : #accessing }
Subtitle >> startAsDuration: aDuration [
	self start: (self asDuration: aDuration)
]
