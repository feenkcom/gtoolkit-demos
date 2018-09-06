utils
ensureCachedForm
	^ cachedForm ifNil: [
		| faceForm |
		faceForm := face hasFaceForm 
			ifTrue: [ face faceForm ]
			ifFalse: [ (Form extent: face rectangle extent) 
				fillColor: Color white ].
		cachedForm := faceForm 
			magnify: faceForm boundingBox 
			by: scale smoothing: 2 ]