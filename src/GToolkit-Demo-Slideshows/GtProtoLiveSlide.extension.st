Extension { #name : #GtProtoLiveSlide }

{ #category : #'*GToolkit-Demo-Slideshows' }
GtProtoLiveSlide >> setPriority [
	| sender |
	sender := thisContext sender.
	self
		assert: (sender receiver isKindOf: PrioritySlideshow)
		description: 'setPriority should only be sent from an instance of a PrioritySlideshow subclass'.
	self priority: (sender receiver priorityFor: sender selector)
]
