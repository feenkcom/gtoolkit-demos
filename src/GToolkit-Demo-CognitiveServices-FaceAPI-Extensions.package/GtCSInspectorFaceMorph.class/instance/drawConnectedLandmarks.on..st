drawing
drawConnectedLandmarks: points on: aCanvas
	| translatedPoints | 
	translatedPoints := self translateLandmarks: points.
	aCanvas 
		drawPolygon: translatedPoints
		fillStyle: Color transparent
		borderWidth: 1
		borderColor: Color blue.
	translatedPoints do: [ :aLandmarkPoint | 
		aCanvas 
			fillRectangle: (Rectangle 
			center: aLandmarkPoint extent: 4 asPoint)  
			fillStyle: Color blue ]