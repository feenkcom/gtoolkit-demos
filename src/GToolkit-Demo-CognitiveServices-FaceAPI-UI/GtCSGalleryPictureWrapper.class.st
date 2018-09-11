"
I wrap a picture object and add support for loading the picture form and the face data.
"
Class {
	#name : #GtCSGalleryPictureWrapper,
	#superclass : #Object,
	#instVars : [
		'index',
		'picture',
		'extent',
		'dataSource',
		'loaderProcess'
	],
	#classInstVars : [
		'defaultPictureForm'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-UI'
}

{ #category : #accessing }
GtCSGalleryPictureWrapper class >> defaultPictureForm [
	^ defaultPictureForm ifNil: [
		defaultPictureForm := (Form extent: 300@300) fillColor: Color white ]
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> dataSource: aDataSource [
	dataSource := aDataSource
]

{ #category : #actions }
GtCSGalleryPictureWrapper >> ensureDataLoaded [
	| loadActions |
	loadActions := #().
	picture pictureForm ifNil: [ 
		loadActions := #(loadPictureFormFor:) ].
	picture hasFaceStorage ifFalse: [ 
		loadActions := loadActions, #(loadFaceDataFor:) ].
	loadActions ifNotEmpty: [ 
		self performActions: loadActions ]
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> extent [
	^ extent ifNil: [ self pictureForm extent ]
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> faces [
	^ picture faces
]

{ #category : #inspection }
GtCSGalleryPictureWrapper >> gtInspectorFacesIn: composite [
	<gtInspectorPresentationOrder: 20>
	self picture ifNotNil: [ 
		self picture gtInspectorFacesIn: composite  ]
]

{ #category : #inspection }
GtCSGalleryPictureWrapper >> gtInspectorPictureIn: composite [
	<gtInspectorPresentationOrder: 20>
	self picture ifNotNil: [ 
		self picture gtInspectorPictureIn: composite  ]
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> index: anInteger [
	index := anInteger
]

{ #category : #actions }
GtCSGalleryPictureWrapper >> performActions: loadActions [
	loaderProcess ifNotNil: [ ^ self ].
	loaderProcess := [ 
		loadActions do: [ :anAction |
			dataSource perform: anAction with: self.
			BlUniverse default defer: [
				dataSource notifyItemsChanged: (index to: index) ]].
		BlUniverse default defer: [
			loaderProcess := nil ]
	] fork
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> picture [
	^ picture
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> picture: aPicture [
	picture := aPicture
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> pictureForm [
	^ picture pictureForm ifNil: [ self class defaultPictureForm ]
]

{ #category : #accessing }
GtCSGalleryPictureWrapper >> pictureForm: aForm [
	aForm ifNotNil: [ extent := aForm extent ].
	picture pictureForm: aForm 
]

{ #category : #actions }
GtCSGalleryPictureWrapper >> releasePictureForm [
	picture pictureForm: nil
]
