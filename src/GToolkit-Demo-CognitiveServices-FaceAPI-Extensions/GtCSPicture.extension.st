Extension { #name : #GtCSPicture }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSPicture >> gtInspectorFacesIn: composite [
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
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSPicture >> gtInspectorPictureHighlighting: facesColor in:composite [
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
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSPicture >> gtInspectorPictureIn: composite [
	<gtInspectorPresentationOrder: 25>
	self  
		gtInspectorPictureHighlighting: {}
		in: composite
]
