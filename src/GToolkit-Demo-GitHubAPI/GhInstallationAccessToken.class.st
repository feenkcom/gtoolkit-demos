"
Represents a GitHub installation access token response.
"
Class {
	#name : #GhInstallationAccessToken,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhInstallationAccessToken >> token [
	^ rawData at: 'token' ifAbsent: [ '' ]
]
