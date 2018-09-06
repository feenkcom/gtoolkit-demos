accessing
pictureForm
	^ picture pictureForm ifNil: [ self class defaultPictureForm ]