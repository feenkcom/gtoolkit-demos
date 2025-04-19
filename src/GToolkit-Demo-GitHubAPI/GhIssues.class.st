Class {
	#name : #GhIssues,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #'as yet unclassified' }
GhIssues >> gtItemsFor: aView [
	^ aView columnedList 
		title: 'Issues';
		priority: 1;
		items: [self items];
		column: 'Title' text: #title;
		column: 'User' text: #creator width: 100;
		column: 'Creation' text: #createdAt width: 150
]

{ #category : #'as yet unclassified' }
GhIssues >> items [
	^ rawData collect: [ :each | GhIssue new rawData: each ]
]
