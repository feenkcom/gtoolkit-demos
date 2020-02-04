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
	path := (BlPolygon vertices: translatedPoints) buildPathOnSpartaCanvas: aCanvas.
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
	self drawConnectedLandmarks: self eyeRight on: aCanvas.
	self drawConnectedLandmarks: self eyeLeft on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawMouthDetailsOn: aCanvas [
	self drawConnectedLandmarks: self upperLip on: aCanvas.
	self drawConnectedLandmarks: self underLip on: aCanvas.
	self drawConnectedLandmarks: self mouth on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawNoseDetailsOn: aCanvas [
	self drawConnectedLandmarks: self noseTip on: aCanvas.  
	self drawConnectedLandmarks: self noseRoot on: aCanvas.
	self drawConnectedLandmarks: self noseRightAlar on: aCanvas.
	self drawConnectedLandmarks: self noseLeftAlar on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceBlocElement >> drawOnSpartaCanvas: aSpartaCanvas [
	self drawEyesDetailsOn: aSpartaCanvas.
	self drawNoseDetailsOn: aSpartaCanvas.
	self drawMouthDetailsOn: aSpartaCanvas.
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> eyeLeft [
	^ {(self propertyAt: 'eyeLeftTop').
	(self propertyAt: 'eyeLeftInner').
	(self propertyAt: 'eyeLeftBottom').
	(self propertyAt: 'eyeLeftOuter')}
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> eyeRight [
	^ {(self propertyAt: 'eyeRightTop').
	(self propertyAt: 'eyeRightInner').
	(self propertyAt: 'eyeRightBottom').
	(self propertyAt: 'eyeRightOuter')}
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

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> mouth [
	^ {(self propertyAt: 'mouthLeft').
	(self propertyAt: 'mouthRight')}
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> noseLeftAlar [
	^ {(self propertyAt: 'noseLeftAlarOutTip').
	(self propertyAt: 'noseLeftAlarTop')}
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> noseRightAlar [
	^ {(self propertyAt: 'noseRightAlarOutTip').
	(self propertyAt: 'noseRightAlarTop')}
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> noseRoot [
	^ {(self propertyAt: 'noseRootLeft').
	(self propertyAt: 'noseRootRight')}
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> noseTip [
	^ {(self propertyAt: 'noseTip')}
]

{ #category : #accessing }
GtCSInspectorFaceBlocElement >> propertyAt: aName [
 	^ face landmarks propertyAt: aName ifAbsent: [ 0@0 ]
]

{ #category : #transformation }
GtCSInspectorFaceBlocElement >> translateLandmarks: landmarkPoints [
	^ landmarkPoints collect: [ :aPoint | 
		(aPoint - face rectangle topLeft) ]
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> underLip [
	^ {(self propertyAt: 'underLipBottom').
	(self propertyAt: 'underLipTop')}
]

{ #category : #landmarks }
GtCSInspectorFaceBlocElement >> upperLip [
	^ {(self propertyAt: 'upperLipBottom').
	(self propertyAt: 'upperLipTop')}
]
