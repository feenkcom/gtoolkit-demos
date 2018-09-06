tests
testPictureWithFacesAndNoForm
	| picture |
	picture := self createPictureWithFaces.
	self assert: picture faces size equals: 3.
	self assertFacesWithNoFormFor: picture.
