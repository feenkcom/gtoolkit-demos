Extension { #name : #GtCSPicture }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSPicture >> gtFacesFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Faces';
		priority: 20;
		items: [ self faces ];
		column: 'Preview' icon: [ :aFace | 
			aFace hasFaceForm
				ifFalse: [ Form extent: 32 @ 32 ]
				ifTrue: [ aFace faceForm scaledIntoFormOfSize: 32 @ 32 ] ];
		column: 'Gender' text: [ :aFace | aFace attributes gender ];
		column: 'Location' text: [ :aFace | aFace rectangle ]
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSPicture >> gtPictureFor: aView [
	<gtView>
	^ aView explicit
		title: 'Picture';
		priority: 15;
		stencil: [ 
			GtCSInspectorPictureBlocElement new 
				initializeForPicture: self ]
]
