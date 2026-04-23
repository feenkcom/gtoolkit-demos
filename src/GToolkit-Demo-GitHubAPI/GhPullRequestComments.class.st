Class {
	#name : #GhPullRequestComments,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #'as yet unclassified' }
GhPullRequestComments >> gtItemsFor: aView [
	^ aView columnedList
		title: 'Pull request comments';
		priority: 1;
		items: [ self items ];
		column: 'Creation'
			text: [ :aComment | aComment createdAt ifNotNil: #asDate ]
			width: 120;
		column: 'User'
			text: [ :aComment | aComment user loginName ]
			width: 110;
		column: 'Body' text: #body
]

{ #category : #'as yet unclassified' }
GhPullRequestComments >> items [
	^ rawData collect: [ :each | GhPullRequestComment new rawData: each ]
]
