Extension { #name : #GtCSFaceAttributes }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFaceAttributes >> gtFaceAttributesListFor: aView [
	<gtView>
	^ (self properties gtItemsFor: aView)
		title: 'Attributes'
]
