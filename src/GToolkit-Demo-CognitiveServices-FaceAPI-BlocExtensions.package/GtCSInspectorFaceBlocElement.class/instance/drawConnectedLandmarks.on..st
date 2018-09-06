drawing
drawConnectedLandmarks: points on: aCanvas
	| translatedPoints path |
	translatedPoints := self translateLandmarks: points.
	path := (BlPolygon vertices: translatedPoints) buildPathOnSpartaCanvas: aCanvas.
	aCanvas stroke
		paint: Color blue;
		path: path;
		draw.
	translatedPoints do: [ :aLandmarkPoint | 
		aCanvas fill
			paint: Color blue ;
			path: (Rectangle 
				center: aLandmarkPoint extent: 2 asPoint);
			draw]