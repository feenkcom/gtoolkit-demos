actions
ensurePictureForm
	| client  |
	self url ifNil: [ ^ nil ].
	client := ZnClient new
 		beOneShot;
  		contentReader: [ :entity | 
			ImageReadWriter formFromStream: entity readStream binary ].
	self pictureForm: (client get: self url)