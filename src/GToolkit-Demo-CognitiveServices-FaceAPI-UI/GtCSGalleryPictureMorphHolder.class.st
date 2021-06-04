"
I am an element of an infinite list that can hold a picture wrapper.


"
Class {
	#name : #GtCSGalleryPictureMorphHolder,
	#superclass : #BlInfiniteHolder,
	#instVars : [
		'pictureWrapper'
	],
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-UI'
}

{ #category : #initialization }
GtCSGalleryPictureMorphHolder >> initialize [
	super initialize.
	itemElement := GtCSGalleryPictureMorph new
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent.
			c margin: (BlInsets top: 0 right: 0 bottom: 4 left: 0) ];
		yourself
]

{ #category : #accessing }
GtCSGalleryPictureMorphHolder >> pictureWrapper [
	^ pictureWrapper
]

{ #category : #accessing }
GtCSGalleryPictureMorphHolder >> pictureWrapper: aPictureWrapper [
	pictureWrapper := aPictureWrapper.
	itemElement pictureWrapper: pictureWrapper
]
