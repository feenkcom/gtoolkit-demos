initialization
initializeForFace: aFace withExtent: anExtent
	self extent: anExtent.
	face := aFace.
	scale := self computeScale