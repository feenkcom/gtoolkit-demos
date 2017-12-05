demos - editor details
rotatedText
	| editor |
	
	World closeAllWindowsDiscardingChanges.
	BlUniverse reset.
	
	editor := BrTextEditorExamples new elementOnMethodWithSyntaxHighlighting.

	editor editor styler
		addEventHandlerOn: BrTextStyledEvent
		do: [ [ 0.2 seconds wait. editor childrenDo: [ :aSegment |
			aSegment clipChildren: false.		
			aSegment childrenDo: [ :aWord |
				aWord transformDo: [ :t |
					t rotateBy: 10 negated ] ] ] ] fork ].
	
	(Smalltalk tools inspector openOn: editor)
		extent: self largeExtent * ((2.0/3.0) @ 1);
		position: self largePosition