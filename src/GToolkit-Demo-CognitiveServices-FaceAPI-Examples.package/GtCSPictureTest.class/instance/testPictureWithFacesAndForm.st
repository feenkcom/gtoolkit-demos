tests
testPictureWithFacesAndForm
	| picture |
	picture := self createPictureWithFaces.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture faces size equals: 3.
	self assertFacesWithFormIn: picture.
