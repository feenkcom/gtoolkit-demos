inspection
gtInspectorPictureIn: composite
	<gtInspectorPresentationOrder: 20>
	self picture ifNotNil: [ 
		self picture gtInspectorPictureIn: composite  ]