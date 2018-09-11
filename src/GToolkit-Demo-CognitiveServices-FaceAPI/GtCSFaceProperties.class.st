"
I store properties related to a face object. Subclasses can extend me to add different types of properties or provide dedicated APIs for working with properties.
"
Class {
	#name : #GtCSFaceProperties,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI'
}

{ #category : #accessing }
GtCSFaceProperties >> properties [
	^ properties ifNil: [ properties := OrderedDictionary new ]
]

{ #category : #accessing }
GtCSFaceProperties >> properties: aDictionary [
	properties := aDictionary
]

{ #category : #accessing }
GtCSFaceProperties >> propertyAt: aName [
	^ self properties at: aName
]

{ #category : #accessing }
GtCSFaceProperties >> propertyAt: aName ifAbsent: aBlock [
	^ self properties at: aName ifAbsent: aBlock
]
