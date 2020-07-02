Extension { #name : #GtCSFace }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFace >> gtFaceLandmarksViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Face (landmarks)';
		priority: 10;
		stencil: [ 
			| faceElement extentElement |
			faceElement := GtCSInspectorFaceBlocElement new
				initializeForFace: self.
			extentElement := BlScalableElement new.
			extentElement size: 256@256.
			extentElement 
				contentElement: faceElement.
			extentElement ]
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFace >> gtFaceLandmarksVisualFor: aView [
	<gtView>
	^ aView explicit
		title: 'Landmarks (visual)';
		priority: 19;
		stencil: [ 
			| faceElement extentElement |
			faceElement := GtCSInspectorFaceBlocElement new
				initializeForFace: (GtCSFace new
					rectangle: self rectangle;
					landmarks: self landmarks).
			extentElement := BlScalableElement new.
			extentElement size: 256@256.
			extentElement 
				contentElement: faceElement.
			extentElement ]
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFace >> gtFaceViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Face';
		priority: 11;
		stencil: [ 
			| faceElement extentElement |
			faceElement := BlElement new
				size: self rectangle extent;
				background: (self hasFaceForm 
					ifTrue: [ self faceForm ]
					ifFalse: [ (Form extent: self rectangle extent) 
						fillColor: Color white ]).
			extentElement := BlScalableElement new.
			extentElement size: 256@256.
			extentElement 
				contentElement: faceElement.
			extentElement ]
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFace >> gtViewAttributesListFor: aView [
	<gtView>
	^ (self attributes gtFaceAttributesListFor: aView)
		priority: 20
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFace >> gtViewLandmarksListFor: aView [
	<gtView>
	^ (self landmarks gtFaceLandmarksListFor: aView)
		title: 'Landmarks (list)';
		priority: 19
]
