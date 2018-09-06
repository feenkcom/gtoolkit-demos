callbacks
requestPictures
	pictures ifNotNil: [ ^ self ].
	[
		| providedPictures |
		providedPictures := picturesProvider value.
		self pictures: (providedPictures withIndexCollect: [ :aPicture :anIndex | 
			GtCSGalleryPictureWrapper new 
				index: anIndex;
				dataSource: self;
				picture: aPicture ]) 
	] fork