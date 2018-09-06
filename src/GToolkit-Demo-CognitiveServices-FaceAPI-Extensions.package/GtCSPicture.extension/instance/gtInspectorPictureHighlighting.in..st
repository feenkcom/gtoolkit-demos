*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions
gtInspectorPictureHighlighting: facesColor in:composite
	| morphPresentation |
	morphPresentation := composite morph.
	morphPresentation
		title: 'Picture';
		display: [
			| displayMorph |
			displayMorph := GtCSInspectorPictureMorph new
				picture: self;
				facesColor: facesColor asDictionary.
			displayMorph on: #mouseDown send: #value: to: [ :event | 
				morphPresentation selection: (displayMorph     
					objectAtLocalCoordinates: event position)].
			displayMorph ];
		when: [ self pictureForm notNil or: [ self faces notEmpty ] ]