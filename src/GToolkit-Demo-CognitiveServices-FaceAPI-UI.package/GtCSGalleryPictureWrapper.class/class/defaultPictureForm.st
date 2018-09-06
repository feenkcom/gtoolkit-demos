accessing
defaultPictureForm
	^ defaultPictureForm ifNil: [
		defaultPictureForm := (Form extent: 300@300) fillColor: Color white ]