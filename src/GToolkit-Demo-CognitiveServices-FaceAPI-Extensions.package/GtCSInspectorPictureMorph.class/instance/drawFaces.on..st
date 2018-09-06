drawing
drawFaces: facesList on: aCanvas
	facesList do: [ :aFace |
		| scaledRectangle |
		scaledRectangle := self toLocalRectangle: aFace rectangle.
		aCanvas 
			frameRectangle: scaledRectangle
			width: 2 
			color: (self facesColor at: aFace ifAbsent: [ Color blue ]) ]