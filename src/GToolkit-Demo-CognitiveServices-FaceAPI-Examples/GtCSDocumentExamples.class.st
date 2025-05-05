"
I contain example of documents for the Face API


"
Class {
	#name : #GtCSDocumentExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-Examples'
}

{ #category : #example }
GtCSDocumentExamples >> documentWithFaceExample [
	<gtExample>
	<return: #LeTextSnippet>
	^ LeTextSnippet
		string: 'To highlight faces within pictures we first need to create face objects. When creating a face we need to indicate the countour delimiting the face using the ==rectangle:== method.
	
${example:name=GtCSPictureExamples>>#faceEinstein}$'
]
