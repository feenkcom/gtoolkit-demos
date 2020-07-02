Class {
	#name : #TDNullSimplePost,
	#superclass : #TDNullModel,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDNullSimplePost >> body [
	^ ''.
]

{ #category : #accessing }
TDNullSimplePost >> id [
	^ 0.
]

{ #category : #accessing }
TDNullSimplePost >> title [
	^ ''.
]

{ #category : #accessing }
TDNullSimplePost >> userId [
	^ 0.
]
