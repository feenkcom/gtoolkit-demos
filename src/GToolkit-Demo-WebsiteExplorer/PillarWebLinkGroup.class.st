Class {
	#name : #PillarWebLinkGroup,
	#superclass : #APillarWebLinkGroup,
	#traits : 'TGtGroupWithItems',
	#classTraits : 'TGtGroupWithItems classTrait',
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

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
	self announcer announce: PillarWebLinkStatusUpdated new
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
