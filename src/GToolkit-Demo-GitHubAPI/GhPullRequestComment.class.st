Class {
	#name : #GhPullRequestComment,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequestComment >> body [
	^ rawData at: #body
]

{ #category : #accessing }
GhPullRequestComment >> createdAt [
	^ rawData
		at: #created_at
		ifPresent: [ :aString | aString asDateAndTime ]
		ifAbsent: [ nil ]
]

{ #category : #accessing }
GhPullRequestComment >> user [
	^ rawData
		at: #user
		ifPresent: [ :aData | GhContributor new rawData: aData ]
		ifAbsent: [ nil ]
]
