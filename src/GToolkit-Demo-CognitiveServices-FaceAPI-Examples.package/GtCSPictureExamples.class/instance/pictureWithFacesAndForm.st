example - picture
pictureWithFacesAndForm
	<gtExample>
	| picture |
	picture := self pictureWithFacesAndNoForm.
	picture loadPictureFormFile: self pictureFile.
	self assert: picture faces size equals: 3.
	self assertFacesWithFormIn: picture.
	^ picture