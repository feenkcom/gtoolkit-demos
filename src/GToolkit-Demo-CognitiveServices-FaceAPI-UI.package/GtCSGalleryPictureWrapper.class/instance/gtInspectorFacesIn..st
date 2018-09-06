inspection
gtInspectorFacesIn: composite
	<gtInspectorPresentationOrder: 20>
	self picture ifNotNil: [ 
		self picture gtInspectorFacesIn: composite  ]