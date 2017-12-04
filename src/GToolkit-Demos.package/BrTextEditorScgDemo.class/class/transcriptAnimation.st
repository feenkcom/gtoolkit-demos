demos
transcriptAnimation
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.

	(GTPlayground new openOn: BrTextEditorDemoPlayPage transcriptAnimation)
		extent: self largeExtent;
		position: self largePosition