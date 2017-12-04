demos
transcriptAnimation
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: GtDemoPlayPage transcriptAnimation)
		extent: self largeExtent;
		position: self largePosition