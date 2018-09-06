transformation
translateLandmarks: landmarkPoints
	^ landmarkPoints collect: [ :aPoint | 
		(aPoint - face rectangle topLeft) ]