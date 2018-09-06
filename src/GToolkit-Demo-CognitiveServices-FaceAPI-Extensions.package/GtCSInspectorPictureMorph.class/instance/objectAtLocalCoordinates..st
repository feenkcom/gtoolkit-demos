accessing
objectAtLocalCoordinates: aPoint
	| scaledPoint |
	scaledPoint := self toInitialCoordinates: aPoint.
	^ self locateElementAt: scaledPoint