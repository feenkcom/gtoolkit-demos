initialization
initialize
	super initialize.
	itemElement := GtCSGalleryPictureMorph new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent.
			c margin: (BlInsets top: 0 right: 0 bottom: 4 left: 0) ];
		yourself