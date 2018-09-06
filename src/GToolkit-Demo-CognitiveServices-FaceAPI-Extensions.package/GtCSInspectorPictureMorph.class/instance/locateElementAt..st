searching
locateElementAt: scaledPoint
	^ picture faces 
		detect: [ :aFace | aFace rectangle containsPoint: scaledPoint ]
		ifNone: [ picture ]