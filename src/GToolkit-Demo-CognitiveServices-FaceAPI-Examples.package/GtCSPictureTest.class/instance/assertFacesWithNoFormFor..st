asserting
assertFacesWithNoFormFor: aPicture
	aPicture faces do: [ :aFace |
		self assert: aFace containerPicture equals: aPicture.
		self assert: aFace hasFaceForm not.
		self assert: aFace faceForm isNil ]