example - face
faceSolovineWithLandmarks
	<gtExample>
	| face |
	face := self faceSolovine.
	face landmarks: self faceLandmarksSolovine.
	self assert: face landmarks notNil.
	^ face