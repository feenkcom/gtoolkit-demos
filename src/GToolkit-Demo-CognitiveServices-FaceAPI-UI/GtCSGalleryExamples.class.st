"
I provide examples of galeries.
"
Class {
	#name : #GtCSGalleryExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-UI'
}

{ #category : #examples }
GtCSGalleryExamples >> dataSourceUnsplashOffline [
	<gtExample>
	<noTest>
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
]

{ #category : #examples }
GtCSGalleryExamples >> galeryElementUnsplashOffline [
	<gtExample>
	<noTest>
	| galleryDataSource |
	galleryDataSource := self dataSourceUnsplashOffline.
	^ GtCSGalleryMorph new
		dataSource: galleryDataSource;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].
]

{ #category : #accessing }
GtCSGalleryExamples >> localStorageCacheUnsplashCrop60ForDatasource: aDataSource [
	| cache unsplashCrop60Folder|
	cache := Dictionary new.
	unsplashCrop60Folder := self unsplashCrop60Folder.
	aDataSource pictures	
		do: [ :pictureWrapper ||url imageName|
			url := pictureWrapper picture url. 
			imageName := url copyFrom: (url lastIndexOf: $/)+1 to: (url indexOf: $?)-1.
			unsplashCrop60Folder/(imageName, '.jpeg') 
				binaryReadStreamDo: [ :stream ||imageForm|
					imageForm := ImageReadWriter formFromStream: stream.
					cache at: pictureWrapper picture put: imageForm ] ].
	^ cache
]

{ #category : #accessing }
GtCSGalleryExamples >> unsplashCrop60Folder [
	^ GtResourcesUtility resourceAtPath: Path
		* 'feenkcom'
		/ 'gtoolkit-demos' 
		/ 'data' 
		/ 'faceapi' 
		/ 'unsplash-crop60'
]
