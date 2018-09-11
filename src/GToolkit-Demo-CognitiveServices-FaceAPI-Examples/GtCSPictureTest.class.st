Class {
	#name : #GtCSPictureTest,
	#superclass : #TestCase,
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-Examples'
}

{ #category : #asserting }
GtCSPictureTest >> assertFaceWithRectangle: aFace [
	self assert: aFace rectangle notNil.
	self assert: aFace containerPicture isNil.
	self assert: aFace attributes properties isEmpty.
	self assert: aFace landmarks properties isEmpty.
]

{ #category : #asserting }
GtCSPictureTest >> assertFacesWithFormIn: aPicture [
	aPicture faces do: [ :aFace |
		self assert: aFace containerPicture equals: aPicture.
		self assert: aFace hasFaceForm.
		self assert: aFace faceForm notNil ]
]

{ #category : #asserting }
GtCSPictureTest >> assertFacesWithNoFormFor: aPicture [
	aPicture faces do: [ :aFace |
		self assert: aFace containerPicture equals: aPicture.
		self assert: aFace hasFaceForm not.
		self assert: aFace faceForm isNil ]
]

{ #category : #accessing }
GtCSPictureTest >> createEmptyPicture [
	^ GtCSPicture new
		url: self pictureUrl
]

{ #category : #accessing }
GtCSPictureTest >> createPictureWithFaces [
	| picture |
	picture := self createEmptyPicture.
	picture ensureFacesStorage.
	picture 
		addFace: self faceEinstein;
		addFace: self faceHabicht;
		addFace: self faceSolovine.
	^ picture
]

{ #category : #accessing }
GtCSPictureTest >> faceEinstein [
	^ GtCSFace new
		rectangle: ((860@320) corner: (960@420))
]

{ #category : #accessing }
GtCSPictureTest >> faceHabicht [
	^ GtCSFace new
		rectangle: ((279@313) corner: (378@412))
]

{ #category : #accessing }
GtCSPictureTest >> faceJsonData [
	^ '[
	{
		"faceRectangle" : {
			"width" : 100,
			"height" : 100,
			"top" : 320,
			"left" : 860
		}
	},
	{
		"faceRectangle" : {
			"width" : 99,
			"height" : 99,
			"top" : 313,
			"left" : 279
		}
	},
	{
		"faceRectangle" : {
			"width" : 92,
			"height" : 92,
			"top" : 172,
			"left" : 622
		}
	}
]'
]

{ #category : #accessing }
GtCSPictureTest >> faceSolovine [
	^ GtCSFace new
		rectangle: ((622@172) corner: (714@264))
]

{ #category : #accessing }
GtCSPictureTest >> pictureFile [
	^ IceRepository repositoriesLocation 
		/ 'feenkcom'
		/ 'gtoolkit-demos' 
		/ 'data' 
		/ 'faceapi' 
		/ '1280px-Einstein-with-habicht-and-solovine.jpg'
]

{ #category : #accessing }
GtCSPictureTest >> pictureUrl [
	^ 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Einstein-with-habicht-and-solovine.jpg/1280px-Einstein-with-habicht-and-solovine.jpg'
]

{ #category : #tests }
GtCSPictureTest >> testFaceInitialization [
	| face |
	face := self faceEinstein.
	self assert: face rectangle notNil.
	self assert: face containerPicture isNil.
	self assert: face attributes properties isEmpty.
	self assert: face landmarks properties isEmpty.
]

{ #category : #tests }
GtCSPictureTest >> testPictureInitialization [
	| picture |
	picture := self createEmptyPicture.
	self assert: picture url equals: self pictureUrl.
	self assert: picture faces isEmpty.
	self assert: picture hasFaceStorage equals: false.
]

{ #category : #tests }
GtCSPictureTest >> testPictureWithFacesAndForm [
	| picture |
	picture := self createPictureWithFaces.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture faces size equals: 3.
	self assertFacesWithFormIn: picture.

]

{ #category : #tests }
GtCSPictureTest >> testPictureWithFacesAndNoForm [
	| picture |
	picture := self createPictureWithFaces.
	self assert: picture faces size equals: 3.
	self assertFacesWithNoFormFor: picture.

]

{ #category : #tests }
GtCSPictureTest >> testPictureWithNoFacesAndForm [
	| picture |
	picture := self createEmptyPicture.
	self assert: picture pictureForm equals: nil.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture pictureForm notNil.
	self assert: picture pictureForm extent equals: 1280@921
	
	
	

]
