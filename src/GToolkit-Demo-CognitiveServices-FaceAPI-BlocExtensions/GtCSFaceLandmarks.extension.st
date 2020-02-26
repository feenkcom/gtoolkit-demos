Extension { #name : #GtCSFaceLandmarks }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFaceLandmarks >> gtFaceLandmarksListFor: aView [
	<gtView>
	^ (self properties gtItemsFor: aView)
		title: 'Landmarks'
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFaceLandmarks >> gtFaceLandmarksViewFor: aView [
	<gtView>
	^ aView explicit
		title: 'Landmarks (face)';
		stencil: [ 
			| faceElement extentElement |
			faceElement := GtCSInspectorFaceBlocElement new
				initializeForFace: (GtCSFace new
					rectangle: (0@0 corner: 100@100);
					landmarks: self).
			extentElement := BlScalableElement new.
			extentElement size: 256@256.
			extentElement 
				contentElement: faceElement.
			extentElement ]
]
