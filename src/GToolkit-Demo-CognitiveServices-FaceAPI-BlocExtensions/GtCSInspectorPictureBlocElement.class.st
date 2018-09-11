Class {
	#name : #GtCSInspectorPictureBlocElement,
	#superclass : #BlElement,
	#instVars : [
		'picture',
		'container'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-BlocExtensions'
}

{ #category : #initialization }
GtCSInspectorPictureBlocElement >> initialize [
	| extentElement |
	super initialize.
	container := BlElement new.
	extentElement := BlScalableElement new.
	extentElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	extentElement 
		contentElement: container.
	self constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	self addChild: extentElement.
]

{ #category : #initialization }
GtCSInspectorPictureBlocElement >> initializeForPicture: aPicture [
	self initializeForPicture: aPicture withFaceColors: {  } asDictionary
]

{ #category : #initialization }
GtCSInspectorPictureBlocElement >> initializeForPicture: aPicture withFaceColors: facesColor [
	| pictureForm |
	pictureForm := self pictureFormFor: aPicture.
	container
		size: pictureForm extent;
		background: (BlImageBackground image: pictureForm).
	aPicture faces do: [ :aFace |
		| faceElement |
		faceElement := BlElement new
			border: (BlBorder 
				paint: (facesColor at: aFace ifAbsent: [ Color blue ])
				width: 2);
			relocate: aFace rectangle origin.
		faceElement size: aFace rectangle extent.
		container addChild: faceElement ].
]

{ #category : #accessing }
GtCSInspectorPictureBlocElement >> pictureFormFor: aPicture [
	| finalForm |
	finalForm := aPicture pictureForm.
	finalForm ifNil: [ 
		| pictureRectangle |
		pictureRectangle := 0@0 corner: 0@0.
		aPicture faces do: [ :aFace |  
			pictureRectangle := pictureRectangle merge: aFace rectangle ].
		finalForm := Form extent: (pictureRectangle extendBy: 25) corner ].
	^ finalForm

]
