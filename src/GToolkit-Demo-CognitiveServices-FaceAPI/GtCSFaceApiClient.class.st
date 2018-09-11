"
I am the main client for communicating with the Face API provided by Azures. 

I can instantiate different types of requests encapsulating commands that can be done with the Face API.
Currently I only provide the detect request.
"
Class {
	#name : #GtCSFaceApiClient,
	#superclass : #Object,
	#instVars : [
		'subscriptionKey',
		'location'
	],
	#classInstVars : [
		'defaultKey'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI'
}

{ #category : #accessing }
GtCSFaceApiClient class >> defaultKey [
	^ defaultKey 
]

{ #category : #accessing }
GtCSFaceApiClient class >> defaultKey: aKey [
	defaultKey := aKey
]

{ #category : #accessing }
GtCSFaceApiClient >> createHttpClient [
	^ ZnClient new
		beOneShot;
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		url: self serviceUrl;
		headerAt: 'Ocp-Apim-Subscription-Key' put: subscriptionKey;
		accept: ZnMimeType applicationJson;
		contentReader: [ :entity | STON fromString: entity contents ]
]

{ #category : #requests }
GtCSFaceApiClient >> detectRequest [
	^ GtCSFaceApiDetectRequest new
		faceApiClient: self
]

{ #category : #initialization }
GtCSFaceApiClient >> initialize [
	super initialize.
	self location: #westeurope.
	self subscriptionKey: self class defaultKey.
]

{ #category : #accessing }
GtCSFaceApiClient >> location: aSymbol [
	location := aSymbol
]

{ #category : #accessing }
GtCSFaceApiClient >> serviceUrl [
	^ 'https://<1s>.api.cognitive.microsoft.com/face/v1.0' 
			expandMacrosWith: location
]

{ #category : #accessing }
GtCSFaceApiClient >> subscriptionKey: aString [
	subscriptionKey := aString
]
