demos
transcriptApi
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	(GTPlayground new openOn: BrTextEditorDemoPlayPage transcriptApi)
		extent: self largeExtent;
		position: self largePosition