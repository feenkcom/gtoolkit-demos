Class {
	#name : #GtLampSortIntervalSelected,
	#superclass : #GtLampSortAnnouncement,
	#instVars : [
		'intervals',
		'selectedInterval'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortIntervalSelected >> intervals [
	^ intervals
]

{ #category : #accessing }
GtLampSortIntervalSelected >> intervals: anIntervalCollection [
	intervals := anIntervalCollection copy
]

{ #category : #printing }
GtLampSortIntervalSelected >> printOn: stream [
	stream
		<< 'Selected ';
		print: self selectedInterval;
		<< ' from ';
		print: self intervals
]

{ #category : #accessing }
GtLampSortIntervalSelected >> selectedInterval [
	^ selectedInterval
]

{ #category : #accessing }
GtLampSortIntervalSelected >> selectedInterval: anInterval [
	selectedInterval := anInterval
]
