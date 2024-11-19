Class {
	#name : #GhContributor,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhContributor >> asCardElement [
	^ BrHorizontalPane new
		matchParent;
		alignCenter;
		addChild: (self avatarPicture asScalableElement size: 64 @ 64);
		addChild: (BrVerticalPane new
				fitContent;
				margin: (BlInsets left: 10);
				addChild: (BrLabel new
						aptitude: BrGlamorousLabelAptitude;
						text: self loginName);
				addChild: (BrLabel new
						aptitude: (BrGlamorousLabelAptitude new foreground: Color gray; glamorousCodeSmallSize);
						text: self contributions asString , ' contributions'));
		when: BlClickEvent do: [ :e | e target phlow spawnObject: self ]
]

{ #category : #accessing }
GhContributor >> avatarPicture [
	| response |
	response := self httpClient url: (rawData at: 'avatar_url'); get; response.
	response contentType = ZnMimeType imageJpeg
		ifTrue: [ ^ (JPEGReadWriter gtFromBuffer: response contents) asElement ].
	response contentType = ZnMimeType imagePng
		ifTrue: [ ^ (PNGReadWriter gtFromBuffer: response contents) asElement ].
	^ BlElement new background: Color gray
]

{ #category : #accessing }
GhContributor >> contributions [
	^ rawData at: 'contributions'
]

{ #category : #accessing }
GhContributor >> events [
	^ self 
		createFrom: 'events_url'
		with: [ :data | GhEvents new rawData: data ] 
		onError: [ GhEvents new ]
]

{ #category : #accessing }
GhContributor >> gtAvatarFor: aView [
	<gtView>
	^ aView explicit
		title: 'Avatar';
		priority: 59;
		stencil: [ self avatarPicture ]
]

{ #category : #accessing }
GhContributor >> gtDisplayOn: stream [
	stream nextPutAll: self loginName
]

{ #category : #accessing }
GhContributor >> gtEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Events';
		items: [ self events ];
		column: 'Type' text: #type;
		column: 'Repository' text: #repoName;
		column: 'Timestamp' text: [:each | each creationTimestamp asLocalStringYMDHM ]
]

{ #category : #accessing }
GhContributor >> loginName [
	^ rawData at: 'login'
]
