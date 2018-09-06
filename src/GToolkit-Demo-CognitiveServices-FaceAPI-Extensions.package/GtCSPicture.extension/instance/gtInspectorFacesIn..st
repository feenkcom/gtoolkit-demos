*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions
gtInspectorFacesIn: composite
	<gtInspectorPresentationOrder: 20>
	composite fastTable
		title: 'Faces';
		display: [ self faces ];
		column: '' evaluated: [ :aFace | aFace hasFaceForm 
			ifTrue: [ aFace faceForm scaledIntoFormOfSize: 32@32 ] ] width: 32;
		column: 'Location' evaluated: [ :aFace | 
			aFace rectangle ] width: 200;
		column: 'Gender' evaluated: [ :aFace | 
			aFace attributes gender ] width: 100;
		column: 'Age' evaluated: [ :aFace | aFace attributes age ]