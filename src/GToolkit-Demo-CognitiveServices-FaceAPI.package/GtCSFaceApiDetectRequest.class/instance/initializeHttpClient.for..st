initialization
initializeHttpClient: anHttpClient for: aPicture
	anHttpClient
		addPath: self apiPath;
		queryAddAll: self queryParameters asDictionary;
		method: #POST;
		contents: (STONJSON toString: { 'url' -> aPicture url } asDictionary);
  		contentType: ZnMimeType applicationJson