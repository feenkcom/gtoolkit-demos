asserting
assertFacesWithFormIn: aPicture
	aPicture faces do: [ :aFace |
		self assert: aFace containerPicture equals: aPicture.
		self assert: aFace hasFaceForm.
		self assert: aFace faceForm notNil ]