Class {
	#name : #Animal,
	#superclass : #Object,
	#instVars : [
		'weight',
		'name'
	],
	#category : #'GToolkit-Demo-Pharo101'
}

{ #category : #accessing }
Animal >> eat [ 
	weight := weight + 1
]

{ #category : #accessing }
Animal >> initialize [
	weight := 20.
	name := 'animal'.
]

{ #category : #accessing }
Animal >> name [ 
	^ name
]

{ #category : #accessing }
Animal >> name: aName [
	name := aName
]

{ #category : #accessing }
Animal >> speak [
	^ GtTranscript new show: 'This ', name, ' makes a noise'.
]

{ #category : #accessing }
Animal >> weight [
	^ weight
]

{ #category : #accessing }
Animal >> weight: aWeight [
	weight := aWeight
]
