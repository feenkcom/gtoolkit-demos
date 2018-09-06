transformation
computeScale
	| scaleX scaleY |
	scaleX := (self extent x / face rectangle width).
	scaleY := (self extent y / face rectangle height).
	^ (scaleX min: scaleY) asPoint