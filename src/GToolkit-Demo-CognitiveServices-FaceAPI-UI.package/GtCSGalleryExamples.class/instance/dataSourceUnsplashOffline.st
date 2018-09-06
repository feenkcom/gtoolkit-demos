as yet unclassified
dataSourceUnsplashOffline
	<gtExample>
	^ GtCSGalleryDataSource new
		picturesProvider: [ 
			| urls facesJson |
			urls := GtCSExamplesData unsplashPicturesCroppedUrls.
			facesJson := GtCSExamplesData unsplashJsonPicturesCropped.
			urls withIndexCollect: [ :anUrl :anIndex |
				GtCSPicture new 
					url: anUrl;
					addFacesFromJsonData: (facesJson at: anIndex) ] ].