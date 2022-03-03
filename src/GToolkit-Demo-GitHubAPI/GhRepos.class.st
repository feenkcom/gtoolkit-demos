Class {
	#name : #GhRepos,
	#superclass : #GhGroup,
	#category : 'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhRepos >> items [
	^ rawData collect: [ :each | GhRepo new rawData: each ]
]
