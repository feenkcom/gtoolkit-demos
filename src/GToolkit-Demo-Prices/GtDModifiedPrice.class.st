Class {
	#name : #GtDModifiedPrice,
	#superclass : #GtDPrice,
	#instVars : [
		'price'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #accessing }
GtDModifiedPrice >> children [
	^ { self price }
]

{ #category : #printing }
GtDModifiedPrice >> gtDisplayOn: stream [
	self money gtDisplayOn: stream.
	stream nextPutAll: ' = '.
	self localDisplayOn: stream
]

{ #category : #printing }
GtDModifiedPrice >> localDisplayOn: stream [
	self subclassResponsibility
]

{ #category : #printing }
GtDModifiedPrice >> localWithPossibleParanthesesDisplayOn: stream [
	stream nextPutAll: '('.
	self localDisplayOn: stream.
	stream nextPutAll: ')'
]

{ #category : #accessing }
GtDModifiedPrice >> price [
	^ price
]

{ #category : #accessing }
GtDModifiedPrice >> price: anObject [
	price := anObject
]
