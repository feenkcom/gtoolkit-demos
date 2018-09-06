accessing
detectRequest
	^ self faceApiClient detectRequest
		returnFaceId: false;
		returnFaceLandmarks: true;
		returnAllFaceAttributes