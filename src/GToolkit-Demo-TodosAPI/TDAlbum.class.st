Class {
	#name : #TDAlbum,
	#superclass : #TDModel,
	#instVars : [
		'rawData',
		'imagesGroup'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDAlbum class >> empty [
	^ TDNullAlbum uniqueInstance.
]

{ #category : #accessing }
TDAlbum >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details' translated;
		priority: 2;
		items: [ {
			('Title: ' -> self title).
			('Id: ' -> self id).
			('User: ' -> self user)} ];
		column: 'Property' translated text: [ :assoc | assoc key ];
		column: 'Value' translated text: [ :assoc | assoc value ];
		send: [:association | association value].
]

{ #category : #accessing }
TDAlbum >> gtImagesListFor: aView [
	<gtView>
	self imagesGroup images ifEmpty: [ ^ aView empty ].
	^ aView forward
		title: 'Photos';
		priority: 5;
		object: [ self imagesGroup ];
		view: #gtImagesListFor:
]

{ #category : #accessing }
TDAlbum >> id [
	^ self rawData at: #id.
]

{ #category : #accessing }
TDAlbum >> imagesGroup [
	^ imagesGroup ifNil: [ imagesGroup := self requestImagesFromThisAlbum ].
]

{ #category : #accessing }
TDAlbum >> rawData [
	^ rawData.
]

{ #category : #accessing }
TDAlbum >> rawData: aDictionary [
	rawData := aDictionary.
]

{ #category : #accessing }
TDAlbum >> requestImagesFromThisAlbum [
	^ TDClient new getImagesForAlbumId: self id.
]

{ #category : #accessing }
TDAlbum >> title [
	^ self rawData at: #title.
]

{ #category : #accessing }
TDAlbum >> user [
	^ TDClient new getUserWithId: self userId.
]

{ #category : #accessing }
TDAlbum >> userId [
	^ self rawData at: #userId.
]
