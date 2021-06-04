"
I am a morph that can highlight on a face object the landmarks associated with the face.


"
Class {
	#name : #GtCSInspectorFaceMorph,
	#superclass : #Morph,
	#instVars : [
		'face',
		'scale',
		'cachedForm'
	],
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-Extensions'
}

{ #category : #transformation }
GtCSInspectorFaceMorph >> computeScale [
	| scaleX scaleY |
	scaleX := (self extent x / face rectangle width).
	scaleY := (self extent y / face rectangle height).
	^ (scaleX min: scaleY) asPoint
]

{ #category : #drawing }
GtCSInspectorFaceMorph >> drawConnectedLandmarks: points on: aCanvas [
	| translatedPoints | 
	translatedPoints := self translateLandmarks: points.
	aCanvas 
		drawPolygon: translatedPoints
		fillStyle: Color transparent
		borderWidth: 1
		borderColor: Color blue.
	translatedPoints do: [ :aLandmarkPoint | 
		aCanvas 
			fillRectangle: (Rectangle 
			center: aLandmarkPoint extent: 4 asPoint)  
			fillStyle: Color blue ]
]

{ #category : #drawing }
GtCSInspectorFaceMorph >> drawEyesDetailsOn: aCanvas [
	self drawConnectedLandmarks: self eyeRight on: aCanvas.
	self drawConnectedLandmarks: self eyeLeft on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceMorph >> drawMouthDetailsOn: aCanvas [
	self drawConnectedLandmarks: self upperLip on: aCanvas.
	self drawConnectedLandmarks: self underLip on: aCanvas.
	self drawConnectedLandmarks: self mouth on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceMorph >> drawNoseDetailsOn: aCanvas [
	self drawConnectedLandmarks: self noseTip on: aCanvas.  
	self drawConnectedLandmarks: self noseRoot on: aCanvas.
	self drawConnectedLandmarks: self noseRightAlar on: aCanvas.
	self drawConnectedLandmarks: self noseLeftAlar on: aCanvas.
]

{ #category : #drawing }
GtCSInspectorFaceMorph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	aCanvas paintImage: self ensureCachedForm at: self bounds topLeft.
	self drawEyesDetailsOn: aCanvas.
	self drawNoseDetailsOn: aCanvas.
	self drawMouthDetailsOn: aCanvas.
]

{ #category : #utils }
GtCSInspectorFaceMorph >> ensureCachedForm [
	^ cachedForm ifNil: [
		| faceForm |
		faceForm := face hasFaceForm 
			ifTrue: [ face faceForm ]
			ifFalse: [ (Form extent: face rectangle extent) 
				fillColor: Color white ].
		cachedForm := faceForm 
			magnify: faceForm boundingBox 
			by: scale smoothing: 2 ]
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> eyeLeft [
	^ {(self propertyAt: 'eyeLeftTop').
	(self propertyAt: 'eyeLeftInner').
	(self propertyAt: 'eyeLeftBottom').
	(self propertyAt: 'eyeLeftOuter')}
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> eyeRight [
	^ {(self propertyAt: 'eyeRightTop').
	(self propertyAt: 'eyeRightInner').
	(self propertyAt: 'eyeRightBottom').
	(self propertyAt: 'eyeRightOuter')}
]

{ #category : #initialization }
GtCSInspectorFaceMorph >> initialize [
	super initialize.
	self color: Color transparent.
]

{ #category : #initialization }
GtCSInspectorFaceMorph >> initializeForFace: aFace withExtent: anExtent [
	self extent: anExtent.
	face := aFace.
	scale := self computeScale
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> mouth [
	^ {(self propertyAt: 'mouthLeft').
	(self propertyAt: 'mouthRight')}
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> noseLeftAlar [
	^ {(self propertyAt: 'noseLeftAlarOutTip').
	(self propertyAt: 'noseLeftAlarTop')}
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> noseRightAlar [
	^ {(self propertyAt: 'noseRightAlarOutTip').
	(self propertyAt: 'noseRightAlarTop')}
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> noseRoot [
	^ {(self propertyAt: 'noseRootLeft').
	(self propertyAt: 'noseRootRight')}
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> noseTip [
	^ {(self propertyAt: 'noseTip')}
]

{ #category : #accessing }
GtCSInspectorFaceMorph >> propertyAt: aName [
 	^ face landmarks propertyAt: aName ifAbsent: [ 0@0 ]
]

{ #category : #transformation }
GtCSInspectorFaceMorph >> translateLandmarks: landmarkPoints [
	^ landmarkPoints collect: [ :aPoint | 
		(aPoint - face rectangle topLeft) scaleBy: scale ]
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> underLip [
	^ {(self propertyAt: 'underLipBottom').
	(self propertyAt: 'underLipTop')}
]

{ #category : #landmarks }
GtCSInspectorFaceMorph >> upperLip [
	^ {(self propertyAt: 'upperLipBottom').
	(self propertyAt: 'upperLipTop')}
]
