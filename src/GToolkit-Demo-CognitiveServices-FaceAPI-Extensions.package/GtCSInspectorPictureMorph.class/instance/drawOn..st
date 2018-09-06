drawing
drawOn: aCanvas
	super drawOn: aCanvas.
	self drawFaces: picture faces on: aCanvas.