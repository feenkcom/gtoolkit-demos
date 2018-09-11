"
I store properties that identify various face landmarks from a face like, the position of the eyes and the nose. 
"
Class {
	#name : #GtCSFaceLandmarks,
	#superclass : #GtCSFaceProperties,
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI'
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
