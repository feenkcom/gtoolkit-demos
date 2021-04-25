Class {
	#name : #GhRepo,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhRepo >> contributors [
	^ self 
		createFrom: 'contributors_url'
		with: [ :data | GhContributors new rawData: data ] 
		onError: [ GhContributors new ]
]

{ #category : #accessing }
GhRepo >> events [
	^ self 
		createFrom: 'events_url'
		with: [ :data | GhEvents new rawData: data ] 
		onError: [ GhEvents new ]
]

{ #category : #accessing }
GhRepo >> gtContributorsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Contributors';
		stencil: [ 
			| container imageContainer |
			container := BlElement new
				layout: BlFlowLayout new;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal matchParent ];
				padding: (BlInsets all: 10).
			self contributors do: [ :each |
				imageContainer := BlLazyElement new
					withGlamorousPreview;
							aptitude: BrShadowAptitude new;
		background: Color white;

					margin: (BlInsets all: 20);
					constraintsDo: [ :c | 
						c vertical exact: 100. 
						c horizontal exact: 300 ];
					elementBuilder: [ each asCardElement margin: (BlInsets all: 20) ].
				container addChild: imageContainer].
			container asScrollableElement ]
]

{ #category : #accessing }
GhRepo >> gtEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Events';
		items: [ self events ];
		column: 'Type' text: #type;
		column: 'Repository' text: #repoName;
		column: 'Timestamp' text: [:each | each creationTimestamp asLocalStringYMDHM ];
		column: 'Actor' text: #actorName
]

{ #category : #accessing }
GhRepo >> name [ 
	^ rawData at: 'name'
]

{ #category : #accessing }
GhRepo >> numberOfOpenIssues [
	^ rawData at: 'open_issues'
]
