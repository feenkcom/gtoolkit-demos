"
I model a detect request for the Azures Face API.

A detect request returns various informations about the faces from a given picture. I provide an API for configuring what properties should be computed.


"
Class {
	#name : #GtCSFaceApiDetectRequest,
	#superclass : #Object,
	#instVars : [
		'faceApiClient',
		'returnFaceId',
		'returnFaceLandmarks',
		'returnFaceAttributes'
	],
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI'
}

{ #category : #accessing }
GtCSFaceApiDetectRequest >> apiPath [
	^ 'detect'
]

{ #category : #accessing }
GtCSFaceApiDetectRequest >> availableFaceAttributes [
	^ #(age gender headPose smile facialHair glasses emotion hair makeup occlusion accessories blur exposure noise)
]

{ #category : #actions }
GtCSFaceApiDetectRequest >> executeFor: aPicture [
	| httpClient |
	httpClient := faceApiClient createHttpClient.
	self initializeHttpClient: httpClient for: aPicture.
	^ httpClient
		execute;
		contents
		
]

{ #category : #accessing }
GtCSFaceApiDetectRequest >> faceApiClient: aFaceApiClient [
	faceApiClient := aFaceApiClient
]

{ #category : #initialization }
GtCSFaceApiDetectRequest >> initialize [
	super initialize.
	self returnFaceId: false.
	self returnFaceLandmarks: true.
	self returnFaceAttributes: OrderedCollection new.
]

{ #category : #initialization }
GtCSFaceApiDetectRequest >> initializeHttpClient: anHttpClient for: aPicture [
	anHttpClient
		addPath: self apiPath;
		queryAddAll: self queryParameters asDictionary;
		method: #POST;
		contents: (STONJSON toString: { 'url' -> aPicture url } asDictionary);
  		contentType: ZnMimeType applicationJson
]

{ #category : #accessing }
GtCSFaceApiDetectRequest >> queryParameters [
	^ {
		'returnFaceId' -> returnFaceId .
		'returnFaceLandmarks' -> returnFaceLandmarks .
		'returnFaceAttributes' -> (String streamContents: [:s |  
			returnFaceAttributes asStringOn: s delimiter: ','])
	 	}
]

{ #category : #accessing }
GtCSFaceApiDetectRequest >> returnAllFaceAttributes [
	self returnFaceAttributes: self availableFaceAttributes
]

{ #category : #accessing }
GtCSFaceApiDetectRequest >> returnFaceAttributes: anAttributeCollection [
	returnFaceAttributes := anAttributeCollection
]

{ #category : #accessing }
GtCSFaceApiDetectRequest >> returnFaceId: shouldReturnFaceId [
	returnFaceId := shouldReturnFaceId
]

{ #category : #accessing }
GtCSFaceApiDetectRequest >> returnFaceLandmarks: shouldReturnFaceLandmarks [
	returnFaceLandmarks := shouldReturnFaceLandmarks
]
