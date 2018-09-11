Class {
	#name : #GtCSGalleryImageMorphOld,
	#superclass : #BlElement,
	#instVars : [
		'picture',
		'bitmap'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-Experiments'
}

{ #category : #'as yet unclassified' }
GtCSGalleryImageMorphOld >> computeScaleFrom: aReferenceExtent to: aDesiredExtent [
	| scaleX scaleY |
	scaleX := (aReferenceExtent x / aDesiredExtent x).
	scaleY := (aReferenceExtent y / aDesiredExtent y).
	^ (scaleX min: scaleY) asPoint
]

{ #category : #'as yet unclassified' }
GtCSGalleryImageMorphOld >> computeScaleUsing: aPoint [
	| scaleX scaleY |
	scaleX := (self extent x / aPoint x).
	scaleY := (self extent y / aPoint y).
	^ (scaleX min: scaleY) asPoint
]

{ #category : #initialization }
GtCSGalleryImageMorphOld >> defaultLayout [
	^ BlFrameLayout new
]

{ #category : #initialization }
GtCSGalleryImageMorphOld >> defaultWidth [
	^ 500
]

{ #category : #drawing }
GtCSGalleryImageMorphOld >> drawOnSpartaCanvas: aCanvas [
	| aScale origin|
	super drawOnSpartaCanvas: aCanvas.
	
	(picture isNil or: [ picture pictureForm isNil ]) ifTrue: [ ^ self ].
	
	bitmap ifNil: [ bitmap := aCanvas bitmap fromForm: picture pictureForm ].
	
	"aScale := self computeScaleFrom: self extent to: picture pictureForm extent asFloatPoint."
	aScale := (self extent / picture pictureForm extent) asFloatPoint.
	
	aScale ~= (1@1) ifTrue: [ 
		aCanvas transform
			push;
			scaleBy: aScale;
			apply ].
	"self halt."
	"origin := (self bounds center scaleBy: (picture pictureForm extent/self extent))  - 
			(picture pictureForm extent //2 ) asFloatPoint."
	origin := 0@0.
	
	aCanvas fill
		path: (origin extent: picture pictureForm extent);
		paint: bitmap;
		draw.
		
	aScale ~= (1@1) ifTrue: [ 
		aCanvas transform pop ]
]

{ #category : #initialization }
GtCSGalleryImageMorphOld >> initialize [
	super initialize.

	self background: Color veryVeryDarkGray lighter.
	self padding: (BlInsets left: 20).
]

{ #category : #layout }
GtCSGalleryImageMorphOld >> onMeasure: anExtentMeasurementSpec [
	| aWidth aHeight aWidthSpec aHeightSpec |
	super onMeasure: anExtentMeasurementSpec.
	
	aWidthSpec := anExtentMeasurementSpec widthSpec.
	aHeightSpec := anExtentMeasurementSpec heightSpec.

	aWidth := aWidthSpec isUnspecified
		ifTrue: [ picture pictureForm width ]
		ifFalse: [ aWidthSpec size ].

	"Unspecified means that layout may take as much space horizontally as it wishes"
	aHeight := aHeightSpec isUnspecified
		ifTrue: [ picture pictureForm height * (aWidth / picture pictureForm width) ]
		ifFalse: [ aHeightSpec size ].

	self measuredExtent: aWidth @ aHeight
]

{ #category : #accessing }
GtCSGalleryImageMorphOld >> picture: aPicture [
	picture := aPicture.
	bitmap := nil
]
