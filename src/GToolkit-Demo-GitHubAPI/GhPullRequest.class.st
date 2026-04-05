Class {
	#name : #GhPullRequest,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequest >> closedAt [
	^ (rawData at: 'closed_at') asDateAndTime
]

{ #category : #accessing }
GhPullRequest >> createdAt [
	^ (rawData at: 'created_at') asDateAndTime
]

{ #category : #accessing }
GhPullRequest >> creator [
	^ GhContributor new rawData: (rawData at: 'user')
]

{ #category : #'gt-extensions' }
GhPullRequest >> gtWebViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'WebView';
		stencil: [ GtWebViewElement new url: self htmlUrl ]
]

{ #category : #accessing }
GhPullRequest >> htmlUrl [
	^ rawData at: 'html_url'
]

{ #category : #accessing }
GhPullRequest >> leadDuration [
	^ self closedAt - self createdAt
]

{ #category : #accessing }
GhPullRequest >> title [
	^ rawData at: 'title'
]

{ #category : #accessing }
GhPullRequest >> url [
	^ rawData at: 'url'
]
