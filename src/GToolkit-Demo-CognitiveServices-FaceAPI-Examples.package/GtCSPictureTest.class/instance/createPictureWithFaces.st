accessing
createPictureWithFaces
	| picture |
	picture := self createEmptyPicture.
	picture ensureFacesStorage.
	picture 
		addFace: self faceEinstein;
		addFace: self faceHabicht;
		addFace: self faceSolovine.
	^ picture