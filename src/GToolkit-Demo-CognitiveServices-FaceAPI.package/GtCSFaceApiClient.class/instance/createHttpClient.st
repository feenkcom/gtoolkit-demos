accessing
createHttpClient
	^ ZnClient new
		beOneShot;
		enforceHttpSuccess: true;
		enforceAcceptContentType: true;
		url: self serviceUrl;
		headerAt: 'Ocp-Apim-Subscription-Key' put: subscriptionKey;
		accept: ZnMimeType applicationJson;
		contentReader: [ :entity | STON fromString: entity contents ]