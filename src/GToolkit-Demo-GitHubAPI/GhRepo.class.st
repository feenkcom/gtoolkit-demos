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
GhRepo >> description [
	^ rawData at: 'description'
]

{ #category : #accessing }
GhRepo >> events [
	^ self 
		createFrom: 'events_url'
		with: [ :data | GhEvents new rawData: data ] 
		onError: [ GhEvents new ]
]

{ #category : #action }
GhRepo >> gtActionWebBrowseFor: anAction [
	<gtAction>
	^ anAction button
		tooltip: 'Open in browser';
		priority: 10;
		icon: BrGlamorousIcons go;
		action: [ WebBrowser openOn: self htmlUrl ]
]

{ #category : #accessing }
GhRepo >> gtContributorsFor: aView [
	<gtView>
	^ aView explicit
		title: 'Contributors';
		priority: 30;
		stencil: [ | container imageContainer |
			container := BlElement new
					layout: BlFlowLayout new;
					constraintsDo: [ :c | 
						c vertical fitContent.
						c horizontal matchParent ].
			self contributors
				do: [ :each | 
					imageContainer := BrAsyncWidget new
							aptitude: BrShadowAptitude new
									+ (BrGlamorousButtonExteriorAptitude new
											backgroundPaint: Color white;
											borderPaint: Color transparent);
							background: Color white;
							margin: (BlInsets all: 10);
							constraintsDo: [ :c | 
								c vertical exact: 80.
								c horizontal exact: 180 ];
							stencil: [ each asCardElement	"margin: (BlInsets all: 20)" ].
					container addChild: imageContainer ].
			container asScrollableElement ]
]

{ #category : #accessing }
GhRepo >> gtDisplayOn: stream [
	stream nextPutAll: self name
]

{ #category : #accessing }
GhRepo >> gtEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Events';
		priority: 40;
		items: [ self events ];
		column: 'Type' text: #type;
		column: 'Repository' text: #repoName;
		column: 'Timestamp' text: [:each | each creationTimestamp asLocalStringYMDHM ];
		column: 'Actor' text: #actorName
]

{ #category : #action }
GhRepo >> gtGitAction: anAction [
	<gtAction>
	(GtGitRepository hasRepoNamed: self name) ifFalse: [ ^ anAction empty ].
	^ anAction button
		tooltip: 'Go to repository';
		priority: 25;
		icon: BrGlamorousVectorIcons branching;
		action: [ :aButton | 
			aButton phlow
				spawnTool: (GtGitPhlowTool new repository: (GtGitRepository forRepoNamed: self name)) ]
]

{ #category : #views }
GhRepo >> gtReleasesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Releases';
		priority: 50;
		items: [ self releases ];
		column: 'Release' text: #tagName;
		column: 'Published at' text: #publishedAt;
		column: 'Created at' text: #createdAt
]

{ #category : #views }
GhRepo >> gtWebViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'WebView';
		stencil: [ GtWebViewElement new url: self htmlUrl ]
]

{ #category : #accessing }
GhRepo >> htmlUrl [
	^ rawData at: 'html_url'
]

{ #category : #accessing }
GhRepo >> licenseName [
	^ rawData at: 'license' ifPresent: [:l | l ifNil: [ 'N/A' ] ifNotNil: [ l at: 'name' ] ]
]

{ #category : #accessing }
GhRepo >> name [ 
	^ rawData at: 'name'
]

{ #category : #accessing }
GhRepo >> numberOfOpenIssues [
	^ rawData at: 'open_issues'
]

{ #category : #accessing }
GhRepo >> releases [
	^ self 
		createFrom: 'releases_url'
		with: [ :data | GhReleases new rawData: data ] 
		onError: [ GhReleases new ]
]
