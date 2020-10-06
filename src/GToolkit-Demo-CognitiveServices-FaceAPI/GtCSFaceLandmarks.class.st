"
I store properties that identify various visual face landmarks from a ${class:GtCSFace}$. For other properties attaches to a face see ${class:GtCSFaceAttributes}$.

The main details landmarks related to a face that I support are:
- nose
- eyes
- eyebrows 
- mouth

!!Nose
The nose is specified using seven points. They identify the right and left alar, the tip and the top of the nose.

${example:GtCSFaceLandmarksExamples>>#landmarkNose}$

!!Eyes
An indivudual is specified by providing five points. Four points form a rectangle defining the outline of the eye and the fifth identifies the pupil. These details need to be provided for both eyes.

${example:GtCSFaceLandmarksExamples>>#landmarkEyes}$

"
Class {
	#name : #GtCSFaceLandmarks,
	#superclass : #GtCSFaceProperties,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI'
}

{ #category : #'instance creation' }
GtCSFaceLandmarks class >> fromDictionary: aDictionary [
	| landmarks |
	landmarks := aDictionary associations
		inject: Dictionary new
		into: [ :currentLandmarks :association | 
			currentLandmarks 
				at: association key put: (Point
					x: (association value at: 'x')
					y: (association value at: 'y'));
				yourself ]. 
	^ self new properties: landmarks
]

{ #category : #landmarks }
GtCSFaceLandmarks >> eyeLeft [
	^ self propertiesValuesFor: self eyeLeftProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> eyeLeftProperties [
	^ #(
		'eyeLeftTop'
		'eyeLeftInner'
		'eyeLeftBottom'
		'eyeLeftOuter' 
	)
]

{ #category : #landmarks }
GtCSFaceLandmarks >> eyeRight [
	^ self propertiesValuesFor: self eyeRightProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> eyeRightProperties [
	^ #( 
		'eyeRightTop'
		'eyeRightInner'
		'eyeRightBottom'
		'eyeRightOuter'
	)
]

{ #category : #landmarks }
GtCSFaceLandmarks >> eyebrowLeft [
	^ self propertiesValuesFor: self eyebrowLeftProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> eyebrowLeftProperties [
	^ #('eyebrowLeftOuter' 'eyebrowLeftInner')
]

{ #category : #landmarks }
GtCSFaceLandmarks >> eyebrowRight [
	^ self propertiesValuesFor: self eyebrowRightProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> eyebrowRightProperties [
	^ #('eyebrowRightOuter' 'eyebrowRightInner')
]

{ #category : #private }
GtCSFaceLandmarks >> hasAllProperties: aCollectionOfProperties [
	^ aCollectionOfProperties allSatisfy: [ :aProperty |
		self hasProperty: aProperty ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasCompleteMouth [
	^ (self hasAllProperties: self mouthProperties) and: [ 
		(self hasAllProperties: self underLipProperties) and: [ 
			self hasAllProperties: self upperLipProperties ] ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasEyes [
	^ self hasLeftEye and: [ self hasRightEye ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasEyesbrowse [
	^ self hasLeftEyebrow and: [ self hasRightEyebrow ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasLeftEye [
	^ self hasAllProperties: self eyeLeftProperties
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasLeftEyebrow [
	^ self hasAllProperties: self eyebrowLeftProperties
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasNose [
	^ (self hasAllProperties: self noseRootProperties) and: [ 
		(self hasAllProperties: self noseTipProperties) and: [  
			(self hasAllProperties: self noseLeftAlarProperties) and: [ 
				self hasAllProperties: self noseRightAlarProperties ] ] ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasRightEye [
	^ self hasAllProperties: self eyeRightProperties
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasRightEyebrow [
	^ self hasAllProperties: self eyebrowRightProperties
]

{ #category : #landmarks }
GtCSFaceLandmarks >> mouth [
	^ self propertiesValuesFor: self mouthProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> mouthProperties [
	^ #('mouthLeft' 'mouthRight')
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseLeftAlar [
	^ self propertiesValuesFor: self noseLeftAlarProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> noseLeftAlarProperties [
	^ #('noseLeftAlarOutTip' 'noseLeftAlarTop')
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseRightAlar [
	^ self propertiesValuesFor: self noseRightAlarProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> noseRightAlarProperties [
	^ #('noseRightAlarOutTip' 'noseRightAlarTop')
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseRoot [
	^ self propertiesValuesFor: self noseRootProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> noseRootProperties [
	^ #('noseRootLeft' 'noseRootRight')
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseTip [
	^ self propertiesValuesFor: self noseTipProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> noseTipProperties [
	^ #('noseTip')
]

{ #category : #private }
GtCSFaceLandmarks >> propertiesValuesFor: aCollectionOfProperties [
	^ aCollectionOfProperties collect: [ :aProperty |
		self propertyAt: aProperty ifAbsent: [ 0@0 ] ]
]

{ #category : #landmarks }
GtCSFaceLandmarks >> underLip [
	^ self propertiesValuesFor: self underLipProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> underLipProperties [
	^ #('underLipBottom' 'underLipTop')
]

{ #category : #landmarks }
GtCSFaceLandmarks >> upperLip [
	^ self propertiesValuesFor: self upperLipProperties
]

{ #category : #'landmarks - properties' }
GtCSFaceLandmarks >> upperLipProperties [
	^ #('upperLipBottom'  'upperLipTop')
]
