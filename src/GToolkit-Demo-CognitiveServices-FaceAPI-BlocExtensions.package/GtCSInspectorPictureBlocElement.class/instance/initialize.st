initialization
initialize
	| extentElement |
	super initialize.
	container := BlElement new.
	extentElement := BlScalableElement new.
	extentElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	extentElement 
		contentElement: container.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	self addChild: extentElement.