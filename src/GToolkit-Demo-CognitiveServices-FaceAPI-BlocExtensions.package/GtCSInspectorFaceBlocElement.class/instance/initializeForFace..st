initialization
initializeForFace: aFace
	self size: aFace rectangle extent.
	self background: (aFace hasFaceForm 
		ifTrue: [ aFace faceForm ]
		ifFalse: [ (Form extent: aFace rectangle extent) 
			fillColor: Color white ]).
	face := aFace.