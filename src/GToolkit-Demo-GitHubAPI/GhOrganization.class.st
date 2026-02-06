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

{ #category : #accessing }
GhOrganization >> gtReposFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Repositories';
		priority: 40;
		items: [ self repos ];
		column: 'Repo' text: #name;
		column: 'Description' text: #description;
		column: 'Open issues' text: #numberOfOpenIssues;
		column: 'License' text: #licenseName
]

{ #category : #search }
GhOrganization >> gtSpotterForRepoNames: aSearch [
	<gtSearch>
	^ aSearch list
		title: 'Repositories';
		priority: 5;
		items: [ self repos ];
		itemsLimit: Float infinity;
		itemName: #name;
		sendCategory: [ :aCategory :aStep :thisSearch | GhRepos new repos: aCategory items contents ];
		filterBySubstring
]

{ #category : #accessing }
GhOrganization >> propertyToClass [
	^ {
	'events' -> GhEvents.
	} asDictionary
]

{ #category : #accessing }
GhOrganization >> repos [
	^ self 
		createFrom: 'repos_url' 
		with: [ :data | GhRepos new rawData: data ] 
		onError: [ GhRepos new ]
]
