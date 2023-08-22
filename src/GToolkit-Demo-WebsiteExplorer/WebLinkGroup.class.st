"
I am a group of WebLink objects. I exist mainly to serve as a container for Spotter results.
I implement `links` with the help of the {{gtClass:name=TGtGroupWithItems}} trait.
"
Class {
	#name : #WebLinkGroup,
	#superclass : #AWebLinkGroup,
	#traits : 'TGtGroupWithItems',
	#classTraits : 'TGtGroupWithItems classTrait',
	#category : #'GToolkit-Demo-WebsiteExplorer-Model'
}

{ #category : #accessing }
WebLinkGroup >> initializeWith: aCollection [
	"Override trait method to subscribe to link updates."
	items := aCollection.
	self subscribeToLinkStatusUpdates
]

{ #category : #accessing }
WebLinkGroup >> links [
	^ self items
]

{ #category : #announcements }
WebLinkGroup >> notifyStatusUpdate [
	self announcer announce: WebLinkStatusUpdated new
]

{ #category : #announcements }
WebLinkGroup >> subscribeToLinkStatusUpdates [
	self links
		do: [ :link | 
			link announcer
				when: WebLinkStatusUpdated
				send: #notifyStatusUpdate 
				to: self ]
]
