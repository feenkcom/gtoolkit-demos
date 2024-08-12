Class {
	#name : #SyncTexOutputItem,
	#superclass : #Object,
	#instVars : [
		'rawData'
	],
	#category : #'GToolkit-Demo-SyncTex'
}

{ #category : #accessing }
SyncTexOutputItem >> fileName [
	^ rawData first second
]

{ #category : #accessing }
SyncTexOutputItem >> fileReference [
	^ self fileName asFileReference
]

{ #category : #accessing }
SyncTexOutputItem >> gtPictureFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Picture';
		stencil: [ self highlightedPicture]
]

{ #category : #accessing }
SyncTexOutputItem >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Raw data';
		items: [rawData];
		column: 'Property' text: #first;
		column: 'Value' text: #second
]

{ #category : #accessing }
SyncTexOutputItem >> h [
	^ rawData fourth second
]

{ #category : #accessing }
SyncTexOutputItem >> hCap [
	^ rawData eighth second
]

{ #category : #accessing }
SyncTexOutputItem >> highlightedPicture [
	| image imageElement container |
	image := SkiaImage fromFile: self pictureFileReference.
	imageElement := image asElement size: image extent.
	container := BlElement new size: image extent.
	container addChild: imageElement.
	container
		addChild: (BlElement new
				background: (Color red alpha: 0.5);
				size: self wCap @ self hCap;
				relocate: self x @ self v).
	^ container
]

{ #category : #accessing }
SyncTexOutputItem >> pageNumber [
	^ rawData second second
]

{ #category : #accessing }
SyncTexOutputItem >> pictureFileName [
	^ self fileReference withoutExtension fullName , '-'
		, (self pageNumber - 1) asString , '.png'
]

{ #category : #accessing }
SyncTexOutputItem >> pictureFileReference [
	| file |
	file := self pictureFileName asFileReference.
	file exists
		ifFalse: [ GtSubprocessWithInMemoryOutput new
				shellCommand: 'magick -density 72 -depth 8 -quality 85 ' , 
				self fileName , ' ', 
				(self fileReference withoutExtension, 'png') fullName;
				runAndWait].
	^ file
]

{ #category : #accessing }
SyncTexOutputItem >> rawData: anObject [ 
	rawData := anObject
]

{ #category : #accessing }
SyncTexOutputItem >> v [
	^ rawData sixth second
]

{ #category : #accessing }
SyncTexOutputItem >> wCap [
	^ rawData seventh second
]

{ #category : #accessing }
SyncTexOutputItem >> x [
	^ rawData third second
]

{ #category : #accessing }
SyncTexOutputItem >> y [
	^ rawData fourth second
]
