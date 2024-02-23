Class {
	#name : #GtLampSortIntervalsAdded,
	#superclass : #GtLampSortAnnouncement,
	#instVars : [
		'newIntervals',
		'intervals'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortIntervalsAdded >> intervals [
	^ intervals
]

{ #category : #accessing }
GtLampSortIntervalsAdded >> intervals: anIntervalCollection [
	intervals := anIntervalCollection copy
]

{ #category : #accessing }
GtLampSortIntervalsAdded >> newIntervals [
	^ newIntervals
]

{ #category : #accessing }
GtLampSortIntervalsAdded >> newIntervals: anIntervalCollection [
	newIntervals := anIntervalCollection
]

{ #category : #printing }
GtLampSortIntervalsAdded >> printOn: stream [
	stream << 'Added '.
	self newIntervals 
		do: [ :each | stream print: each ]
		separatedBy: [ stream << ' and ' ].
	stream << ' to '; print: self intervals
]
