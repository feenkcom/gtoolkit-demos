Extension { #name : #GtCSFaceAttributes }

{ #category : #'*GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions' }
GtCSFaceAttributes >> gtFaceAttributesViewFor: aView [
	<gtView>
	^ (self properties gtItemsFor: aView)
		title: 'Attributes'
]
