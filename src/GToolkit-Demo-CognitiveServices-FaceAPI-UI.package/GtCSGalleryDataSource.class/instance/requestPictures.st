callbacks
requestPictures
	pictures ifNotNil: [ ^ self ].
	[
		self loadPicturesFromProvider.
	] fork