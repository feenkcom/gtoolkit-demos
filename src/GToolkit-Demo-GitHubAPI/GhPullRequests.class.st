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
			textFuture: [ :aPR :aRowIndex :aContext | [ aPR isAnyStatusPendingState ] asAsyncFuture ]
			pending: [ :aPR :aRowIndex :aContext | '...' asRopedText foreground: aContext theme button disabledTextColor ]
			success: [ :aBoolean :aContext | 
				aBoolean
					ifTrue: [ 'yes' ]
					ifFalse: [ 'no' asRopedText foreground: aContext theme button disabledTextColor ] ]
			width: 80;
		column: 'Last commenter'
			textFuture: [ :aPR :aRowIndex :aContext | aPR lastCommentUser ]
			pending: [ :aPR :aRowIndex :aContext | '...' asRopedText foreground: aContext theme button disabledTextColor ]
			success: [ :aUserOrNil :aContext | aUserOrNil ifNil: [ '' ] ]
			width: 110;
		column: 'User'
			text: #creator
			width: 100;
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
