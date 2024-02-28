"
I am GtTraceAnnouncement.
I am a Announcement.
I am compatible with BeaconSignal.

I represent a method trace for which I record the receiver, arguments and result.
"
Class {
	#name : #GtTraceAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'timestamp',
		'method',
		'args',
		'result',
		'receiver',
		'processId',
		'duration'
	],
	#category : #'GToolkit-Demo-LampSort-Tracing'
}

{ #category : #accessing }
GtTraceAnnouncement >> args [
	^ args
]

{ #category : #accessing }
GtTraceAnnouncement >> args: anArgumentsCollection [
	args := anArgumentsCollection
]

{ #category : #accessing }
GtTraceAnnouncement >> duration [
	^ duration
]

{ #category : #accessing }
GtTraceAnnouncement >> duration: aDuration [
	duration := aDuration
]

{ #category : #'gt extensions' }
GtTraceAnnouncement >> gtViewTraceDetailsIn: composite [
	<gtView>
	^ composite columnedList
		title: 'Trace';
		priority: 30;
		items: [ {
			{ #receiver . receiver }.
			{ #method . method }.
			{ #args . args printString . args }.
			{ #result . result printString. result }.
			{ #duration . duration asString , 'ms'. duration } } ];
		column: #key text: #first weight: 0.5;
		column: #value text: #second;
		send: #last
]

{ #category : #initialization }
GtTraceAnnouncement >> initialize [
	super initialize.
	timestamp := DateAndTime now.
	processId := Processor activeProcess name.
]

{ #category : #accessing }
GtTraceAnnouncement >> method [
	^ method
]

{ #category : #accessing }
GtTraceAnnouncement >> method: anObject [
	method := anObject
]

{ #category : #accessing }
GtTraceAnnouncement >> name [
	^ self class name
]

{ #category : #printing }
GtTraceAnnouncement >> printOn: stream [
	stream
		print: self receiver;
		space;
		print: self method selector;
		space;
		print: self args;
		space;
		print: self result
]

{ #category : #printing }
GtTraceAnnouncement >> printOneLineContentsOn: stream [
	^ self printOn: stream
]

{ #category : #accessing }
GtTraceAnnouncement >> processId [
	^ processId
]

{ #category : #accessing }
GtTraceAnnouncement >> receiver [
	^ receiver
]

{ #category : #accessing }
GtTraceAnnouncement >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
GtTraceAnnouncement >> result [
	^ result
]

{ #category : #accessing }
GtTraceAnnouncement >> result: anObject [
	result := anObject
]

{ #category : #accessing }
GtTraceAnnouncement >> timestamp [
	^ timestamp
]
