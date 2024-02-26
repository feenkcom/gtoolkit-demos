Class {
	#name : #GtLampSortPartitioning,
	#superclass : #GtLampSortAnnouncement,
	#instVars : [
		'interval'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortPartitioning >> interval [
	^ interval
]

{ #category : #accessing }
GtLampSortPartitioning >> interval: anInterval [
	interval := anInterval
]

{ #category : #printing }
GtLampSortPartitioning >> printOn: stream [
	stream
		nextPutAll: 'Partioning';
		space;
		print: self interval
]

{ #category : #testing }
GtLampSortPartitioning >> shouldHighlightIndex: index [
	^ self interval includes: index
]
