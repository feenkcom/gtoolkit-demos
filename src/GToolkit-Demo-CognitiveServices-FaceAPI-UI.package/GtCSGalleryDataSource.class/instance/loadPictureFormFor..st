actions
loadPictureFormFor: aPictureWrapper
	| pictureForm |
	pictureForm := self picturesCache 
		at: aPictureWrapper picture
		ifAbsentPut: [ self downloadPictureFormFor: aPictureWrapper picture ].
	aPictureWrapper pictureForm: pictureForm