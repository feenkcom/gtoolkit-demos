example - face
faceHabichtWithLandmarks
	<gtExample>
	| face |
	face := self faceHabicht.
	face landmarks: self faceLandmarksHabicht.
	self assert: face landmarks notNil.
	^ face