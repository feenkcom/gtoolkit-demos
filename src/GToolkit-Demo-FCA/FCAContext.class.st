"
I am an implementation of Formal Concept Analysis for GT.
"
Class {
	#name : #FCAContext,
	#superclass : #Object,
	#instVars : [
		'elements',
		'properties',
		'incidence'
	],
	#category : #'GToolkit-Demo-FCA-Model'
}

{ #category : #accessing }
FCAContext class >> elements: elements properties: properties incidence: incidence [
	^ self new
		elements: elements;
		properties: properties;
		incidence: incidence;
		yourself
]

{ #category : #accessing }
FCAContext >> element: element hasProperty: property [
	^ self incidence value: element value: property
]

{ #category : #accessing }
FCAContext >> elements [
	^ elements
]

{ #category : #accessing }
FCAContext >> elements: aCollection [
	elements := aCollection collect: [ :each | FCAElement for: each ]
]

{ #category : #accessing }
FCAContext >> incidence [
	^ incidence
]

{ #category : #accessing }
FCAContext >> incidence: aTwoArgumentBlock [
	incidence := aTwoArgumentBlock
]

{ #category : #accessing }
FCAContext >> properties [
	^ properties
]

{ #category : #accessing }
FCAContext >> properties: aCollection [
	properties := aCollection collect: [ :each | FCAProperty for: each ]
]
