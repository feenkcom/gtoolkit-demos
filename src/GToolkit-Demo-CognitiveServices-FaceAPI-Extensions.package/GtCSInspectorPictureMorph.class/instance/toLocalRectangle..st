transforming
toLocalRectangle: faceRectangle
	| scaleFactor scaledRectangle |
	scaleFactor := self cachedForm extent / self form extent.
	scaledRectangle := faceRectangle scaleBy: scaleFactor.
	^ Rectangle 
		origin: scaledRectangle origin + self layoutPosition 
		extent: scaledRectangle extent