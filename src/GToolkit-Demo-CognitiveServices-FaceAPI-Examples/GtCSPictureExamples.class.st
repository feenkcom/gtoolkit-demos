"
To highlight faces within pictures we first need to create face objects. When creating a face we need to indicate the countour delimiting the face using the `rectangle:` method.
{{gtExample:name=GtCSPictureExamples>>#faceEinstein}}

Landmakes are used to indicate the position of different elements on a face, like nose, eyes, mouth, etc. Initially a face has no landmarks. We can attach them to a `Face` object using the method `landmarks:`.
{{gtExample:name=GtCSPictureExamples>>#faceEinsteinWithLandmarks|previewExpanded=true|previewShow=gtFaceLandmarksViewFor:}}

In case the face object is already attached to a picture with a graphical representation, we can see the landmarks overlayed on the actual face.
{{gtExample:name=GtCSPictureExamples>>#faceEinsteinWithLandmarksInPicture|previewExpanded=true|previewShow=gtFaceLandmarksViewFor:}}

To create an empty picture we can directly instantiate the `Picture` class. We can also specify a URL from where the graphical representation of the can be downloaded.
{{gtExample:name=GtCSPictureExamples>>#emptyPicture}}

To add faces to a picture we can use the `addFace:` method. We can add faces before the face has a graphical representation.
{{gtExample:name=GtCSPictureExamples>>#pictureWithFacesWithLandmarksAndNoForm|previewExpanded=true|previewShow=gtFacesFor:}}

Finally, to see the position of faces we can all the `ensurePictureForm` method. This method downloads the graphical representation from the URL atached to the picture.
{{gtExample:name=GtCSPictureExamples>>#pictureWithFacesWithLandmarksAndForm|previewExpanded=true|previewShow=gtFacesFor:}}


"
Class {
	#name : #GtCSPictureExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-Examples'
}

{ #category : #asserting }
GtCSPictureExamples >> assertFaceWithRectangle: aFace [
	self assert: aFace rectangle notNil.
	self assert: aFace containerPicture isNil.
	self assert: aFace attributes properties isEmpty.
	self assert: aFace landmarks properties isEmpty.
]

{ #category : #asserting }
GtCSPictureExamples >> assertFacesWithFormIn: aPicture [
	aPicture faces do: [ :aFace |
		self assert: aFace containerPicture equals: aPicture.
		self assert: aFace hasFaceForm.
		self assert: aFace faceForm notNil ]
]

{ #category : #asserting }
GtCSPictureExamples >> assertFacesWithNoFormFor: aPicture [
	aPicture faces do: [ :aFace |
		self assert: aFace containerPicture equals: aPicture.
		self assert: aFace hasFaceForm not.
		self assert: aFace faceForm isNil ]
]

{ #category : #'example - picture' }
GtCSPictureExamples >> emptyPicture [
	<gtExample>
	<return: #GtCSPicture>
	| picture |
	picture := GtCSPicture new url: self pictureUrl.
	self assert: picture url equals: self pictureUrl.
	self assert: picture faces isEmpty.
	self assert: picture hasFaceStorage equals: false.
	^ picture
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceAttributesHabicht [
	<gtExample>
	<return: #GtCSFaceAttributes>
	| landmarks |
	landmarks := GtCSFaceAttributes
			fromDictionary: GtCSExamplesData jsonFaceAttributesHabicht.
	^ landmarks
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceEinstein [
	<gtExample>
	<return: #GtCSFace>
	| face |
	face := GtCSFace new rectangle: (860 @ 320 corner: 960 @ 420).
	self assertFaceWithRectangle: face.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceEinsteinWithLandmarks [
	<gtExample>
	<return: #GtCSFace>
	| face |
	face := self faceEinstein.
	face landmarks: self faceLandmarksEinstein.
	self assert: face landmarks notNil.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceEinsteinWithLandmarksInPicture [
	<gtExample>
	<return: #GtCSFace>
	| face picture |
	face := self faceEinsteinWithLandmarks.
	picture := self emptyPicture.
	picture ensureFacesStorage.
	picture addFace: face.
	picture loadPictureFormFile: self pictureFile.
	self assert: face landmarks notNil.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceHabicht [
	<gtExample>
	<return: #GtCSFace>
	| face |
	face := GtCSFace new rectangle: (279 @ 313 corner: 378 @ 412).
	self assertFaceWithRectangle: face.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceHabichtWithAttributes [
	<gtExample>
	<return: #GtCSFace>
	| face |
	face := self faceHabicht.
	face attributes: self faceAttributesHabicht.
	self assert: face attributes notNil.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceHabichtWithLandmarks [
	<gtExample>
	<return: #GtCSFace>
	| face |
	face := self faceHabicht.
	face landmarks: self faceLandmarksHabicht.
	self assert: face landmarks notNil.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceHabichtWithLandmarksInPicture [
	<gtExample>
	<return: #GtCSFace>
	| face picture |
	face := self faceHabichtWithLandmarks.
	picture := self emptyPicture.
	picture ensureFacesStorage.
	picture addFace: face.
	picture loadPictureFormFile: self pictureFile.
	self assert: face landmarks notNil.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceLandmarksEinstein [
	<gtExample>
	<return: #GtCSFaceLandmarks>
	| landmarks |
	landmarks := GtCSFaceLandmarks fromDictionary: self jsonFaceLandmarksEinstein.
	^ landmarks
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceLandmarksHabicht [
	<gtExample>
	<return: #GtCSFaceLandmarks>
	| landmarks |
	landmarks := GtCSFaceLandmarks fromDictionary: self jsonFaceLandmarksHabicht.
	^ landmarks
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceLandmarksSolovine [
	<gtExample>
	<return: #GtCSFaceLandmarks>
	| landmarks |
	landmarks := GtCSFaceLandmarks fromDictionary: self jsonFaceLandmarksSolovine.
	^ landmarks
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceSolovine [
	<gtExample>
	<return: #GtCSFace>
	| face |
	face := GtCSFace new rectangle: (622 @ 172 corner: 714 @ 264).
	self assertFaceWithRectangle: face.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceSolovineWithLandmarks [
	<gtExample>
	<return: #GtCSFace>
	| face |
	face := self faceSolovine.
	face landmarks: self faceLandmarksSolovine.
	self assert: face landmarks notNil.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceSolovineWithLandmarksInPicture [
	<gtExample>
	<return: #GtCSFace>
	| face picture |
	face := self faceSolovineWithLandmarks.
	picture := self emptyPicture.
	picture ensureFacesStorage.
	picture addFace: face.
	picture loadPictureFormFile: self pictureFile.
	self assert: face landmarks notNil.
	^ face
]

{ #category : #'example - face' }
GtCSPictureExamples >> faceSolovineWithNoLandmarksInPicture [
	<gtExample>
	<return: #GtCSFace>
	| face picture |
	face := self faceSolovine.
	picture := self emptyPicture.
	picture ensureFacesStorage.
	picture addFace: face.
	picture loadPictureFormFile: self pictureFile.
	self assert: face landmarks notNil.
	^ face
]

{ #category : #accessing }
GtCSPictureExamples >> jsonFaceLandmarksEinstein [
	^ STONJSON fromString: '{
			"noseRootRight" : {
				"x" : 912.4,
				"y" : 347.8
			},
			"eyeLeftTop" : {
				"x" : 887.4,
				"y" : 345.3
			},
			"eyebrowLeftInner" : {
				"x" : 897.1,
				"y" : 340.6
			},
			"upperLipTop" : {
				"x" : 911.1,
				"y" : 392.4
			},
			"noseRightAlarOutTip" : {
				"x" : 921.5,
				"y" : 374.2
			},
			"noseRootLeft" : {
				"x" : 900.6,
				"y" : 349.4
			},
			"noseTip" : {
				"x" : 907.2,
				"y" : 373.9
			},
			"pupilLeft" : {
				"x" : 888.1,
				"y" : 348.5
			},
			"mouthRight" : {
				"x" : 931.5,
				"y" : 393.9
			},
			"pupilRight" : {
				"x" : 929.6,
				"y" : 344.3
			},
			"eyeRightInner" : {
				"x" : 922.0,
				"y" : 346.2
			},
			"noseRightAlarTop" : {
				"x" : 916.2,
				"y" : 365.0
			},
			"eyeRightBottom" : {
				"x" : 929.7,
				"y" : 349.3
			},
			"eyeLeftOuter" : {
				"x" : 881.7,
				"y" : 350.7
			},
			"eyebrowRightOuter" : {
				"x" : 944.3,
				"y" : 336.7
			},
			"eyeLeftInner" : {
				"x" : 895.1,
				"y" : 348.9
			},
			"underLipBottom" : {
				"x" : 912.5,
				"y" : 402.6
			},
			"eyebrowRightInner" : {
				"x" : 913.1,
				"y" : 337.5
			},
			"eyeLeftBottom" : {
				"x" : 888.7,
				"y" : 352.8
			},
			"eyeRightTop" : {
				"x" : 928.7,
				"y" : 341.4
			},
			"noseLeftAlarOutTip" : {
				"x" : 895.8,
				"y" : 377.1
			},
			"upperLipBottom" : {
				"x" : 911.4,
				"y" : 396.0
			},
			"mouthLeft" : {
				"x" : 894.9,
				"y" : 396.1
			},
			"eyeRightOuter" : {
				"x" : 936.3,
				"y" : 344.9
			},
			"underLipTop" : {
				"x" : 911.4,
				"y" : 397.1
			},
			"eyebrowLeftOuter" : {
				"x" : 870.7,
				"y" : 346.5
			},
			"noseLeftAlarTop" : {
				"x" : 900.3,
				"y" : 366.8
			}
		}'
	


]

{ #category : #accessing }
GtCSPictureExamples >> jsonFaceLandmarksHabicht [
	^ STONJSON fromString: '{
			"noseRootRight" : {
				"x" : 335.1,
				"y" : 340.8
			},
			"eyeLeftTop" : {
				"x" : 305.9,
				"y" : 335.8
			},
			"eyebrowLeftInner" : {
				"x" : 319.7,
				"y" : 329.1
			},
			"upperLipTop" : {
				"x" : 331.3,
				"y" : 379.8
			},
			"noseRightAlarOutTip" : {
				"x" : 344.1,
				"y" : 363.9
			},
			"noseRootLeft" : {
				"x" : 324.2,
				"y" : 341.0
			},
			"noseTip" : {
				"x" : 334.0,
				"y" : 361.6
			},
			"pupilLeft" : {
				"x" : 307.2,
				"y" : 338.3
			},
			"mouthRight" : {
				"x" : 345.9,
				"y" : 387.6
			},
			"pupilRight" : {
				"x" : 347.0,
				"y" : 339.4
			},
			"eyeRightInner" : {
				"x" : 340.4,
				"y" : 340.2
			},
			"noseRightAlarTop" : {
				"x" : 340.3,
				"y" : 356.1
			},
			"eyeRightBottom" : {
				"x" : 347.0,
				"y" : 342.9
			},
			"eyeLeftOuter" : {
				"x" : 299.1,
				"y" : 340.5
			},
			"eyebrowRightOuter" : {
				"x" : 360.7,
				"y" : 332.7
			},
			"eyeLeftInner" : {
				"x" : 313.7,
				"y" : 339.8
			},
			"underLipBottom" : {
				"x" : 330.5,
				"y" : 393.8
			},
			"eyebrowRightInner" : {
				"x" : 337.0,
				"y" : 330.0
			},
			"eyeLeftBottom" : {
				"x" : 306.0,
				"y" : 341.8
			},
			"eyeRightTop" : {
				"x" : 347.1,
				"y" : 336.9
			},
			"noseLeftAlarOutTip" : {
				"x" : 316.5,
				"y" : 364.5
			},
			"upperLipBottom" : {
				"x" : 330.8,
				"y" : 384.7
			},
			"mouthLeft" : {
				"x" : 309.0,
				"y" : 387.6
			},
			"eyeRightOuter" : {
				"x" : 353.7,
				"y" : 341.2
			},
			"underLipTop" : {
				"x" : 330.8,
				"y" : 388.9
			},
			"eyebrowLeftOuter" : {
				"x" : 288.0,
				"y" : 332.3
			},
			"noseLeftAlarTop" : {
				"x" : 321.6,
				"y" : 356.7
			}
		}'
]

{ #category : #accessing }
GtCSPictureExamples >> jsonFaceLandmarksSolovine [
	^ STONJSON fromString: '{
			"noseRootRight" : {
				"x" : 673.8,
				"y" : 199.8
			},
			"eyeLeftTop" : {
				"x" : 642.4,
				"y" : 197.3
			},
			"eyebrowLeftInner" : {
				"x" : 657.8,
				"y" : 192.6
			},
			"upperLipTop" : {
				"x" : 671.3,
				"y" : 236.3
			},
			"noseRightAlarOutTip" : {
				"x" : 683.5,
				"y" : 219.5
			},
			"noseRootLeft" : {
				"x" : 661.8,
				"y" : 201.0
			},
			"noseTip" : {
				"x" : 671.2,
				"y" : 220.5
			},
			"pupilLeft" : {
				"x" : 642.6,
				"y" : 199.2
			},
			"mouthRight" : {
				"x" : 687.4,
				"y" : 237.3
			},
			"pupilRight" : {
				"x" : 684.9,
				"y" : 195.2
			},
			"eyeRightInner" : {
				"x" : 680.0,
				"y" : 197.3
			},
			"noseRightAlarTop" : {
				"x" : 679.2,
				"y" : 213.1
			},
			"eyeRightBottom" : {
				"x" : 686.2,
				"y" : 197.5
			},
			"eyeLeftOuter" : {
				"x" : 635.7,
				"y" : 200.9
			},
			"eyebrowRightOuter" : {
				"x" : 701.2,
				"y" : 187.0
			},
			"eyeLeftInner" : {
				"x" : 650.5,
				"y" : 199.5
			},
			"underLipBottom" : {
				"x" : 672.8,
				"y" : 247.1
			},
			"eyebrowRightInner" : {
				"x" : 673.4,
				"y" : 191.3
			},
			"eyeLeftBottom" : {
				"x" : 643.2,
				"y" : 202.4
			},
			"eyeRightTop" : {
				"x" : 685.1,
				"y" : 193.5
			},
			"noseLeftAlarOutTip" : {
				"x" : 657.7,
				"y" : 223.0
			},
			"upperLipBottom" : {
				"x" : 671.9,
				"y" : 239.8
			},
			"mouthLeft" : {
				"x" : 652.0,
				"y" : 240.4
			},
			"eyeRightOuter" : {
				"x" : 691.8,
				"y" : 195.1
			},
			"underLipTop" : {
				"x" : 671.7,
				"y" : 241.6
			},
			"eyebrowLeftOuter" : {
				"x" : 624.2,
				"y" : 196.4
			},
			"noseLeftAlarTop" : {
				"x" : 660.4,
				"y" : 216.0
			}
		}'
	


]

{ #category : #'example - picture' }
GtCSPictureExamples >> newPictureInstance [
	<gtExample>
	<return: #GtCSPicture>
	| picture |
	picture := GtCSPicture new.
	self assert: picture url equals: nil.
	self assert: picture pictureForm equals: nil.
	self assert: picture faces isEmpty.
	self assert: picture hasFaceStorage equals: false.
	^ picture
]

{ #category : #accessing }
GtCSPictureExamples >> pictureFile [
	^ GtResourcesUtility resourceAtPath: Path 
		* 'feenkcom'
		/ 'gtoolkit-demos' 
		/ 'data' 
		/ 'faceapi' 
		/ '1280px-Einstein-with-habicht-and-solovine.jpg'
]

{ #category : #accessing }
GtCSPictureExamples >> pictureForm [
	self pictureFile binaryReadStreamDo: [ :aStream |
		^ ImageReadWriter formFromStream: aStream ].
	Error signal.
]

{ #category : #accessing }
GtCSPictureExamples >> pictureUrl [
	^ 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Einstein-with-habicht-and-solovine.jpg/1280px-Einstein-with-habicht-and-solovine.jpg'
]

{ #category : #'example - picture' }
GtCSPictureExamples >> pictureWithFacesAndForm [
	<gtExample>
	<return: #GtCSPicture>
	| picture |
	picture := self pictureWithFacesAndNoForm.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture faces size equals: 3.
	self assertFacesWithFormIn: picture.
	^ picture
]

{ #category : #'example - picture' }
GtCSPictureExamples >> pictureWithFacesAndNoForm [
	<gtExample>
	<return: #GtCSPicture>
	| picture |
	picture := self emptyPicture.
	picture ensureFacesStorage.
	picture
		addFace: self faceEinstein;
		addFace: self faceHabicht;
		addFace: self faceSolovine.
	self assert: picture faces size equals: 3.
	self assertFacesWithNoFormFor: picture.
	^ picture
]

{ #category : #'example - picture' }
GtCSPictureExamples >> pictureWithFacesWithLandmarksAndForm [
	<gtExample>
	<return: #GtCSPicture>
	| picture |
	picture := self pictureWithFacesWithLandmarksAndNoForm.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture faces size equals: 3.
	self assertFacesWithFormIn: picture.
	^ picture
]

{ #category : #'example - picture' }
GtCSPictureExamples >> pictureWithFacesWithLandmarksAndNoForm [
	<gtExample>
	<return: #GtCSPicture>
	| picture |
	picture := self emptyPicture.
	picture ensureFacesStorage.
	picture
		addFace: self faceEinsteinWithLandmarks;
		addFace: self faceHabichtWithLandmarks;
		addFace: self faceSolovineWithLandmarks.
	self assert: picture faces size equals: 3.
	self assertFacesWithNoFormFor: picture.
	^ picture
]

{ #category : #'example - picture' }
GtCSPictureExamples >> pictureWithManuallySetForm [
	<gtExample>
	<return: #GtCSPicture>
	| form picture |
	form := self pictureForm.
	picture := self emptyPicture.

	picture pictureForm: form.
	self assert: picture pictureForm equals: form.
	self assert: picture faces size equals: 0.

	^ picture
]

{ #category : #'example - picture' }
GtCSPictureExamples >> pictureWithNoFacesAndForm [
	<gtExample>
	<return: #GtCSPicture>
	| picture |
	picture := self emptyPicture.
	self assert: picture pictureForm equals: nil.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture pictureForm notNil.
	self assert: picture pictureForm extent equals: 1280 @ 921.
	^ picture
]
