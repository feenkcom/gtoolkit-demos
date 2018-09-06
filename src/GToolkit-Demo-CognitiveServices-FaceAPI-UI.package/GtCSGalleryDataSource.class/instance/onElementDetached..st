hooks
onElementDetached: anElementHolder
	anElementHolder pictureWrapper ifNotNil: [ :currentPicture |
		currentPicture releasePictureForm ]