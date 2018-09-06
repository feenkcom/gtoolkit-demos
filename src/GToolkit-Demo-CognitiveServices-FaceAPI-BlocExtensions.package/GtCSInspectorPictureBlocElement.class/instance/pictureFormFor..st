accessing
pictureFormFor: aPicture
	| finalForm |
	finalForm := aPicture pictureForm.
	finalForm ifNil: [ 
		| pictureRectangle |
		pictureRectangle := 0@0 corner: 0@0.
		aPicture faces do: [ :aFace |  
			pictureRectangle := pictureRectangle merge: aFace rectangle ].
		finalForm := Form extent: (pictureRectangle extendBy: 25) corner ].
	^ finalForm
