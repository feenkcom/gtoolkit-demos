actions
executeFor: aPicture
	| httpClient |
	httpClient := faceApiClient createHttpClient.
	self initializeHttpClient: httpClient for: aPicture.
	^ httpClient
		execute;
		contents
		