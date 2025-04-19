Class {
	#name : #GhEvents,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #'as yet unclassified' }
GhEvents >> gtItemsFor: aView [
	^ aView columnedList
		title: 'Events';
		priority: 40;
		items: [ self ];
		column: 'Type' text: #type;
		column: 'Repository' text: #repoName;
		column: 'Timestamp' text: [:each | each creationTimestamp asLocalStringYMDHM ];
		column: 'Actor' text: #actorName
]

{ #category : #accessing }
GhEvents >> items [
	^ rawData collect: [ :each | GhEvent new rawData: each ]
]
