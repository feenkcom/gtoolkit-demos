Class {
	#name : #GtLampSortAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'elements'
	],
	#classVars : [
		'LampSortAnnouncer'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortAnnouncement class >> announcer [
	^ LampSortAnnouncer ifNil: [ LampSortAnnouncer := Announcer new ]
]

{ #category : #accessing }
GtLampSortAnnouncement >> announcer [
	^ self class announcer
]

{ #category : #accessing }
GtLampSortAnnouncement >> elements [
	^ elements
]

{ #category : #accessing }
GtLampSortAnnouncement >> elements: aCollection [
	elements := aCollection copy
]

{ #category : #public }
GtLampSortAnnouncement >> emit [
	^ self announcer announce: self
]

{ #category : #accessing }
GtLampSortAnnouncement >> name [
	^ self class name
]

{ #category : #printing }
GtLampSortAnnouncement >> printOneLineContentsOn: stream [
	^ self printOn: stream
]

{ #category : #accessing }
GtLampSortAnnouncement >> processId [
	^ 0
]

{ #category : #accessing }
GtLampSortAnnouncement >> timestamp [
	^ 0
]
