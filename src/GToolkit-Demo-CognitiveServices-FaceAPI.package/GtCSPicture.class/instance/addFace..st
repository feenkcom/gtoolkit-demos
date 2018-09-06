adding
addFace: aNewFace
	self ensureFacesStorage.
	self faces add: aNewFace.
	aNewFace containerPicture: self