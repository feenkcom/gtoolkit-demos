Class {
	#name : #TDNullAlbum,
	#superclass : #TDNullModel,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDNullAlbum >> id [
	^ 0.
]

{ #category : #accessing }
TDNullAlbum >> imagesGroup [
	^ nil.
]

{ #category : #accessing }
TDNullAlbum >> title [
	^ ''.
]

{ #category : #accessing }
TDNullAlbum >> user [
	^ nil.
]

{ #category : #accessing }
TDNullAlbum >> userId [
	^ 0.
]
