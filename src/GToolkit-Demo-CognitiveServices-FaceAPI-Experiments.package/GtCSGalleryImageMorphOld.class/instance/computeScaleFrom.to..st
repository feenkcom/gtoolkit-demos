as yet unclassified
computeScaleFrom: aReferenceExtent to: aDesiredExtent
	| scaleX scaleY |
	scaleX := (aReferenceExtent x / aDesiredExtent x).
	scaleY := (aReferenceExtent y / aDesiredExtent y).
	^ (scaleX min: scaleY) asPoint