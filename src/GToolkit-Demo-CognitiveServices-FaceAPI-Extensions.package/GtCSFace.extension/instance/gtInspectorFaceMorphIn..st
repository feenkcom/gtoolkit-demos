*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions
gtInspectorFaceMorphIn: composite
	<gtInspectorPresentationOrder: 20>
	composite morph
		title: 'Face';
		display: [ (self faceForm scaledToSize: 256@256) asMorph ];
		when: [ self hasFaceForm ]