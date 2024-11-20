Class {
	#name : #GhRepos,
	#superclass : #GhGroup,
	#instVars : [
		'repos'
	],
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #dbc }
GhRepos >> assertInvariant [
	self
		assert: ((rawData isNotNil and: [ rawData isCollection ])
				or: [ repos isNotNil and: [ repos isCollection ] ])
		description: 'Either repos or rawData must be initialized to a collection'
]

{ #category : #search }
GhRepos >> gtSpotterForRepoNames: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 5;
		items: [ self repos ];
		itemsLimit: Float infinity;
		itemName: #name;
		sendCategory: [ :aCategory :aStep :thisSearch | 
			GhRepos new repos: aCategory items contents ];
		filterBySubstring
]

{ #category : #accessing }
GhRepos >> items [
	^ self repos
]

{ #category : #accessing }
GhRepos >> repos [
	^ repos
		ifNil: [ self assertInvariant.
			self repos: (rawData collect: [ :each | GhRepo new rawData: each ]) ]
]

{ #category : #accessing }
GhRepos >> repos: anObject [
	repos := anObject
]
