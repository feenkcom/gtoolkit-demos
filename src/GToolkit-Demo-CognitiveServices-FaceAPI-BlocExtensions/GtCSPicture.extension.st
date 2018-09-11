Extension { #name : #GtCSPicture }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSPicture >> gtFacesFor: aView [
	<gtView>
	
	^ aView explicit 
		title: 'Faces';
		priority: 20;
		stencil: [
			| list |
			list := BrColumnedList new 
				display: [ self faces ].
			list addEventHandler: GtInspectorListToSelectHandler new.
			list column 
				title: 'Gender';
				stencil: [ :aFace | 
					aFace hasFaceForm 
						ifFalse: [ (Form extent: 16@16) asElement  ]
						ifTrue: [ (aFace faceForm scaledIntoFormOfSize: 32@32) asElement ] ].
			list column 
				title: 'Location';
				stencil: [ :aFace | (BrListLabelStencil matchParent: aFace rectangle) asElement ].
			list ].
		
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSPicture >> gtPictureFor: aView [
	<gtView: 0>
	^ aView explicit
		title: 'Picture';
		priority: 15;
		stencil: [ 
			GtCSInspectorPictureBlocElement new 
				initializeForPicture: self ]
]
