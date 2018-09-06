example - face
faceSolovine
	<gtExample>
	| face |
	face := GtCSFace new
		rectangle: ((622@172) corner: (714@264)).
	self assertFaceWithRectangle: face.
	^ face