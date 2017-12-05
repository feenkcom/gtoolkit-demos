demo - editor details
editorElements
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(Smalltalk tools inspector openOn: (GtMondrianDomainExamples new editorElements))
		extent: self largeExtent;
		position: self largePosition