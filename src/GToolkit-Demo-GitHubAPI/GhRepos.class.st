Class {
	#name : #GhRepos,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhRepos >> gtRawDataFor: aView [
	<gtView>
	^ aView list
		title: 'Raw data';
		items: [ self rawData ]
]

{ #category : #accessing }
GhRepos >> items [
	^ rawData collect: [ :each | GhRepo new rawData: each ]
]
