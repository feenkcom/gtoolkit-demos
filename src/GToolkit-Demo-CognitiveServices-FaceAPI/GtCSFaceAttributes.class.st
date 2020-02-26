"
I store properties related to various attributes of a face, like age and gender. 

The main attributes related to a face are shown below. Faces may contain also other attributes.
- age: The age of the face as a number;
- gender: The determined gender (male, female or genderless);
- emotion: A list of emotions with their detection confidence;
- glasses: Information about glasses detected in a face;
- hair: Information about hair, including color.

Each of these attributes can be represented in a custom way. The following is an example of a list of attributes (for the face ${method:GtCSPictureExamples>>#faceHabichtWithLandmarksInPicture}$)

${example:GtCSPictureExamples>>#faceHabichtWithAttributes|noCode|previewShow=#gtFaceAttributesViewFor:}$
"
Class {
	#name : #GtCSFaceAttributes,
	#superclass : #GtCSFaceProperties,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI'
}

{ #category : #'instance creation' }
GtCSFaceAttributes class >> fromDictionary: aDictionary [
	^ self new properties: aDictionary
]

{ #category : #accessing }
GtCSFaceAttributes >> age [
	^ self properties at: 'age' ifAbsent: [ 0 ]
]

{ #category : #accessing }
GtCSFaceAttributes >> gender [
	^ self properties at: 'gender' ifAbsent: [ '-' ]
]
