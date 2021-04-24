Class {
	#name : #GhOrganization,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhOrganization >> events [
	^ rawData 
		at: 'events_url' 
		ifPresent: [ :url | 
			ZnClient new 
				get: url
				onSuccess: [ :result | 
					[
						GhEvents new rawData: (STON fromString: result)
					] on: Error do: [ :e | GhEvents new ] ]
				onError: [ GhEvents new ] ]
		ifAbsent: [ {} ]
]

{ #category : #accessing }
GhOrganization >> gtEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Events';
		items: [ self events ];
		column: 'Type' text: #type;
		column: 'Repository' text: #repoName;
		column: 'Actor' text: #actorName
]

{ #category : #accessing }
GhOrganization >> propertyToClass [
	^ {
	'events' -> GhEvents.
	} asDictionary
]
