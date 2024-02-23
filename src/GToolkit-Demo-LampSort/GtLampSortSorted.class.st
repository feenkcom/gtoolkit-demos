Class {
	#name : #GtLampSortSorted,
	#superclass : #GtLampSortAnnouncement,
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #printing }
GtLampSortSorted >> printOn: stream [
	stream
		nextPutAll: 'Sorted';
		space;
		print: self elements
]
