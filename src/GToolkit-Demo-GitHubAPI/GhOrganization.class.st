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

{ #category : #printing }
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
GhOrganization >> gtPullRequestsFor: aView [
	"Every open pull request across all repositories of this organization, newest first."

	<gtView>
	^ aView columnedList
		title: 'Pull requests';
		priority: 45;
		items: [ self pullRequestsStream ];
		column: 'Repository'
			text: [ :aPR | aPR repositoryName ifNil: [ '' ] ]
			width: 160;
		column: 'Pull request'
			text: #title
			weight: 3;
		column: 'Pending'
			textFuture: [ :aPR :aRowIndex :aContext | aPR isAnyStatusPendingState ]
			pending: [ :aPR :aRowIndex :aContext | '...' asRopedText foreground: aContext theme button disabledTextColor ]
			success: [ :aBoolean :aContext | 
				aBoolean
					ifTrue: [ 'yes' ]
					ifFalse: [ 'no' asRopedText foreground: aContext theme button disabledTextColor ] ]
			width: 65;
		column: 'Last commenter'
			textFuture: [ :aPR :aRowIndex :aContext | 
				aPR lastComment
					ifNotNil: [ :aComment | 
						| aText |
						aText := (aComment user ifNotNil: #loginName) asRopedText.
						aComment createdAt
							ifNotNil: [ :aDate | 
								| aDateText |
								aDateText := ' ' , (DateAndTime now - aDate) gtHumanReadableString
										, ' ago'.
								aText
									append: (aDateText asRopedText foreground: aContext theme button disabledTextColor) ].
						aText ]
					ifNil: [ '' ] ]
			pending: [ :aPR :aRowIndex :aContext | '...' asRopedText foreground: aContext theme button disabledTextColor ]
			success: [ :aUserOrNil :aContext | aUserOrNil ifNil: [ '' ] ]
			width: 150;
		column: 'Creator'
			text: #creator
			width: 120;
		column: 'Created'
			text: [ :aPR | 
				aPR createdAt
					ifNotNil: [ :aDate | '{1} ago' format: {(DateAndTime now - aDate) gtHumanReadableString} ]
					ifNil: [ '' ] ]
			width: 110;
		column: 'Draft'
			text: [ :aPR :aRowIndex :aColumnIndex :aTheme | 
				aPR isDraft
					ifTrue: [ 'draft' asRopedText foreground: aTheme button disabledTextColor ]
					ifFalse: [ '' ] ]
			width: 70
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

{ #category : #accessing }
GhOrganization >> login [
	^ rawData at: 'login'
]

{ #category : #accessing }
GhOrganization >> openPullRequestsSearchUrl [
	"Answer the search URL listing every open pull request of this organization.
	The search endpoint answers all of them at once, whereas visiting each repository in turn 
	would cost one request per repository."

	<return: #String>
	^ (GhConstants searchIssuesUrl asZnUrl
		queryAt: 'q' put: 'org:' , self login , ' is:pr is:open';
		queryAt: 'sort' put: 'created';
		queryAt: 'order' put: 'desc';
		queryAt: 'per_page' put: GhConstants pageSize asString;
		yourself) asString
]

{ #category : #accessing }
GhOrganization >> propertyToClass [
	^ {
	'events' -> GhEvents.
	} asDictionary
]

{ #category : #accessing }
GhOrganization >> pullRequestsStream [
	"Answer a lazily pulled stream over every open pull request across all repositories of this 
	organization, newest first."

	<return: #TAsyncStream>
	^ (self
		paginatedStreamStartingAt: self openPullRequestsSearchUrl
		itemsIn: [ :aParsedBody | aParsedBody at: 'items' ifAbsent: [ #() ] ])
		collect: [ :each | GhPullRequest new rawData: each ]
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
