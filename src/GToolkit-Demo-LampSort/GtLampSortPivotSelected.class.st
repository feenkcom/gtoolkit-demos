Class {
	#name : #GtLampSortPivotSelected,
	#superclass : #GtLampSortAnnouncement,
	#instVars : [
		'pivotIndex',
		'interval'
	],
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #accessing }
GtLampSortPivotSelected >> interval [
	^ interval
]

{ #category : #accessing }
GtLampSortPivotSelected >> interval: anInterval [
	interval := anInterval
]

{ #category : #accessing }
GtLampSortPivotSelected >> pivot [
	^ self elements at: self pivotIndex
]

{ #category : #accessing }
GtLampSortPivotSelected >> pivotIndex [
	^ pivotIndex
]

{ #category : #accessing }
GtLampSortPivotSelected >> pivotIndex: integer [
	pivotIndex := integer
]

{ #category : #printing }
GtLampSortPivotSelected >> printOn: stream [
	stream
		nextPutAll: ('Selected pivot {1} @ {2} from {3}'
				format: {
					self pivot.
					self pivotIndex.
					self interval })
]
