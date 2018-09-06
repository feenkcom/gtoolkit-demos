example - picture
pictureWithFacesWithLandmarksAndNoForm
	<gtExample>
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
