example - picture
pictureWithFacesAndNoForm
	<gtExample>
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
