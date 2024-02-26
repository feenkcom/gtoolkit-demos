Class {
	#name : #GtLampSortSwapped,
	#superclass : #GtLampSortAnnouncement,
	#instVars : [
		'oneIndex',
		'anotherIndex'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortSwapped >> anotherElement [
	^ self elements at: self anotherIndex
]

{ #category : #accessing }
GtLampSortSwapped >> anotherIndex [
	^ anotherIndex
]

{ #category : #accessing }
GtLampSortSwapped >> anotherIndex: integer [
	anotherIndex := integer
]

{ #category : #accessing }
GtLampSortSwapped >> oneElement [
	^ self elements at: self oneIndex
]

{ #category : #accessing }
GtLampSortSwapped >> oneIndex [
	^ oneIndex
]

{ #category : #accessing }
GtLampSortSwapped >> oneIndex: integer [
	oneIndex := integer
]

{ #category : #printing }
GtLampSortSwapped >> printOn: stream [
	stream
		nextPutAll: ('Swapped {1} @ {2} with {3} @ {4}'
				format: {
					self oneElement.
					self oneIndex.
					self anotherElement.
					self anotherIndex })
]

{ #category : #testing }
GtLampSortSwapped >> shouldHighlightIndex: index [
	^ index = oneIndex or: [ index = anotherIndex ]
]
