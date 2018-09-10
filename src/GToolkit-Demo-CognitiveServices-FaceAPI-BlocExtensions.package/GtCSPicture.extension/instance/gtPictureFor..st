*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions
gtPictureFor: aView
	<gtView: 0>
	^ aView explicit
		title: 'Picture';
		priority: 15;
		stencil: [ 
			GtCSInspectorPictureBlocElement new 
				initializeForPicture: self ]