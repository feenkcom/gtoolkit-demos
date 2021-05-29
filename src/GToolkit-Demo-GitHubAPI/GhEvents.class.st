Class {
	#name : #GhEvents,
	#superclass : #GhGroup,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhEvents >> items [
	^ rawData collect: [ :each | GhEvent new rawData: each ]
]
