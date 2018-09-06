accessing
picture: aPicture
	| finalForm |
	picture := aPicture.
	finalForm := aPicture pictureForm.
	(finalForm isNil and: [ aPicture faces notEmpty ]) ifTrue: [ 
		| pictureRectangle |
		pictureRectangle := 0@0 corner: 0@0.
		aPicture faces do: [ :aFace |  
			pictureRectangle := pictureRectangle merge: aFace rectangle ].
		finalForm := Form extent: (pictureRectangle extendBy: 25) corner ].
	self form: finalForm.