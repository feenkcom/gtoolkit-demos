"
I store properties that identify various face landmarks from a face like.

The main details landmarks related to a face that I support are:
- eyes
- eyebrows 
- nose
- mouth

!!Eyes
An indivudual is specified by providing five points. Four form a rectangle defining the outline of the eye and the fifth identifies the pupil. These details need to be provided for both eyes.

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
	^ {(self propertyAt: 'eyeLeftTop').
	(self propertyAt: 'eyeLeftInner').
	(self propertyAt: 'eyeLeftBottom').
	(self propertyAt: 'eyeLeftOuter')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> eyeRight [
	^ {(self propertyAt: 'eyeRightTop').
	(self propertyAt: 'eyeRightInner').
	(self propertyAt: 'eyeRightBottom').
	(self propertyAt: 'eyeRightOuter')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> eyebrowLeft [
	^ {(self propertyAt: 'eyebrowLeftOuter').
	(self propertyAt: 'eyebrowLeftInner')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> eyebrowRight [
	^ {(self propertyAt: 'eyebrowRightOuter').
	(self propertyAt: 'eyebrowRightInner')}
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasLeftEye [
	^ (self hasProperty: 'eyeLeftTop') and: [ 
			(self hasProperty: 'eyeLeftInner') and: [ 
				(self hasProperty: 'eyeLeftBottom') and: [
					(self hasProperty: 'eyeLeftOuter') ] ] ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasLeftEyebrow [
	^ (self hasProperty: 'eyebrowLeftOuter') and: [ 
		(self hasProperty: 'eyebrowLeftInner') ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasRightEye [
	^ (self hasProperty: 'eyeRightTop') and: [ 
			(self hasProperty: 'eyeRightInner') and: [ 
				(self hasProperty: 'eyeRightBottom') and: [
					(self hasProperty: 'eyeRightOuter') ] ] ]
]

{ #category : #'landmarks - testing' }
GtCSFaceLandmarks >> hasRightEyebrow [
	^ (self hasProperty: 'eyebrowRightOuter') and: [ 
		(self hasProperty: 'eyebrowRightInner') ]
]

{ #category : #landmarks }
GtCSFaceLandmarks >> mouth [
	^ {(self propertyAt: 'mouthLeft').
	(self propertyAt: 'mouthRight')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseLeftAlar [
	^ {(self propertyAt: 'noseLeftAlarOutTip').
	(self propertyAt: 'noseLeftAlarTop')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseRightAlar [
	^ {(self propertyAt: 'noseRightAlarOutTip').
	(self propertyAt: 'noseRightAlarTop')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseRoot [
	^ {(self propertyAt: 'noseRootLeft').
	(self propertyAt: 'noseRootRight')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> noseTip [
	^ {(self propertyAt: 'noseTip')}
]

{ #category : #accessing }
GtCSFaceLandmarks >> propertyAt: aName [
 	^ super propertyAt: aName ifAbsent: [ 0@0 ]
]

{ #category : #landmarks }
GtCSFaceLandmarks >> underLip [
	^ {(self propertyAt: 'underLipBottom').
	(self propertyAt: 'underLipTop')}
]

{ #category : #landmarks }
GtCSFaceLandmarks >> upperLip [
	^ {(self propertyAt: 'upperLipBottom').
	(self propertyAt: 'upperLipTop')}
]
