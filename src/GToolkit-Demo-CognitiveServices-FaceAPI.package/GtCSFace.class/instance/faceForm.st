accessing - dynamic
faceForm
	^ self hasFaceForm ifTrue: [ 
		self containerPicture pictureForm copy: self rectangle ]