tests
testPictureInitialization
	| picture |
	picture := self createEmptyPicture.
	self assert: picture url equals: self pictureUrl.
	self assert: picture faces isEmpty.
	self assert: picture hasFaceStorage equals: false.