drawing
drawEyesDetailsOn: aCanvas
	self drawConnectedLandmarks: self eyeRight on: aCanvas.
	self drawConnectedLandmarks: self eyeLeft on: aCanvas.