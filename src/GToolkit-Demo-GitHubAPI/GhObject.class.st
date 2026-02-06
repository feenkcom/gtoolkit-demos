Class {
	#name : #GhObject,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhObject >> rawData [
	^ rawData ifNil: [ Dictionary new ]
]

{ #category : #accessing }
GhObject >> rawData: dictionary [ 
	rawData := dictionary
]
