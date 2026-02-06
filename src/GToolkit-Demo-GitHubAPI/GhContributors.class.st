Class {
	#name : #GhContributors,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhContributors >> items [
	^ rawData collect: [ :each | GhContributor new rawData: each ]
]
