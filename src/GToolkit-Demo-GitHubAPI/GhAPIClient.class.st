Class {
	#name : 'GhAPIClient',
	#superclass : 'Object',
	#category : 'GToolkit-Demo-GitHubAPI-Presentation'
}

{ #category : 'accessing' }
GhAPIClient >> get: anUrl onSuccess: aSuccessBlock onError: anErrorBlock [
	| result client |
	client := ZnClient new.
	result := client get: anUrl.
	^ client isSuccess 
		ifTrue: [ aSuccessBlock value: result ]
		ifFalse: [ anErrorBlock value ]
]
