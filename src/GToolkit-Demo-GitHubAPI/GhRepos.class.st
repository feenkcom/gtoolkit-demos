Class {
	#name : #GhRepos,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #search }
GhRepos >> gtSpotterForRepoNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Accounts';
		priority: 5;
		items: [ self items ];
		itemsLimit: Float infinity;
		itemName: #name;
		sendCategory: [ :aCategory :aStep :thisSearch | 
			| result |
			result := aCategory items contents.
			GhRepos new rawData: (result collect: #rawData) ];
		filterBySubstring
]

{ #category : #accessing }
GhRepos >> items [
	^ rawData collect: [ :each | GhRepo new rawData: each ]
]
