Class {
	#name : #GtCSFaceLandmarksExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-Examples'
}

{ #category : #examples }
GtCSFaceLandmarksExamples >> landmarkEyes [
	<gtExample>
	| landmarks |
	landmarks := GtCSFaceLandmarks new.
	landmarks addProperties: self landmarkLeftEye properties.
	landmarks addProperties: self landmarkRightEye properties.
	^ landmarks
]

{ #category : #examples }
GtCSFaceLandmarksExamples >> landmarkLeftEye [
	<gtExample>
	| landmarks |
	landmarks := GtCSFaceLandmarks new.
	landmarks 
		propertyAt: #eyeRightTop put: 8.7 @ 1.4;
		propertyAt: #eyeRightOuter put: 16.3 @ 4.9;
		propertyAt: #pupilRight put: 9.6 @ 4.3;
		propertyAt: #eyeRightInner put: 2.0 @ 6.2;
		propertyAt: #eyeRightBottom put: 9.7 @ 9.3.
	^ landmarks
]

{ #category : #examples }
GtCSFaceLandmarksExamples >> landmarkRightEye [
	<gtExample>
	| landmarks |
	landmarks := GtCSFaceLandmarks new.
	landmarks 
		propertyAt: #eyeLeftTop put: 32.4 @ 1.3;
		propertyAt: #eyeLeftOuter put: 26.7 @ 6.7;
		propertyAt: #pupilLeft put: 43.1 @ 4.5;
		propertyAt: #eyeLeftInner put: 40.1 @ 4.9;
		propertyAt: #eyeLeftBottom put: 32.7 @ 8.8.
	^ landmarks
]
