Class {
	#name : #TDImagesGroup,
	#superclass : #TDModel,
	#instVars : [
		'images'
	],
	#category : #'GToolkit-Demo-TodosAPI-Core'
}

{ #category : #accessing }
TDImagesGroup >> gtImagesListFor: aView [
	<gtView>
	^ aView explicit
		title: 'Images';
		priority: 2;
		stencil: [
			| container imageContainer |
			container := BlElement new
				layout: BlFlowLayout new;
				constraintsDo: [ :c | 
					c vertical fitContent.
					c horizontal matchParent ];
				padding: (BlInsets all: 10).
			self images do: [:eachImage |
				imageContainer := BlLazyElement new
					withGlamorousPreview;
					neverUpdate;
					constraintsDo: [ :c | 
						c vertical exact: 100. 
						c horizontal exact: 150 ];
					background: Color white;
					look: BrShadowLook new;
					margin: (BlInsets all: 10);
					addChild: eachImage thumbnail;
					when: BlClickEvent
					do: [:e | imageContainer phlow spawnObject: eachImage].
				container addChild: imageContainer].
			container asScrollableElement ].
]

{ #category : #accessing }
TDImagesGroup >> images [
	^ images ifNil: [ OrderedCollection new ].
]

{ #category : #accessing }
TDImagesGroup >> images: aList [
	images := aList.
]
