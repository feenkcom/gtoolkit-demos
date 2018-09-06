as yet unclassified
computeScaleUsing: aPoint
	| scaleX scaleY |
	scaleX := (self extent x / aPoint x).
	scaleY := (self extent y / aPoint y).
	^ (scaleX min: scaleY) asPoint