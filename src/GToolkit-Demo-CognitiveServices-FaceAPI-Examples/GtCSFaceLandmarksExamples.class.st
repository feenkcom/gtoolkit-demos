Class {
	#name : #GtCSFaceLandmarksExamples,
	#superclass : #GtExampleProvider,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-Examples'
}

{ #category : #examples }
GtCSFaceLandmarksExamples >> landmarkEyes [
	<gtExample>
	<return: #GtCSFaceLandmarks>
	| landmarks |
	landmarks := GtCSFaceLandmarks new.
	landmarks addProperties: self landmarkLeftEye properties.
	landmarks addProperties: self landmarkRightEye properties.
	^ landmarks
]

{ #category : #examples }
GtCSFaceLandmarksExamples >> landmarkLeftEye [
	<gtExample>
	<return: #GtCSFaceLandmarks>
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
GtCSFaceLandmarksExamples >> landmarkNose [
	<gtExample>
	<return: #GtCSFaceLandmarks>
	| landmarks |
	landmarks := GtCSFaceLandmarks new.
	landmarks
		propertyAt: #noseRootRight put: 22.4 @ 7.8;
		propertyAt: #noseRightAlarOutTip put: 31.5 @ 34.2;
		propertyAt: #noseRootLeft put: 10.6 @ 9.4;
		propertyAt: #noseTip put: 17.2 @ 33.9;
		propertyAt: #noseRightAlarTop put: 26.2 @ 25.0;
		propertyAt: #noseLeftAlarOutTip put: 5.8 @ 37.1;
		propertyAt: #noseLeftAlarTop put: 10.3 @ 26.8.

	^ landmarks
]

{ #category : #examples }
GtCSFaceLandmarksExamples >> landmarkRightEye [
	<gtExample>
	<return: #GtCSFaceLandmarks>
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
