accessing
queryParameters
	^ {
		'returnFaceId' -> returnFaceId .
		'returnFaceLandmarks' -> returnFaceLandmarks .
		'returnFaceAttributes' -> (String streamContents: [:s |  
			returnFaceAttributes asStringOn: s delimiter: ','])
	 	}