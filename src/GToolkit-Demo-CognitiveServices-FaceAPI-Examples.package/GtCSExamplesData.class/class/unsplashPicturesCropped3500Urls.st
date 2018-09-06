unsplash - urls
unsplashPicturesCropped3500Urls
	^ self unsplashPicturesCroppedUrls collect: [ :anUrl |
		| queryIndex |
		queryIndex :=  anUrl findString: 'w='.
		(anUrl copyFrom: 1 to: queryIndex-1), 'w=3500&q=60' ]