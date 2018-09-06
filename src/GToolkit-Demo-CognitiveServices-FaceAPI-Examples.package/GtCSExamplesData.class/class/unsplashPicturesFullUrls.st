unsplash - urls
unsplashPicturesFullUrls
	^ self unsplashPicturesCroppedUrls collect: [ :anUrl |
		| queryIndex |
		queryIndex :=  anUrl indexOf: $?.
		(anUrl copyFrom: 1 to: queryIndex-1) ]