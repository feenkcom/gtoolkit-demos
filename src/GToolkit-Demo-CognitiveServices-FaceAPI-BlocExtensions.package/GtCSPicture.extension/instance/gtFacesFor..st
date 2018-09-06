*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions
gtFacesFor: aView
	<gtView: 0>
	^ aView explicit
		title: 'Faces';
		stencil: [ 
			GtCSInspectorPictureBlocElement new 
				initializeForPicture: self ]