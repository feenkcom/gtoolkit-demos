Extension { #name : #RGMethodDefinition }

{ #category : #'*GToolkit-Demo-Slideshows' }
RGMethodDefinition >> gtSlideWithTextFor: aView [
	<gtView>
	(self method hasPragmaNamed: #gtSlide) ifFalse: [ ^ aView empty ].
	(self method hasPragmaNamed: #text:) ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Slide with text';
		priority: 6;
		object: [ self method slidePage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton
]
