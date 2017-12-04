demos
transcriptObjectShower
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(Smalltalk tools inspector openOn: (GtTranscriptExamples new objectShower))
		extent: self smallExtent;
		position: self smallPosition