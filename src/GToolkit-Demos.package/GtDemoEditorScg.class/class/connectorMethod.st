demo - connector
connectorMethod
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(Smalltalk tools inspector openOn: (BlBezierExamples>>#quadraticCurveWithPerpendicularAnchor) gtExample)
		extent: self largeExtent;
		position: self largePosition