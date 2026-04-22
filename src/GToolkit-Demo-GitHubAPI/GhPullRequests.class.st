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
		items: [ self items ];
		column: 'Title' text: #title;
		column: 'Is pending'
			textFuture: [ :aPR | [ aPR isAnyStatusPendingState ] asAsyncFuture ]
			pending: [ :aTheme | '...' asRopedText foreground: aTheme button disabledTextColor ]
			success: [ :aBoolean :aTheme | 
				aBoolean
					ifTrue: [ 'yes' ]
					ifFalse: [ 'no' asRopedText foreground: aTheme button disabledTextColor ] ]
			width: 100;
		column: 'User'
			text: #creator
			width: 130;
		column: 'Creation'
			text: [ :aPR | aPR createdAt asDate ]
			width: 100;
		column: 'Updated'
			text: [ :aPR | 
				aPR updatedAt
					ifNotNil: [ :aDate | '{1} ago' format: {(DateAndTime now - aDate) gtHumanReadableString} ]
					ifNil: [ '' ] ]
			width: 100
]

{ #category : #'as yet unclassified' }
GhPullRequests >> items [
	^ rawData collect: [ :each | GhPullRequest new rawData: each ]
]
