Class {
	#name : #GhGroup,
	#superclass : #GhObject,
	#traits : 'TGtGroup',
	#classTraits : 'TGtGroup classTrait',
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhGroup >> gtItemsFor: aView [
	<gtView>
	^ aView list 
		title: 'Items';
		priority: 1;
		items: [self items]
]
