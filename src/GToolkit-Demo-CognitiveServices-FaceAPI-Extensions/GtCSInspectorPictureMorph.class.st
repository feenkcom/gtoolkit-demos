"
I am a morph that can highlight on a picture the list of faces from that picture.
"
Class {
	#name : #GtCSInspectorPictureMorph,
	#superclass : #AlphaImageMorph,
	#instVars : [
		'picture',
		'facesColor'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-Extensions'
}

{ #category : #drawing }
GtCSInspectorPictureMorph >> drawFaces: facesList on: aCanvas [
	facesList do: [ :aFace |
		| scaledRectangle |
		scaledRectangle := self toLocalRectangle: aFace rectangle.
		aCanvas 
			frameRectangle: scaledRectangle
			width: 2 
			color: (self facesColor at: aFace ifAbsent: [ Color blue ]) ]
]

{ #category : #drawing }
GtCSInspectorPictureMorph >> drawOn: aCanvas [
	super drawOn: aCanvas.
	self drawFaces: picture faces on: aCanvas.
]

{ #category : #accessing }
GtCSInspectorPictureMorph >> facesColor [
	^ facesColor ifNil: [ facesColor := Dictionary new ]
]

{ #category : #accessing }
GtCSInspectorPictureMorph >> facesColor: aDictionary [
	facesColor := aDictionary
]

{ #category : #initialization }
GtCSInspectorPictureMorph >> initialize [
	super initialize.
	self layout: #scaledAspect
]

{ #category : #searching }
GtCSInspectorPictureMorph >> locateElementAt: scaledPoint [
	^ picture faces 
		detect: [ :aFace | aFace rectangle containsPoint: scaledPoint ]
		ifNone: [ picture ]
]

{ #category : #accessing }
GtCSInspectorPictureMorph >> objectAtLocalCoordinates: aPoint [
	| scaledPoint |
	scaledPoint := self toInitialCoordinates: aPoint.
	^ self locateElementAt: scaledPoint
]

{ #category : #accessing }
GtCSInspectorPictureMorph >> picture: aPicture [
	| finalForm |
	picture := aPicture.
	finalForm := aPicture pictureForm.
	(finalForm isNil and: [ aPicture faces notEmpty ]) ifTrue: [ 
		| pictureRectangle |
		pictureRectangle := 0@0 corner: 0@0.
		aPicture faces do: [ :aFace |  
			pictureRectangle := pictureRectangle merge: aFace rectangle ].
		finalForm := Form extent: (pictureRectangle extendBy: 25) corner ].
	self form: finalForm.
]

{ #category : #transforming }
GtCSInspectorPictureMorph >> toInitialCoordinates: aPoint [
	| scaleFactor |
	scaleFactor := self form extent / self cachedForm extent.
	^ (aPoint - (self layoutPosition)) scaleBy: scaleFactor
]

{ #category : #transforming }
GtCSInspectorPictureMorph >> toLocalRectangle: faceRectangle [
	| scaleFactor scaledRectangle |
	scaleFactor := self cachedForm extent / self form extent.
	scaledRectangle := faceRectangle scaleBy: scaleFactor.
	^ Rectangle 
		origin: scaledRectangle origin + self layoutPosition 
		extent: scaledRectangle extent
]
