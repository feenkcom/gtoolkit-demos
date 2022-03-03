Class {
	#name : #GhEvent,
	#superclass : #GhEntity,
	#category : 'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhEvent >> actorName [
	^ (self rawData at: 'actor') at: 'display_login'
]

{ #category : #accessing }
GhEvent >> creationTimestamp [
	^ (rawData at: 'created_at') asDateAndTime
]

{ #category : #accessing }
GhEvent >> repoName [
	^ (((self rawData at: 'repo') at: 'url') piecesCutWhere: [:a :b | a = $/]) last
]

{ #category : #accessing }
GhEvent >> type [
	^ (self rawData at: 'type') removeSuffix: 'Event'
]
