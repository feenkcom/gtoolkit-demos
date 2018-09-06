drawing
drawMouthDetailsOn: aCanvas
	self drawConnectedLandmarks: self upperLip on: aCanvas.
	self drawConnectedLandmarks: self underLip on: aCanvas.
	self drawConnectedLandmarks: self mouth on: aCanvas.