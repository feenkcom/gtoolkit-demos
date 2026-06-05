Extension { #name : #RGMethodDefinition }

{ #category : #'*GToolkit-Demo-Slideshows' }
RGMethodDefinition >> gtSlideWithTextFor: aView [
	<gtView>
	<gtToolView>
	
	(self method hasPragmaNamed: #gtSlide) ifFalse: [ ^ aView empty ].
	(self method hasPragmaNamed: #text:) ifFalse: [ ^ aView empty ].
	^ aView forward
		title: 'Slide with text';
		priority: 7;
		object: [ self method slidePage asContentUIModel ];
		view: #gtLiveFor:;
		actionUpdateButton
]
