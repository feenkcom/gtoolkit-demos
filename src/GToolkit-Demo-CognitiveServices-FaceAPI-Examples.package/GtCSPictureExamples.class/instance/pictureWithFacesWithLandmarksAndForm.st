example - picture
pictureWithFacesWithLandmarksAndForm
	<gtExample>
	| picture |
	picture := self pictureWithFacesWithLandmarksAndNoForm.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture faces size equals: 3.
	self assertFacesWithFormIn: picture.
	^ picture