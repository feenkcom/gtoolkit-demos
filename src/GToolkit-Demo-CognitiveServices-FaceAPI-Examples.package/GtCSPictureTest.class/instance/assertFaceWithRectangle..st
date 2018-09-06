asserting
assertFaceWithRectangle: aFace
	self assert: aFace rectangle notNil.
	self assert: aFace containerPicture isNil.
	self assert: aFace attributes properties isEmpty.
	self assert: aFace landmarks properties isEmpty.