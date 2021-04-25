Class {
	#name : #GtEvents,
	#superclass : #GhEntity,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#category : #'GToolkit-Demo-GitHubAPI'
}

{ #category : #accessing }
GtEvents >> items [
	^ rawData collect: [ :each | GhEvent new rawData: each ]
]
