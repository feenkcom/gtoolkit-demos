demos
transcriptIntro
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	(GTPlayground new openOn: BrTextEditorDemoPlayPage transcriptIntro)
		extent: self largeExtent;
		position: self largePosition