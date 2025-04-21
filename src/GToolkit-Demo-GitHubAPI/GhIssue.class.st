Class {
	#name : #GhIssue,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhIssue >> closedAt [
	^ rawData at: 'closed_at'
]

{ #category : #accessing }
GhIssue >> createdAt [
	^ rawData at: 'created_at'
]

{ #category : #accessing }
GhIssue >> creator [
	^ GhContributor new rawData: (rawData at: 'user')
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

{ #category : #accessing }
GhIssue >> title [
	^ rawData at: 'title'
]

{ #category : #accessing }
GhIssue >> url [
	^ rawData at: 'url'
]
