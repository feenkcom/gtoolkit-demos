drawing
drawNoseDetailsOn: aCanvas
	self drawConnectedLandmarks: self noseTip on: aCanvas.  
	self drawConnectedLandmarks: self noseRoot on: aCanvas.
	self drawConnectedLandmarks: self noseRightAlar on: aCanvas.
	self drawConnectedLandmarks: self noseLeftAlar on: aCanvas.