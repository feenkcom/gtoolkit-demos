testing
hasFaceForm
	^ self containerPicture notNil and: [
		self containerPicture pictureForm notNil ]