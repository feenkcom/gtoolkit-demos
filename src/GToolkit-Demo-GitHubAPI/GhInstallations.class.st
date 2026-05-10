Class {
	#name : #GhInstallations,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #'gt-extensions' }
GhInstallations >> gtItemsFor: aView [
	^ aView columnedList
		title: 'Installations';
		priority: 40;
		items: [ self ];
		column: 'App' text: #appSlug;
		column: 'Target' text: #targetLogin;
		column: 'Repository selection' text: #repositorySelection;
		column: 'Created' text: [ :each | each createdAt ifNotNil: #asString ifNil: [ '' ] ]
]

{ #category : #accessing }
GhInstallations >> items [
	^ (rawData at: 'installations' ifAbsent: [ #() ])
		collect: [ :each | GhInstallation new rawData: each ]
]
