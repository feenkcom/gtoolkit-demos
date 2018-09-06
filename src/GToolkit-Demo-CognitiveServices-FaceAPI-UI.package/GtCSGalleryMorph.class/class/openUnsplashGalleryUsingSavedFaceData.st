examples
openUnsplashGalleryUsingSavedFaceData
	| galleryDataSource |

	galleryDataSource := GtCSGalleryDataSource new
		picturesProvider: [ 
			| urls facesJson |
			urls := GtCSExamplesData unsplashPicturesCroppedUrls.
			facesJson := GtCSExamplesData unsplashJsonPicturesCropped.
			urls withIndexCollect: [ :anUrl :anIndex |
				GtCSPicture new 
					url: anUrl;
					addFacesFromJsonData: (facesJson at: anIndex) ] ].
		
	GtCSGalleryMorph openInNewSpaceFor: galleryDataSource.