drawing
drawBackgroundOnSpartaCanvas: aCanvas
	super drawBackgroundOnSpartaCanvas: aCanvas.
	
	self drawEyesDetailsOn: aCanvas.
	self drawNoseDetailsOn: aCanvas.
	self drawMouthDetailsOn: aCanvas.