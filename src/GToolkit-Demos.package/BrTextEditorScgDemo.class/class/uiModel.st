demos
uiModel
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	(GTPlayground new openOn: BrTextEditorDemoPlayPage uiModel)
		extent: 1000@600;
		position: 50@50