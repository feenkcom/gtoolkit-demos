Class {
	#name : #GtCSInspectorFaceBlocElement,
	#superclass : #BlElement,
	#instVars : [
		'face',
		'scalableElement'
	],
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions'
}

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawConnectedLandmarks: points on: aCanvas [
	| translatedPoints path |
	translatedPoints := self translateLandmarks: points.
	path := (BlPolygonGeometry vertices: translatedPoints) buildPathOnSpartaCanvas: aCanvas.
	aCanvas stroke
		paint: Color blue;
		path: path;
		draw.
	translatedPoints do: [ :aLandmarkPoint | 
		aCanvas fill
			paint: Color blue ;
			path: (Rectangle 
				center: aLandmarkPoint extent: 2 asPoint);
			draw]
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawEyesDetailsOn: aCanvas [
	self drawConnectedLandmarks: self faceLandmarks eyeRight on: aCanvas.
	self drawConnectedLandmarks: self faceLandmarks eyeLeft on: aCanvas.
	
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawEyesbrowseDetailsOn: aCanvas [
	self drawConnectedLandmarks: self faceLandmarks eyebrowRight on: aCanvas.
	self drawConnectedLandmarks: self faceLandmarks eyebrowLeft on: aCanvas.
	
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawMouthDetailsOn: aCanvas [
	self drawConnectedLandmarks: self faceLandmarks upperLip on: aCanvas.
	self drawConnectedLandmarks: self faceLandmarks underLip on: aCanvas.
	self drawConnectedLandmarks: self faceLandmarks mouth on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawNoseDetailsOn: aCanvas [
	self drawConnectedLandmarks: self faceLandmarks noseTip on: aCanvas.  
	self drawConnectedLandmarks: self faceLandmarks noseRoot on: aCanvas.
	self drawConnectedLandmarks: self faceLandmarks noseRightAlar on: aCanvas.
	self drawConnectedLandmarks: self faceLandmarks noseLeftAlar on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawOnSpartaCanvas: aSpartaCanvas [
	super drawOnSpartaCanvas: aSpartaCanvas.
	
	self faceLandmarks hasEyes ifTrue: [
		self drawEyesDetailsOn: aSpartaCanvas ].
	self faceLandmarks hasEyesbrowse ifTrue: [
		self drawEyesbrowseDetailsOn: aSpartaCanvas ].
	self faceLandmarks hasNose ifTrue: [
		self drawNoseDetailsOn: aSpartaCanvas ].
	self faceLandmarks hasCompleteMouth ifTrue: [
		self drawMouthDetailsOn: aSpartaCanvas ].
]

{ #category : #accessing }
GtCSInspectorFaceBlocElement >> faceLandmarks [
	^ face landmarks 
]

{ #category : #initialization }
GtCSInspectorFaceBlocElement >> initializeForFace: aFace [
	self size: aFace rectangle extent.
	self background: (aFace hasFaceForm 
		ifTrue: [ aFace faceForm ]
		ifFalse: [ (Form extent: aFace rectangle extent) 
			fillColor: Color white ]).
	face := aFace.
]

{ #category : #transformation }
GtCSInspectorFaceBlocElement >> translateLandmarks: landmarkPoints [
	^ landmarkPoints collect: [ :aPoint | 
		(aPoint - face rectangle topLeft) ]
]
