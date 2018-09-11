"
I am a bloc morph that displays a picture and highlights all faces from that picture.
"
Class {
	#name : #GtCSGalleryPictureMorph,
	#superclass : #BlElement,
	#instVars : [
		'pictureWrapper',
		'containerMorph'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-UI'
}

{ #category : #accessing }
GtCSGalleryPictureMorph >> addFaceMorphFor: aFace [
	containerMorph addChild: (BlElement new
		relocate: aFace rectangle origin;
		size: aFace rectangle extent;
		border: (BlBorder paint: Color blue width: 4))
]

{ #category : #layout }
GtCSGalleryPictureMorph >> applyLayoutIn: aBounds [
	super applyLayoutIn: aBounds.
	pictureWrapper ensureDataLoaded
]

{ #category : #initialization }
GtCSGalleryPictureMorph >> defaultLayout [
	^ BlLinearLayout vertical
]

{ #category : #initialization }
GtCSGalleryPictureMorph >> initialize [
	| scalableElement |
	super initialize.
	containerMorph := BlElement new.
	scalableElement := BlScalableElement new
		fitWidth;
		contentElement: containerMorph;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	self addChild: scalableElement
]

{ #category : #accessing }
GtCSGalleryPictureMorph >> pictureWrapper [
	^ pictureWrapper
]

{ #category : #accessing }
GtCSGalleryPictureMorph >> pictureWrapper: aPictureWrapper [
	pictureWrapper := aPictureWrapper.
	containerMorph 
		size: pictureWrapper extent;
		background: (BlBackground image: pictureWrapper pictureForm);
		removeChildren.
	pictureWrapper faces do: [ :aFace |
		self addFaceMorphFor: aFace ]
]
