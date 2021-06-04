"
I am a morph that displays a list of pictures.

I use a CSGalleryDataSource for accessing the pictures that I should display.


"
Class {
	#name : #GtCSGalleryMorph,
	#superclass : #BlInfiniteElement,
	#category : #'GToolkit-Demo-CognitiveServices-FaceAPI-UI'
}

{ #category : #opening }
GtCSGalleryMorph class >> openInNewSpaceFor: galleryDataSource [
	| galleryMorph space |
	
	galleryMorph := GtCSGalleryMorph new
		dataSource: galleryDataSource;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent ].

	space := BlSpace new.
	space title: 'Pictures gallery'.
	space root addChild: galleryMorph.
	space show.
	^ space
]

{ #category : #examples }
GtCSGalleryMorph class >> openUnsplashGalleryUsingAPIKey: anApiKey [
	| galleryDataSource |
	GtCSFaceApiClient defaultKey: anApiKey.

	galleryDataSource := GtCSGalleryDataSource new
		picturesProvider: [ 
			| urls |
			urls := GtCSExamplesData unsplashPicturesCroppedUrls.
			urls withIndexCollect: [ :anUrl :anIndex |
				GtCSPicture new 
					url: anUrl ] ].
		
	GtCSGalleryMorph openInNewSpaceFor: galleryDataSource.
]

{ #category : #examples }
GtCSGalleryMorph class >> openUnsplashGalleryUsingSavedFaceData [
	| galleryDataSource |

	galleryDataSource := GtCSGalleryDataSource new
		picturesProvider: [ 
			| urls facesJson |
			urls := GtCSExamplesData unsplashPicturesCroppedUrls.
			facesJson := GtCSExamplesData unsplashJsonPicturesCropped.
			urls withIndexCollect: [ :anUrl :anIndex |
				GtCSPicture new 
					url: anUrl;
					addFacesFromJsonData: (facesJson at: anIndex) ] ].
		
	GtCSGalleryMorph openInNewSpaceFor: galleryDataSource.
]

{ #category : #initialization }
GtCSGalleryMorph >> defaultLayout [
	^ BlInfiniteLinearLayout new
]

{ #category : #'children hooks' }
GtCSGalleryMorph >> onAddedToSceneGraph [
	super onAddedToSceneGraph.
	"dataSource requestPictures"
]
