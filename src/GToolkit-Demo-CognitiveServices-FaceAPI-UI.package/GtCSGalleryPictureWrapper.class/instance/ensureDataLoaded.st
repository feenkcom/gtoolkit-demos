actions
ensureDataLoaded
	| loadActions |
	loadActions := #().
	picture pictureForm ifNil: [ 
		loadActions := #(loadPictureFormFor:) ].
	picture hasFaceStorage ifFalse: [ 
		loadActions := loadActions, #(loadFaceDataFor:) ].
	loadActions ifNotEmpty: [ 
		self performActions: loadActions ]