Extension { #name : #GtCSPicture }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSPicture >> gtFacesFor: aView [
	<gtView>
	
	^ aView columnedList 
		title: 'Faces';
		priority: 20;
		items: [ self faces ];
		column: 'Gender' do: [:aColumn | 
			aColumn item: [ :aFace | 
				aFace hasFaceForm 
					ifFalse: [ (Form extent: 32@32)  ]
					ifTrue: [ (aFace faceForm scaledIntoFormOfSize: 32@32) ] ];
			rowStencil: [ :eachIcon | eachIcon asElement margin: (BlInsets left: 5 right: 5) ] ];
		column: 'Location' do: [:aColumn | 
			aColumn item: [ :aFace | aFace rectangle ] ].
		
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
