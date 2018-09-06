actions
loadFaceDataFor: aPictureWrapper
	| faceStructures |
	faceStructures := self detectRequest executeFor: aPictureWrapper picture.
	aPictureWrapper picture addFacesFromJsonData: faceStructures.