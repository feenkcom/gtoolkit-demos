demo - documenter
documenterEditor
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	(Smalltalk tools inspector openOn:'./pharo-local/iceberg/pharo-graphics/Brick/doc/editor/index.pillar' asFileReference)
		extent: self largeExtent * ((2.0/3.0) @ 1);
		position: self largePosition