"
I model a face present in a picture object.

I maintain properties for the face object, including the rectangle delimiting the face within the picture. I also point to the picture object that contains the face.

Public API and Key Messages

- hasFaceForm - indicates if a graphical representation of the face can be computed   
- faceForm - returns the graphical representation of the face
- initializeFromJson: initializes the properties if the face based on the given data. The given data should be a dictionary following the structure returned by the Azures Face API
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
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI'
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
