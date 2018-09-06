examples
openUnsplashGalleryUsingAPIKey: anApiKey
	| galleryDataSource |
	GtCSFaceApiClient defaultKey: anApiKey.

	galleryDataSource := GtCSGalleryDataSource new
		picturesProvider: [ 
			| urls |
			urls := GtCSExamplesData unsplashPicturesCroppedUrls.
			urls withIndexCollect: [ :anUrl :anIndex |
				GtCSPicture new 
					url: anUrl ] ].
		
	GtCSGalleryMorph openInNewSpaceFor: galleryDataSource.