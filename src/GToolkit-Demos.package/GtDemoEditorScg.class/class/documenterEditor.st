demo - documenter
documenterEditor
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	(GTPlayground openContents: '''./pharo-local/iceberg/pharo-graphics/Brick/doc/editor/index.pillar'' asFileReference' label: 'Pillar')
		extent: self largeExtent;
		position: self largePosition