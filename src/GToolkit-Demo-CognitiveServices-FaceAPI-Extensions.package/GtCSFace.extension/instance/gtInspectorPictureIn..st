*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions
gtInspectorPictureIn: composite
	<gtInspectorPresentationOrder: 25>
	self containerPicture ifNotNil: [ :aPicture |
		aPicture  
			gtInspectorPictureHighlighting: { self -> Color red }
			in: composite ]