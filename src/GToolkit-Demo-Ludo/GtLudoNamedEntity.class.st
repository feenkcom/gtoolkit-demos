"
I am an abstract superclass of Ludo entities that have a printable name.
"
Class {
	#name : #GtLudoNamedEntity,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-Demo-Ludo-Model'
}

{ #category : #creation }
GtLudoNamedEntity class >> named: aString [
	^ self new
		  name: aString;
		  yourself
]

{ #category : #constants }
GtLudoNamedEntity >> defaultName [
	^ 'undefined'
]

{ #category : #printing }
GtLudoNamedEntity >> gtDisplayOn: aStream [
	aStream nextPutAll: self name
]

{ #category : #initialization }
GtLudoNamedEntity >> initialize [
	super initialize.
	name := self defaultName
]

{ #category : #accessing }
GtLudoNamedEntity >> name [
	^ name
]

{ #category : #accessing }
GtLudoNamedEntity >> name: aStringOrChar [
	name := aStringOrChar asString
]
