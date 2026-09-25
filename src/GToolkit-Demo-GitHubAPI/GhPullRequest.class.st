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
GhPullRequest >> comments [
	^ self
		createFrom: 'comments_url'
		with: [ :data | GhPullRequestComments new rawData: data ]
		onError: [ GhPullRequestComments new ]
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
GhPullRequest >> gtCommentsFor: aView [
	<gtView>
	^ aView forward
		priority: 2;
		title: 'Comments';
		object: [ self comments ];
		view: #gtItemsFor:
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

{ #category : #testing }
GhPullRequest >> isAnyStatusPendingState [
	^ self statuses anySatisfy: #isPendingState
]

{ #category : #accessing }
GhPullRequest >> isDraft [
	^ rawData at: 'draft' ifAbsent: [ false ]
]

{ #category : #accessing }
GhPullRequest >> lastComment [
	^ self comments ifNotEmpty: #last ifEmpty: [ nil ]
]

{ #category : #accessing }
GhPullRequest >> lastCommentUser [
	^ self lastComment ifNotNil: #user
]

{ #category : #accessing }
GhPullRequest >> leadDuration [
	^ self closedAt ifNotNil: [ :aClosedTime | aClosedTime - self createdAt ]
]

{ #category : #accessing }
GhPullRequest >> repositoryFullName [
	"Answer 'owner/name' of the repository this pull request belongs to, or nil when the payload 
	says nothing about it."

	<return: #String or: nil>
	^ rawData
		at: 'repository_url'
		ifPresent: [ :anUrl | 
			| aPath |
			aPath := anUrl asZnUrl segments.
			aPath size >= 2
				ifTrue: [ (aPath at: aPath size - 1) , '/' , aPath last ]
				ifFalse: [ nil ] ]
		ifAbsent: [ 
			rawData
				at: 'base'
				ifPresent: [ :aBase | 
					(aBase at: 'repo' ifAbsent: [ nil ])
						ifNil: [ nil ]
						ifNotNil: [ :aRepo | aRepo at: 'full_name' ifAbsent: [ nil ] ] ]
				ifAbsent: [ nil ] ]
]

{ #category : #accessing }
GhPullRequest >> repositoryName [
	"Answer the repository name without its owner prefix, or nil when the payload says nothing about it."

	<return: #String or: nil>
	^ self repositoryFullName ifNotNil: [ :aFullName | aFullName copyAfterLast: $/ ]
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
