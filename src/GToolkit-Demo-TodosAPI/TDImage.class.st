Class {
	#name : #TDImage,
	#superclass : #TDModel,
	#instVars : [
		'rawData',
		'thumbnail',
		'image'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDImage class >> empty [
	^ TDNullImage uniqueInstance.
]

{ #category : #accessing }
TDImage >> album [
	^ TDClient new getAlbumWithId: self albumId.
]

{ #category : #accessing }
TDImage >> albumId [
	^ self rawData at: #albumId.
]

{ #category : #accessing }
TDImage >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details' translated;
		priority: 5;
		items: [ {
			('Title: ' -> self title).
			('Id: ' -> self id).
			('Album: ' -> self album).
			('Url: ' -> self url).
			('Thumbnail url: ' -> self thumbnailUrl)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ];
		send: [:association | association value].
]

{ #category : #accessing }
TDImage >> gtImageFor: aView [
	<gtView>
	^ aView explicit
		title: 'Photo';
		priority: 2;
		stencil: [
			self image ].
]

{ #category : #accessing }
TDImage >> gtThumbnailFor: aView [
	<gtView>
	^ aView explicit
		title: 'Thumbnail';
		priority: 3;
		stencil: [
			self thumbnail ].
]

{ #category : #accessing }
TDImage >> id [
	^ self rawData at: #id.
]

{ #category : #accessing }
TDImage >> image [
	| content |
	content := ZnClient new
		url: self url;
		get.
	^ (ImageReadWriter formFromStream: content readStream) asElement
		constraintsDo: [:c |
			c frame vertical alignCenter.
			c frame horizontal alignCenter].
]

{ #category : #accessing }
TDImage >> rawData [
	^ rawData.
]

{ #category : #accessing }
TDImage >> rawData: aDictionary [
	rawData := aDictionary.
]

{ #category : #accessing }
TDImage >> thumbnail [
	| content |
	content := ZnClient new
		url: self thumbnailUrl;
		get.
	^ (ImageReadWriter formFromStream: content readStream) asElement
		constraintsDo: [:c |
			c frame vertical alignCenter.
			c frame horizontal alignCenter].
]

{ #category : #accessing }
TDImage >> thumbnailUrl [
	^ self rawData at: #thumbnailUrl.
]

{ #category : #accessing }
TDImage >> title [
	^ self rawData at: #title.
]

{ #category : #accessing }
TDImage >> url [
	^ self rawData at: #url.
]
