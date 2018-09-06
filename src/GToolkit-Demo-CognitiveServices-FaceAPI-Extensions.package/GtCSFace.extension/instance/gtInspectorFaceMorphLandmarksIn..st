*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions
gtInspectorFaceMorphLandmarksIn: composite
	<gtInspectorPresentationOrder: 25>
	composite morph
		title: 'Face (landmmarks)';
		display: [ GtCSInspectorFaceMorph new 
			initializeForFace: self 
			withExtent: 256@256 ]