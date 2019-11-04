"
I model a face detected in a picture object.

I store properties for the face object, including the rectangle delimiting the face within a ${class:GtCSPicture}$ object, face attributes (see ${class:GtCSFaceAttributes}$), and face landmarks (see  ${class:GtCSFaceLandmarks}$). I also point to the picture object that contains the face.

${example:GtCSPictureExamples>>#faceSolovineWithLandmarksInPicture|noCode|previewShow=gtFaceLandmarksViewFor:}$
The reactangle delimiting a face and its properties and landmarks can be added to a face, even if the face has not yet a graphical representation.
${example:GtCSPictureExamples>>#faceSolovineWithLandmarks}$

If the face is added to a picture, then its graphical representation is given by cropying the portion give by the rectangle attribute the from the picture.
${example:GtCSPictureExamples>>#faceSolovineWithLandmarksInPicture}$
The recommended way to initialize a face object is using JSON data. See <Adding faces from JSON files> for more details.
"
Class {
	#name : #GtCSFace,
	#superclass : #Object,
	#instVars : [
		'rectangle',
		'attributes',
		'landmarks',
		'containerPicture'
	],
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI'
}

{ #category : #accessing }
GtCSFace >> attributes [
	^ attributes ifNil: [ attributes := GtCSFaceAttributes new ]
]

{ #category : #accessing }
GtCSFace >> attributes: faceAttributes [
	attributes := faceAttributes
]

{ #category : #accessing }
GtCSFace >> containerPicture [
	^ containerPicture
]

{ #category : #accessing }
GtCSFace >> containerPicture: aPicture [
	containerPicture := aPicture
]

{ #category : #'accessing - dynamic' }
GtCSFace >> faceForm [
	^ self hasFaceForm ifTrue: [ 
		self containerPicture pictureForm copy: self rectangle ]
]

{ #category : #testing }
GtCSFace >> hasFaceForm [
	^ self containerPicture notNil and: [
		self containerPicture pictureForm notNil ]
]

{ #category : #initialization }
GtCSFace >> initializeFromJson: aFaceStructure [
	| rectangleData |
	rectangleData := aFaceStructure at: 'faceRectangle'.
	self rectangle: (Rectangle
		origin: (rectangleData at: 'left')@(rectangleData at: 'top')
		extent: (rectangleData at: 'width')@(rectangleData at: 'height')).
	self attributes: (GtCSFaceAttributes fromDictionary: (aFaceStructure   
		at: 'faceAttributes' ifAbsent: [ Dictionary new ] )).
	self landmarks: (GtCSFaceLandmarks fromDictionary: (aFaceStructure 
		at: 'faceLandmarks' ifAbsent: [ Dictionary new ]))
]

{ #category : #accessing }
GtCSFace >> landmarks [
	^ landmarks ifNil: [ landmarks := GtCSFaceLandmarks new ]
]

{ #category : #accessing }
GtCSFace >> landmarks: faceLandmarks [
	landmarks := faceLandmarks
]

{ #category : #accessing }
GtCSFace >> rectangle [
	^ rectangle
]

{ #category : #accessing }
GtCSFace >> rectangle: aRectangle [
	rectangle := aRectangle
]
