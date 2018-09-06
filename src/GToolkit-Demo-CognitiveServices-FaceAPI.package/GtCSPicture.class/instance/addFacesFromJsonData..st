adding
addFacesFromJsonData: faceStructures
	self ensureFacesStorage.
	faceStructures do: [ :aFaceStructure |
		self addFace: (GtCSFace new
			initializeFromJson: aFaceStructure) ]