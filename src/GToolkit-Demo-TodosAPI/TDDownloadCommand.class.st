Class {
	#name : #TDDownloadCommand,
	#superclass : #Object,
	#instVars : [
		'client',
		'signalProgress',
		'znClient'
	],
	#category : #'GToolkit-Demo-TodosAPI-Command'
}

{ #category : #accessing }
TDDownloadCommand >> client [
	^ client.
]

{ #category : #accessing }
TDDownloadCommand >> client: anObject [
	client := anObject.
]

{ #category : #accessing }
TDDownloadCommand >> getResponse [
	^ ZnClient new
		url: self listUrl;
		signalProgress: self signalProgress;
		get;
		response.
]

{ #category : #accessing }
TDDownloadCommand >> initialize [
	super initialize.
]

{ #category : #accessing }
TDDownloadCommand >> listUrl [
	^ self client serverUrl.
]

{ #category : #accessing }
TDDownloadCommand >> signalProgress [
	^ signalProgress.
]

{ #category : #accessing }
TDDownloadCommand >> signalProgress: aBoolean [
	signalProgress := aBoolean.
]
