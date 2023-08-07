Class {
	#name : #PillarWebLinkGroup,
	#superclass : #Object,
	#traits : 'TGtGroupWithItems + TPillarWebLinkGroup',
	#classTraits : 'TGtGroupWithItems classTrait + TPillarWebLinkGroup classTrait',
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
