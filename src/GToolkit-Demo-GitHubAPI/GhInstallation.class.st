Class {
	#name : #GhInstallation,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhInstallation >> accessToken [
	^ self 
		createFrom: 'access_tokens_url'
		with: [ :data | GhInstallationAccessToken new rawData: data ]
		onError: [ GhInstallationAccessToken new rawData: Dictionary new ]
]

{ #category : #accessing }
GhInstallation >> appId [
	^ rawData at: 'app_id' ifAbsent: [ '' ]
]

{ #category : #accessing }
GhInstallation >> appSlug [
	^ rawData at: 'app_slug'
]

{ #category : #accessing }
GhInstallation >> createdAt [
	^ rawData at: 'created_at' ifAbsent: [ nil ]
]

{ #category : #accessing }
GhInstallation >> repositorySelection [
	^ rawData at: 'repository_selection' ifAbsent: [ '' ]
]

{ #category : #accessing }
GhInstallation >> targetLogin [
	^ rawData at: 'target_login' ifAbsent: [ (rawData at: 'account' ifAbsent: [ Dictionary new ]) at: 'login' ifAbsent: [ '' ] ]
]
