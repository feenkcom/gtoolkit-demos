Class {
	#name : #GtLampSortSorting,
	#superclass : #GtLampSortAnnouncement,
	#category : #'GToolkit-Demo-LampSort-Announcements'
}

{ #category : #printing }
GtLampSortSorting >> printOn: stream [
	stream
		nextPutAll: 'Sorting';
		space;
		print: self elements
]
