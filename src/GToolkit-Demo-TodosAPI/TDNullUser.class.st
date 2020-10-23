Class {
	#name : #TDNullUser,
	#superclass : #TDNullModel,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDNullUser >> email [
	^ ''.
]

{ #category : #accessing }
TDNullUser >> id [
	^ 0.
]

{ #category : #accessing }
TDNullUser >> name [
	^ ''.
]

{ #category : #accessing }
TDNullUser >> phone [
	^ ''.
]

{ #category : #accessing }
TDNullUser >> postsGroup [
	^ nil.
]

{ #category : #accessing }
TDNullUser >> todosGroup [
	^ nil.
]

{ #category : #accessing }
TDNullUser >> username [
	^ ''.
]
