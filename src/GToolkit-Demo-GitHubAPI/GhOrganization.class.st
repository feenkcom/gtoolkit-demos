Class {
	#name : #GhOrganization,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhOrganization >> events [
	^ self 
		createFrom: 'events_url'
		with: [ :data | GhEvents new rawData: data ] 
		onError: [ GhEvents new ]
]

{ #category : #'as yet unclassified' }
GhOrganization >> gtDisplayOn: stream [
	stream nextPutAll: self login
]

{ #category : #accessing }
GhOrganization >> gtEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Events';
		priority: 50;
		items: [ self events ];
		column: 'Type' text: #type;
		column: 'Repository' text: #repoName;
		column: 'Timestamp' text: [:each | each creationTimestamp asLocalStringYMDHM ];
		column: 'Actor' text: #actorName
]

{ #category : #'gt-extensions' }
GhOrganization >> gtInstallationsFor: aView [
	<gtView>
	^ aView forward
		title: 'Installations';
		priority: 55;
		object: [ self installations ];
		view: #gtItemsFor:
]

{ #category : #views }
GhOrganization >> gtReposFor: aView [
	<gtView>
	| aList |
	aList := aView columnedList
			title: 'Repositories';
			priority: 40;
			items: [ self reposStream ];
			column: 'Repo' text: #name;
			column: 'Description'
				text: #description
				weight: 2;
			"GitHub's 'open_issues' counts open issues AND open pull requests, 
			so the title says so rather than promising an issues-only count."
			column: 'Open issues & PRs'
				text: [ :aRepo | 
					| aCount |
					aCount := aRepo numberOfOpenIssues.
					aCount isZero ifTrue: [ '' ] ifFalse: [ aCount ] ]
				width: 130.

	GtGitHubTokenHolder hasToken
		ifTrue: [ aList
				column: 'Open PRs'
				textFuture: [ :aRepo :aRowIndex :aContext | aRepo numberOfPullRequests ]
				pending: [ :aRepo :aRowIndex :aContext | '...' asRopedText foreground: aContext theme button disabledTextColor ]
				success: [ :aCount :aContext | aCount isZero ifTrue: [ '' ] ifFalse: [ aCount asString ] ] ].

	aList column: 'License' text: #licenseName.

	^ aList
]

{ #category : #searches }
GhOrganization >> gtSpotterForRepoNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Repositories';
		priority: 5;
		items: [ self reposStream ];
		itemsLimit: Float infinity;
		itemName: #name;
		sendCategory: [ :aCategory :aStep :thisSearch | GhRepos new repos: aCategory items contents ];
		filterBySubstring
]

{ #category : #accessing }
GhOrganization >> installations [
	| url |
	url := 'https://api.github.com/orgs/', self login, '/installations'.
	^ self httpClient
		get: url
		onSuccess: [ :result | 
			[ GhInstallations new rawData: (STON fromString: result) ]
				on: Error
				do: [ :e | GhInstallations new ] ]
		onError: [ GhInstallations new ]
]

{ #category : #'as yet unclassified' }
GhOrganization >> login [
	^ rawData at: 'login'
]

{ #category : #accessing }
GhOrganization >> propertyToClass [
	^ {
	'events' -> GhEvents.
	} asDictionary
]

{ #category : #accessing }
GhOrganization >> repos [
	"Answer all repositories of this organization, draining #reposStream.
	This blocks, and costs one request per page, so prefer #reposStream where laziness is possible."

	<return: #GhRepos>
	^ GhRepos new
		rawData: (((self paginatedStreamFrom: 'repos_url') toArray
			on: Error do: [ :anError | AsyncPoll ready: #() ])
				await: GhConstants executionConfiguration) wait
]

{ #category : #accessing }
GhOrganization >> reposStream [
	"Answer a stream over all repositories of this organization. The stream is pulled lazily, so a 
	view backed by it fetches only the pages it actually displays."

	<return: #TAsyncStream>
	^ (self paginatedStreamFrom: 'repos_url')
		collect: [ :each | GhRepo new rawData: each ]
]
