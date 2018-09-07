accessing
localStorageCacheUnsplashCrop60ForDatasource: aDataSource
	| cache unsplashCrop60Folder|
	cache := Dictionary new.
	unsplashCrop60Folder := self unsplashCrop60Folder.
	aDataSource pictures	
		do: [ :pictureWrapper ||url imageName|
			url := pictureWrapper picture url. 
			imageName := url copyFrom: (url lastIndexOf: $/)+1 to: (url indexOf: $?)-1.
			unsplashCrop60Folder/(imageName, '.jpeg') 
				readStreamDo: [ :stream ||imageForm|
					imageForm := ImageReadWriter formFromStream: stream.
					cache at: pictureWrapper picture put: imageForm ] ].
	^ cache