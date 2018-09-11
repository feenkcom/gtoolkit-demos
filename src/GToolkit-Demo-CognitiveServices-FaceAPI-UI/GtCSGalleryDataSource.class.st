"
I am a data source that provides pictures. 

I provide support for lazyly loading pictures, as well as for lazily loading  the form associated with a picture and calling the Azure Face API.
"
Class {
	#name : #GtCSGalleryDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'faceApiClient',
		'picturesProvider',
		'pictures',
		'picturesCache'
	],
	#category : 'GToolkit-Demo-CognitiveServices-FaceAPI-UI'
}

{ #category : #'as yet unclassified' }
GtCSGalleryDataSource class >> urls [ 
	^ 'https://images.unsplash.com/photo-1501238295340-c810d3c156d2?auto=format&fit=crop&w=2850&q=60
https://images.unsplash.com/photo-1501386761578-eac5c94b800a?auto=format&fit=crop&w=1650&q=60
https://images.unsplash.com/photo-1493528237448-144452699e16?auto=format&fit=crop&w=1730&q=60
https://images.unsplash.com/photo-1495131796982-281014f71fbd?auto=format&fit=crop&w=2676&q=60
https://images.unsplash.com/photo-1478812954026-9c750f0e89fc?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1489980478712-2ab535aa775f?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1498489763436-1a5ffbbd2888?auto=format&fit=crop&w=998&q=60
https://images.unsplash.com/photo-1485889280870-db9129696fae?auto=format&fit=crop&w=1400&q=60
https://images.unsplash.com/photo-1481890342388-a3c6731f034d?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1505327895416-162c40b2e87c?auto=format&fit=crop&w=1500&q=60
https://images.unsplash.com/photo-1501622549218-2c3ef86627cb?auto=format&fit=crop&w=1504&q=60
https://images.unsplash.com/photo-1500156407682-372262e56f59?auto=format&fit=crop&w=1650&q=60
https://images.unsplash.com/photo-1462927346281-d1727e290082?auto=format&fit=crop&w=668&q=60
https://images.unsplash.com/photo-1502928800718-967273b36262?auto=format&fit=crop&w=1651&q=60
https://images.unsplash.com/photo-1416453072034-c8dbfa2856b5?auto=format&fit=crop&w=1516&q=60
https://images.unsplash.com/photo-1508248839954-53aae05bddca?auto=format&fit=crop&w=1500&q=60' lines.
]

{ #category : #accessing }
GtCSGalleryDataSource >> detectRequest [
	^ self faceApiClient detectRequest
		returnFaceId: false;
		returnFaceLandmarks: true;
		returnAllFaceAttributes
]

{ #category : #actions }
GtCSGalleryDataSource >> downloadPictureFormFor: aPicture [
	| client |
	aPicture url ifNil: [ ^ nil ].
	client := ZnClient new
 		beOneShot;
  		contentReader: [ :entity | 
			ImageReadWriter formFromStream: entity readStream binary ].
	^ client get: aPicture url
]

{ #category : #accessing }
GtCSGalleryDataSource >> faceApiClient [
	^ faceApiClient ifNil: [ faceApiClient := GtCSFaceApiClient new ]
]

{ #category : #accessing }
GtCSGalleryDataSource >> faceApiClient: aFaceApiClient [
	faceApiClient := aFaceApiClient
]

{ #category : #inspection }
GtCSGalleryDataSource >> gtInspectorPicturesIn: aComposite [
	<gtInspectorPresentationOrder: 25>
	aComposite table 
		title: 'Pictures';
		display: [ self pictures ];
		column: 'Faces' evaluated: [ :aPictureWrapper |
			| count |
			count := aPictureWrapper faces size.
			count = 1 
				ifTrue: [ '1 face' ] 
				ifFalse: [ count asString, ' faces' ] ];
		column: 'Extent' evaluated: [ :aPictureWrapper |
			(aPictureWrapper extent ifNil: [ ' - ' ]) asString  ]
]

{ #category : #accessing }
GtCSGalleryDataSource >> itemCount [
	^ self pictures size
]

{ #category : #actions }
GtCSGalleryDataSource >> loadFaceDataFor: aPictureWrapper [
	| faceStructures |
	faceStructures := self detectRequest executeFor: aPictureWrapper picture.
	aPictureWrapper picture addFacesFromJsonData: faceStructures.
]

{ #category : #actions }
GtCSGalleryDataSource >> loadPictureFormFor: aPictureWrapper [
	| pictureForm |
	pictureForm := self picturesCache 
		at: aPictureWrapper picture
		ifAbsentPut: [ self downloadPictureFormFor: aPictureWrapper picture ].
	aPictureWrapper pictureForm: pictureForm
]

{ #category : #actions }
GtCSGalleryDataSource >> loadPicturesFromProvider [
	| providedPictures |
	providedPictures := picturesProvider value.
	self pictures: (providedPictures withIndexCollect: [ :aPicture :anIndex | 
		GtCSGalleryPictureWrapper new 
			index: anIndex;
			dataSource: self;
			picture: aPicture ]) 
]

{ #category : #'instance creation' }
GtCSGalleryDataSource >> onBindHolder: anElementHolder at: aPosition [
	anElementHolder pictureWrapper: (self pictures at: aPosition)
]

{ #category : #'instance creation' }
GtCSGalleryDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ GtCSGalleryPictureMorphHolder new
]

{ #category : #hooks }
GtCSGalleryDataSource >> onElementDetached: anElementHolder [
	anElementHolder pictureWrapper ifNotNil: [ :currentPicture |
		currentPicture releasePictureForm ]
]

{ #category : #accessing }
GtCSGalleryDataSource >> pictures [
	^ pictures ifNil: [ #() ]
]

{ #category : #accessing }
GtCSGalleryDataSource >> pictures: aList [
	pictures := aList.
	self notifyChanged
]

{ #category : #accessing }
GtCSGalleryDataSource >> picturesCache [
	^ picturesCache ifNil: [ 
		self picturesCache: LRUCache new 
			beThreadSafe;
			maximumWeight: 8 ]
]

{ #category : #accessing }
GtCSGalleryDataSource >> picturesCache: aCache [
	picturesCache := aCache
]

{ #category : #accessing }
GtCSGalleryDataSource >> picturesProvider: aProvider [
	picturesProvider := aProvider
]

{ #category : #callbacks }
GtCSGalleryDataSource >> requestPictures [
	pictures ifNotNil: [ ^ self ].
	[
		self loadPicturesFromProvider.
	] fork
]
