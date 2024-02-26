Class {
	#name : #GtLampSortWithAnnoucements,
	#superclass : #GtLampSort,
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #steps }
GtLampSortWithAnnoucements >> addIntervals: newIntervals to: intervals [
	(self logEvent: GtLampSortIntervalsAdded)
		newIntervals: newIntervals;
		intervals: intervals;
		emit.
	super addIntervals: newIntervals to: intervals
]

{ #category : #examples }
GtLampSortWithAnnoucements >> gtExampleSortRandomWithAnnoucements [
	<gtExample>
	^ MemoryLogger new
		name: 'LampSort';
		beacon: GtLampSortAnnouncement announcer;
		runFor: GtLampSortAnnouncement during: [ self gtExampleSortRandom ]
]

{ #category : #examples }
GtLampSortWithAnnoucements >> gtExampleSortSpecificWithAnnoucements [
	<gtExample>
	^ MemoryLogger new
		name: 'LampSort';
		beacon: GtLampSortAnnouncement announcer;
		runFor: GtLampSortAnnouncement during: [ self gtExampleSortSpecific ]
]

{ #category : #private }
GtLampSortWithAnnoucements >> logEvent: aGtLampSortAnnouncement [
	^ aGtLampSortAnnouncement new
		elements: self elements;
		yourself
]

{ #category : #steps }
GtLampSortWithAnnoucements >> partition: interval [
	(self logEvent: GtLampSortPartitioning)
		interval: interval;
		emit.
	^ super partition: interval
]

{ #category : #steps }
GtLampSortWithAnnoucements >> selectFirstElementAsPivot: interval [
	(self logEvent: GtLampSortPivotSelected)
		pivotIndex: interval first;
		interval: interval;
		emit.
	^ super selectFirstElementAsPivot: interval
]

{ #category : #steps }
GtLampSortWithAnnoucements >> selectIntervalFrom: intervals [
	| interval event |
	event := (self logEvent: GtLampSortIntervalSelected) 
		intervals: intervals.
	interval := super selectIntervalFrom: intervals.
	event 
		selectedInterval: interval; 
		emit.
	^ interval
]

{ #category : #steps }
GtLampSortWithAnnoucements >> sort [
	(self logEvent: GtLampSortSorting) emit.
	super sort.
	(self logEvent: GtLampSortSorted) emit
]

{ #category : #steps }
GtLampSortWithAnnoucements >> splitInterval: interval around: index [
	| leftAndRight |
	leftAndRight := super splitInterval: interval around: index.
	(self logEvent: GtLampSortPartitioned)
		leftInterval: leftAndRight first;
		rightInterval: leftAndRight last;
		emit.
	^ leftAndRight
]

{ #category : #steps }
GtLampSortWithAnnoucements >> swap: oneIndex with: anotherIndex [
	super swap: oneIndex with: anotherIndex.
	(self logEvent: GtLampSortSwapped)
		oneIndex: oneIndex;
		anotherIndex: anotherIndex;
		emit
]
