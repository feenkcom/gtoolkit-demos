initialization
initializeForPicture: aPicture withFaceColors: facesColor
	| pictureForm |
	pictureForm := self pictureFormFor: aPicture.
	container
		size: pictureForm extent;
		background: (BlImageBackground image: pictureForm).
	aPicture faces do: [ :aFace |
		| faceElement |
		faceElement := BlElement new
			border: (BlBorder 
				paint: (facesColor at: aFace ifAbsent: [ Color blue ])
				width: 2);
			relocate: aFace rectangle origin.
		faceElement size: aFace rectangle extent.
		container addChild: faceElement ].