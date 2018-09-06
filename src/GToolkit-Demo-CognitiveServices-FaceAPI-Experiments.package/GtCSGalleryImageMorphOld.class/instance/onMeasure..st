layout
onMeasure: anExtentMeasurementSpec
	| aWidth aHeight aWidthSpec aHeightSpec |
	super onMeasure: anExtentMeasurementSpec.
	
	aWidthSpec := anExtentMeasurementSpec widthSpec.
	aHeightSpec := anExtentMeasurementSpec heightSpec.

	aWidth := aWidthSpec isUnspecified
		ifTrue: [ picture pictureForm width ]
		ifFalse: [ aWidthSpec size ].

	"Unspecified means that layout may take as much space horizontally as it wishes"
	aHeight := aHeightSpec isUnspecified
		ifTrue: [ picture pictureForm height * (aWidth / picture pictureForm width) ]
		ifFalse: [ aHeightSpec size ].

	self measuredExtent: aWidth @ aHeight