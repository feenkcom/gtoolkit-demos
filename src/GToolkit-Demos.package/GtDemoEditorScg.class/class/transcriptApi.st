demos
transcriptApi
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	(GTPlayground new openOn: GtDemoPlayPage transcriptApi)
		extent: self largeExtent;
		position: self largePosition