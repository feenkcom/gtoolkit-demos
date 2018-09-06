initialization
initialize
	| scalableElement |
	super initialize.
	containerMorph := BlElement new.
	scalableElement := BlScalableElement new
		fitWidth;
		contentElement: containerMorph;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	self addChild: scalableElement