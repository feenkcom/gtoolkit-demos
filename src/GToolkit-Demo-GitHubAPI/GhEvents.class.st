Class {
	#name : #GhEvents,
	#superclass : #GhGroup,
	#category : 'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhEvents >> items [
	^ rawData collect: [ :each | GhEvent new rawData: each ]
]
