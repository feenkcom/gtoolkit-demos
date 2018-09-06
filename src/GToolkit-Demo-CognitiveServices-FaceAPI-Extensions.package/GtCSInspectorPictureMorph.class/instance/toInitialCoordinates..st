transforming
toInitialCoordinates: aPoint
	| scaleFactor |
	scaleFactor := self form extent / self cachedForm extent.
	^ (aPoint - (self layoutPosition)) scaleBy: scaleFactor