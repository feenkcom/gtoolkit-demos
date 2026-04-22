Class {
	#name : #GhPullRequest,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequest >> closedAt [
	^ (rawData at: 'closed_at') ifNotNil: #asDateAndTime
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
GhPullRequest >> gtActionWebBrowseFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Open in browser';
		priority: 10;
		icon: BrGlamorousVectorIcons web;
		action: [ WebBrowser openOn: self htmlUrl ]
]

{ #category : #'gt-extensions' }
GhPullRequest >> gtStatusesFor: aView [
	<gtView>
	^ aView forward
		priority: 1;
		title: 'Statuses';
		object: [ self statuses ];
		view: #gtItemsFor:
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

{ #category : #testing }
GhPullRequest >> isAnyStatusPendingState [
	^ self statuses anySatisfy: #isPendingState
]

{ #category : #accessing }
GhPullRequest >> leadDuration [
	^ self closedAt ifNotNil: [ :aClosedTime | aClosedTime - self createdAt ]
]

{ #category : #accessing }
GhPullRequest >> statuses [
	^ self
		createFrom: 'statuses_url'
		with: [ :data | GhPullRequestStatuses new rawData: data ]
		onError: [ GhPullRequestStatuses new ]
]

{ #category : #accessing }
GhPullRequest >> title [
	^ rawData at: 'title'
]

{ #category : #accessing }
GhPullRequest >> updatedAt [
	^ (rawData at: 'updated_at') ifNotNil: #asDateAndTime
]

{ #category : #accessing }
GhPullRequest >> url [
	^ rawData at: 'url'
]
