actions
loadPictureFormFile: aFileReference
	aFileReference readStreamDo: [ :aStream |
		self pictureForm: (ImageReadWriter formFromStream: aStream binary) ]