Class {
	#name : #GhPullRequestStatus,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequestStatus >> context [
	^ rawData at: 'context'
]

{ #category : #accessing }
GhPullRequestStatus >> description [
	^ rawData at: 'description'
]

{ #category : #testing }
GhPullRequestStatus >> isPendingState [
	"The state is a String from the GitHub JSON"

	^ self state = 'pending'
]

{ #category : #accessing }
GhPullRequestStatus >> state [
	^ rawData at: 'state'
]
