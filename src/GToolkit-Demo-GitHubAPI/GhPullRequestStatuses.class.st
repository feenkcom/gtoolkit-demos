Class {
	#name : #GhPullRequestStatuses,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #'as yet unclassified' }
GhPullRequestStatuses >> gtItemsFor: aView [
	^ aView columnedList
		title: 'Pull request statuses';
		priority: 1;
		items: [ self items ];
		column: 'Context'
			text: #context
			width: 130;
		column: 'Description' text: #description;
		column: 'State'
			text: #state
			width: 100
]

{ #category : #'as yet unclassified' }
GhPullRequestStatuses >> items [
	^ rawData collect: [ :each | GhPullRequestStatus new rawData: each ]
]
