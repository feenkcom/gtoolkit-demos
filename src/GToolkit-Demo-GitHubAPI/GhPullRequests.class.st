Class {
	#name : #GhPullRequests,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #'as yet unclassified' }
GhPullRequests >> gtItemsFor: aView [
	^ aView columnedList 
		title: 'Pull requests';
		priority: 1;
		items: [self items];
		column: 'Title' text: #title;
		column: 'User' text: #creator width: 100;
		column: 'Creation' text: #createdAt width: 150
]

{ #category : #'as yet unclassified' }
GhPullRequests >> items [
	^ rawData collect: [ :each | GhPullRequest new rawData: each ]
]
