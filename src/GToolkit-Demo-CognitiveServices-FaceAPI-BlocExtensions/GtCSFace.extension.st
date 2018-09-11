Extension { #name : #GtCSFace }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFace >> gtFaceLandmarksViewFor: aView [
	<gtView: 0>
	^ aView explicit
		title: 'Face (landmarks)';
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
