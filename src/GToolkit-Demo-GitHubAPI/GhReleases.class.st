Class {
	#name : #GhReleases,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #'as yet unclassified' }
GhReleases >> items [
	^ rawData collect: [ :each | GhRelease new rawData: each ]
]
