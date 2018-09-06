as yet unclassified
dataSourceUnsplashOffline
	<gtExample>
	^ GtCSGalleryDataSource new
		picturesProvider: [ 
			| urls facesJson |
			urls := CSExamplesData unsplashPicturesCroppedUrls.
			facesJson := CSExamplesData unsplashJsonPicturesCropped.
			urls withIndexCollect: [ :anUrl :anIndex |
				CSPicture new 
					url: anUrl;
					addFacesFromJsonData: (facesJson at: anIndex) ] ].