Class {
	#name : #TDNullUserId,
	#superclass : #TDNullModel,
	#traits : 'TGtUniqueInstance',
	#classTraits : 'TGtUniqueInstance classTrait',
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDNullUserId >> idValue [
	^ 0.
]

{ #category : #accessing }
TDNullUserId >> searchType [
	^ nil.
]
