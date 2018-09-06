example - face
faceEinsteinWithLandmarks
	<gtExample>
	| face |
	face := self faceEinstein.
	face landmarks: self faceLandmarksEinstein.
	self assert: face landmarks notNil.
	^ face