initialization
initialize
	super initialize.
	self returnFaceId: false.
	self returnFaceLandmarks: true.
	self returnFaceAttributes: OrderedCollection new.