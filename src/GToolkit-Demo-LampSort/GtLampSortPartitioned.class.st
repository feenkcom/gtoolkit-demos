Class {
	#name : #GtLampSortPartitioned,
	#superclass : #GtLampSortAnnouncement,
	#instVars : [
		'leftInterval',
		'rightInterval'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortPartitioned >> leftInterval [
	^ leftInterval
]

{ #category : #accessing }
GtLampSortPartitioned >> leftInterval: anInterval [
	leftInterval := anInterval
]

{ #category : #printing }
GtLampSortPartitioned >> printOn: stream [
	stream
		nextPutAll: ('Partitioned into {1} and {2}'
				format: {
					self leftInterval.
					self rightInterval})
]

{ #category : #accessing }
GtLampSortPartitioned >> rightInterval [
	^ rightInterval
]

{ #category : #accessing }
GtLampSortPartitioned >> rightInterval: anInterval [
	rightInterval := anInterval
]

{ #category : #testing }
GtLampSortPartitioned >> shouldHighlightIndex: index [
	^ (leftInterval includes: index)
		or: [ rightInterval includes: index ]
]
