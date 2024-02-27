Class {
	#name : #GtTraceAnnoncement,
	#superclass : #Announcement,
	#instVars : [
		'timestamp',
		'method',
		'args',
		'result',
		'receiver',
		'processId'
	],
	#category : #'GToolkit-Demo-LampSort-Tracing'
}

{ #category : #accessing }
GtTraceAnnoncement >> args [
	^ args
]

{ #category : #accessing }
GtTraceAnnoncement >> args: anArgumentsCollection [
	args := anArgumentsCollection
]

{ #category : #initialization }
GtTraceAnnoncement >> initialize [
	super initialize.
	timestamp := DateAndTime now.
	processId := Processor activeProcess name.
]

{ #category : #accessing }
GtTraceAnnoncement >> method [
	^ method
]

{ #category : #accessing }
GtTraceAnnoncement >> method: anObject [
	method := anObject
]

{ #category : #accessing }
GtTraceAnnoncement >> name [
	^ self class name
]

{ #category : #accessing }
GtTraceAnnoncement >> processId [
	^ processId
]

{ #category : #accessing }
GtTraceAnnoncement >> receiver [
	^ receiver
]

{ #category : #accessing }
GtTraceAnnoncement >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
GtTraceAnnoncement >> result [
	^ result
]

{ #category : #accessing }
GtTraceAnnoncement >> result: anObject [
	result := anObject
]

{ #category : #accessing }
GtTraceAnnoncement >> timestamp [
	^ timestamp
]
