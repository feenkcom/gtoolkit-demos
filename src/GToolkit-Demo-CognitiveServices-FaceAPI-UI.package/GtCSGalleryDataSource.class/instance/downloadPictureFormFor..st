actions
downloadPictureFormFor: aPicture
	| client |
	aPicture url ifNil: [ ^ nil ].
	client := ZnClient new
 		beOneShot;
  		contentReader: [ :entity | 
			ImageReadWriter formFromStream: entity readStream binary ].
	^ client get: aPicture url