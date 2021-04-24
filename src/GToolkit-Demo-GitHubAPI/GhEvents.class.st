Class {
	#name : #GhEvents,
	#superclass : #GhEntity,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#category : #'GToolkit-Demo-GitHubAPI'
}

{ #category : #accessing }
GhEvents >> items [
	^ rawData collect: [ :each | GhEvent new rawData: each ]
]
