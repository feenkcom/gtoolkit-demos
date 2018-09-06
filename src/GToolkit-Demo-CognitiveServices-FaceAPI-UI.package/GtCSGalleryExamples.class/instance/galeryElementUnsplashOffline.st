as yet unclassified
galeryElementUnsplashOffline
	<gtExample>
	| galleryDataSource |
	galleryDataSource := self dataSourceUnsplashOffline.
	^ GtCSGalleryMorph new
		dataSource: galleryDataSource;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].