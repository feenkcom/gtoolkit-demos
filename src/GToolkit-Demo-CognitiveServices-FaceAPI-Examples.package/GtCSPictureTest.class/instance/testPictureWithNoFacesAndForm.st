tests
testPictureWithNoFacesAndForm
	| picture |
	picture := self createEmptyPicture.
	self assert: picture pictureForm equals: nil.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture pictureForm notNil.
	self assert: picture pictureForm extent equals: 1280@921
	
	
	
