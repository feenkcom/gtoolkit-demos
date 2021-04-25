Class {
	#name : #GhRepos,
	#superclass : #GhEntity,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhRepos >> items [
	^ rawData collect: [ :each | GhRepo new rawData: each ]
]
