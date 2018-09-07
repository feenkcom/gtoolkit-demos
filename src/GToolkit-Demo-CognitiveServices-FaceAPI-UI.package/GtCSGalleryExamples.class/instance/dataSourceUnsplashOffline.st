examples
dataSourceUnsplashOffline
	<gtExample>
	| dataSource cache |
	dataSource := GtCSGalleryDataSource new
		picturesProvider: [ 
			| urls facesJson |
			urls := GtCSExamplesData unsplashPicturesCroppedUrlsFirst4.
			facesJson := GtCSExamplesData unsplashJsonPicturesCropped.
			urls withIndexCollect: [ :anUrl :anIndex |
				GtCSPicture new 
					url: anUrl;
					addFacesFromJsonData: (facesJson at: anIndex) ] ].
	dataSource loadPicturesFromProvider.
	cache := self localStorageCacheUnsplashCrop60ForDatasource: dataSource.
	dataSource picturesCache: cache.
	^ dataSource