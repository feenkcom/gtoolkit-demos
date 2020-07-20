Class {
	#name : #TDNullPost,
	#superclass : #TDNullModel,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDNullPost >> body [
	^ ''.
]

{ #category : #accessing }
TDNullPost >> comments [
	^ OrderedCollection new.
]

{ #category : #accessing }
TDNullPost >> id [
	^ 0.
]

{ #category : #accessing }
TDNullPost >> title [
	^ ''.
]

{ #category : #accessing }
TDNullPost >> userId [
	^ 0.
]
