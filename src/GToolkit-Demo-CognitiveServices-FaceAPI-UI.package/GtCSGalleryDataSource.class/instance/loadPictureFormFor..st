actions
loadPictureFormFor: aPictureWrapper
	| pictureForm |
	pictureForm := self picturesCache 
		at: aPictureWrapper 
		ifAbsentPut: [ self downloadPictureFormFor: aPictureWrapper picture ].
	aPictureWrapper pictureForm: pictureForm