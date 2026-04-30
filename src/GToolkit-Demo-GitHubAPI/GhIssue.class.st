Class {
	#name : #GhIssue,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhIssue >> closedAt [
	^ (rawData at: 'closed_at') asDateAndTime
]

{ #category : #accessing }
GhIssue >> createdAt [
	^ (rawData at: 'created_at') asDateAndTime
]

{ #category : #accessing }
GhIssue >> creator [
	^ GhContributor new rawData: (rawData at: 'user')
]

{ #category : #'as yet unclassified' }
GhIssue >> gtDisplayOn: aStream [
	aStream 
		nextPutAll: self creator loginName;
		nextPutAll: ': ';
		nextPutAll: self title;
		nextPutAll: ' (';
		nextPutAll: self state;
		nextPutAll: ')'
]

{ #category : #views }
GhIssue >> gtWebViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'WebView';
		stencil: [ GtWebViewElement new url: self htmlUrl ]
]

{ #category : #accessing }
GhIssue >> htmlUrl [
	^ rawData at: 'html_url'
]

{ #category : #accessing }
GhIssue >> leadDuration [
	^ self closedAt - self createdAt
]

{ #category : #'as yet unclassified' }
GhIssue >> state [
	^ rawData at: 'state'
]

{ #category : #accessing }
GhIssue >> title [
	^ rawData at: 'title'
]

{ #category : #accessing }
GhIssue >> url [
	^ rawData at: 'url'
]
