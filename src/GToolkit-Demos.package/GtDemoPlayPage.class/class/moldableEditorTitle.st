demos
moldableEditorTitle
	^ self of: { 
'container := BlElement new.
container layout: BlFrameLayout new.
container constraintsDo: [ :c |
	c horizontal matchParent.
	c vertical matchParent ].

moldable := BlTextElement new.
moldable text: (''The Moldable Editor'' asRopedText attributes: {
	BrFontFamilyAttribute named: ''Helvetica Neue''.
	BrFontSizeAttribute size: 80.
	BrFontWeightAttribute thin
}).
moldable constraintsDo: [ :c | c linear horizontal alignCenter ].

author := BlTextElement new.
author text: (''Aliaksei Syrel'' asRopedText attributes: {
	BrFontFamilyAttribute named: ''Helvetica Neue''.
	BrFontSizeAttribute size: 60.
	BrFontWeightAttribute thin.
}).
author constraintsDo: [ :c | c linear horizontal alignCenter ].

container addChild: (BlElement new
	layout: BlLinearLayout vertical;
	constraintsDo: [ :c |
		c horizontal fitContent.
		c vertical fitContent.
		c frame horizontal alignCenter.
		c frame vertical alignCenter ];
	addChildren: { moldable . author })'	
	}