demos
connectorMethod
	| connector |

	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	connector := GtConnector new.
	connector addMethod: (BlBezierExamples>>#quadraticCurveWithPerpendicularAnchor).
	
	(Smalltalk tools inspector openOn: connector)
		extent: self largeExtent;
		position: self largePosition