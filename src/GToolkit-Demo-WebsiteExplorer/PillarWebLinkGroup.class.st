Class {
	#name : #PillarWebLinkGroup,
	#superclass : #Object,
	#traits : 'TGtGroupWithItems',
	#classTraits : 'TGtGroupWithItems classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #announcements }
PillarWebLinkGroup >> announcer [
]

{ #category : #accessing }
PillarWebLinkGroup >> announcer: anObject [
	announcer := anObject
]

{ #category : #accessing }
PillarWebLinkGroup >> gtLinksFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Links';
		priority: 30;
		items: [ self items ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Link'
			text: [ :item | item path ]
			width: 300;
		column: '# Pages'
			text: [ :item | item pages size ]
			width: 60;
		column: 'Status' text: [ :item | item status ];
		actionUpdateButton";
		updateWhen: PillarWebLinkStatusUpdated in: self announcer"
]

{ #category : #initialization }
PillarWebLinkGroup >> initialize [
	super initialize.
	self announcer: Announcer new
]

{ #category : #accessing }
PillarWebLinkGroup >> initializeWith: aCollection [
	"Override trait method to subscribe to link updates."
	items := aCollection.
	self subscribeToLinkStatusUpdates
]

{ #category : #accessing }
PillarWebLinkGroup >> links [
	^ self items
]

{ #category : #announcements }
PillarWebLinkGroup >> notifyStatusUpdate [
	self announcer announce: PillarWebLinkStatusUpdated new.

]

{ #category : #announcements }
PillarWebLinkGroup >> subscribeToLinkStatusUpdates [
	self links
		do: [ :link | 
			link announcer
				when: PillarWebLinkStatusUpdated
				send: #notifyStatusUpdate 
				to: self ]
]
