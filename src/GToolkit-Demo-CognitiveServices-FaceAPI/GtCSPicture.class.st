"
I model a picture that can contain a list of detected faces. 

I maintain a list of {{gtClass:GtCSFace}} objects representing the faces detected within this picture and a {{gtClass:Form}} object holding the graphical representation of the picture. I provide support for adding and removing faces, and setting a graphical representation directly, or by either reading it from a file or downloading it from a URL.

{{gtExample:GtCSPictureExamples>>#pictureWithFacesWithLandmarksAndForm|noCode|previewShow=gtPictureFor:}}

1. # Instantiation

New instances are created by directly instantiating the class. These instances have no face data or graphical representation by default. 
{{gtExample:GtCSPictureExamples>>#newPictureInstance}}

Currently a picture objects stores the URL from where the picture can be downloaded. This is just a temporary behaviour and should be removed in the future.
{{gtExample:GtCSPictureExamples>>#emptyPicture}}

1. # Adding a graphical representation

To explicitly add a graphical representation there are several alternative:
- set an URL to the picture and load the graphical representation from that URL using {{gtMethod:GtCSPicture>>#ensurePictureForm}}; 
- directly set a {{gtClass:Form}} as the graphical representation using {{gtMethod:GtCSPicture>>#pictureForm:}}.

{{gtExample:GtCSPictureExamples>>#pictureWithManuallySetForm}}

1. # Adding face information.

The main way to load face information is by calling {{gtMethod:GtCSPicture>>#addFace:}}. Before adding faces {{gtMethod:GtCSPicture>>#ensureFacesStorage}} needs to be called to initialize the storage for faces. 
{{gtExample:GtCSPictureExamples>>#pictureWithFacesWithLandmarksAndForm}}

Faces can be added to a picture even if the picture does not have a graphical representation.
{{gtExample:GtCSPictureExamples>>#pictureWithFacesAndNoForm}}

1. # Implementation details

The fact that the attribute `faces` is not null indicates that a client of this object already added face data to the picture. An empty list indicates that the picture has no face objects.


"
Class {
	#name : #GtCSPicture,
	#superclass : #Object,
	#instVars : [
		'faces',
		'url',
		'pictureForm'
	],
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI'
}

{ #category : #adding }
GtCSPicture >> addFace: aNewFace [
	self ensureFacesStorage.
	self faces add: aNewFace.
	aNewFace containerPicture: self
]

{ #category : #adding }
GtCSPicture >> addFacesFromJsonData: faceStructures [
	self ensureFacesStorage.
	faceStructures do: [ :aFaceStructure |
		self addFace: (GtCSFace new
			initializeFromJson: aFaceStructure) ]
]

{ #category : #actions }
GtCSPicture >> ensureFacesStorage [
	faces ifNil: [ faces := OrderedCollection new ] 
]

{ #category : #actions }
GtCSPicture >> ensurePictureForm [
	| client  |
	self url ifNil: [ ^ nil ].
	client := ZnClient new
 		beOneShot;
  		contentReader: [ :entity | 
			ImageReadWriter formFromStream: entity readStream binary ].
	self pictureForm: (client get: self url)
]

{ #category : #accessing }
GtCSPicture >> faces [
	^ faces ifNil: [ #() ]
]

{ #category : #printing }
GtCSPicture >> gtDisplayOn: aStream [
	super gtDisplayOn: aStream.
	aStream nextPutAll: '('.
	faces 
		ifNil: [ aStream nextPutAll: 'no face data loaded'. ]
		ifNotNil: [ faces size = 1
			ifTrue: [ aStream nextPutAll: '1 face' ]
			ifFalse: [ aStream nextPutAll: faces size asString, ' faces' ]  ].
	aStream nextPutAll: ')'.
	
]

{ #category : #testing }
GtCSPicture >> hasFaceStorage [
	^ faces ~= nil
]

{ #category : #actions }
GtCSPicture >> loadPictureFormFile: aFileReference [
	aFileReference binaryReadStreamDo: [ :aStream |
		self pictureForm: (ImageReadWriter formFromStream: aStream) ]
]

{ #category : #accessing }
GtCSPicture >> pictureForm [
	^ pictureForm
]

{ #category : #accessing }
GtCSPicture >> pictureForm: aForm [
	pictureForm := aForm
]

{ #category : #accessing }
GtCSPicture >> url [
	^ url
]

{ #category : #accessing }
GtCSPicture >> url: anUrl [
	url := anUrl
]
