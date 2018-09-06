inspection
gtInspectorPicturesIn: aComposite
	<gtInspectorPresentationOrder: 25>
	aComposite table 
		title: 'Pictures';
		display: [ self pictures ];
		column: 'Faces' evaluated: [ :aPictureWrapper |
			| count |
			count := aPictureWrapper faces size.
			count = 1 
				ifTrue: [ '1 face' ] 
				ifFalse: [ count asString, ' faces' ] ];
		column: 'Extent' evaluated: [ :aPictureWrapper |
			(aPictureWrapper extent ifNil: [ ' - ' ]) asString  ]