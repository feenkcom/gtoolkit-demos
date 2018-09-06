accessing
pictureForm: aForm
	aForm ifNotNil: [ extent := aForm extent ].
	picture pictureForm: aForm 