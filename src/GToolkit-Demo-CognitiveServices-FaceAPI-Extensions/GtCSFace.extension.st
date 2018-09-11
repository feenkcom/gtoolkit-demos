Extension { #name : #GtCSFace }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSFace >> gtInspectorFaceAttributesIn: composite [
	<gtInspectorPresentationOrder: 25>
	(self attributes gtInspectorPropertiesIn: composite)
		title: 'Attributes'
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSFace >> gtInspectorFaceLandmarksIn: composite [
	<gtInspectorPresentationOrder: 30>
	(self landmarks gtInspectorPropertiesIn: composite)
		title: 'Landmarks'
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSFace >> gtInspectorFaceMorphIn: composite [
	<gtInspectorPresentationOrder: 20>
	composite morph
		title: 'Face';
		display: [ (self faceForm scaledToSize: 256@256) asMorph ];
		when: [ self hasFaceForm ]
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSFace >> gtInspectorFaceMorphLandmarksIn: composite [
	<gtInspectorPresentationOrder: 25>
	composite morph
		title: 'Face (landmmarks)';
		display: [ GtCSInspectorFaceMorph new 
			initializeForFace: self 
			withExtent: 256@256 ]
]

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-Extensions' }
GtCSFace >> gtInspectorPictureIn: composite [
	<gtInspectorPresentationOrder: 25>
	self containerPicture ifNotNil: [ :aPicture |
		aPicture  
			gtInspectorPictureHighlighting: { self -> Color red }
			in: composite ]
]
