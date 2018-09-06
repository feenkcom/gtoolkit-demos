accessing
pictureWrapper: aPictureWrapper
	pictureWrapper := aPictureWrapper.
	containerMorph 
		size: pictureWrapper extent;
		background: (BlBackground image: pictureWrapper pictureForm);
		removeChildren.
	pictureWrapper faces do: [ :aFace |
		self addFaceMorphFor: aFace ]