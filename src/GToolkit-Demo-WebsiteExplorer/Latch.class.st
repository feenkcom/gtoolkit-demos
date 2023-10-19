Class {
	#name : #Latch,
	#superclass : #Object,
	#instVars : [
		'open',
		'mutex'
	],
	#category : #'GToolkit-Demo-WebsiteExplorer'
}

{ #category : #initalization }
Latch >> initialize [
	open := false.
	mutex := Monitor new
]

{ #category : #accessing }
Latch >> open [
	mutex
		critical: [ open := true.
			mutex signalAll ]
]

{ #category : #accessing }
Latch >> waitOpen [
	mutex critical: [ open ifFalse: [ mutex waitUntil: [ open ] ] ]
]
