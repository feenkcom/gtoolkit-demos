"
I store properties related to various attributes of a face, like age and gender.
"
Class {
	#name : #GtCSFaceAttributes,
	#superclass : #GtCSFaceProperties,
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI'
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
