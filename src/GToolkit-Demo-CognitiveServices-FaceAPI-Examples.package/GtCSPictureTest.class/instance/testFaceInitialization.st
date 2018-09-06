tests
testFaceInitialization
	| face |
	face := self faceEinstein.
	self assert: face rectangle notNil.
	self assert: face containerPicture isNil.
	self assert: face attributes properties isEmpty.
	self assert: face landmarks properties isEmpty.