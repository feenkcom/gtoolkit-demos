Class {
	#name : #GhContributors,
	#superclass : #GhEntity,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhContributors >> items [
	^ rawData collect: [ :each | GhContributor new rawData: each ]
]
