drawing
drawOnSpartaCanvas: aCanvas
	| aScale origin|
	super drawOnSpartaCanvas: aCanvas.
	
	(picture isNil or: [ picture pictureForm isNil ]) ifTrue: [ ^ self ].
	
	bitmap ifNil: [ bitmap := aCanvas bitmap fromForm: picture pictureForm ].
	
	"aScale := self computeScaleFrom: self extent to: picture pictureForm extent asFloatPoint."
	aScale := (self extent / picture pictureForm extent) asFloatPoint.
	
	aScale ~= (1@1) ifTrue: [ 
		aCanvas transform
			push;
			scaleBy: aScale;
			apply ].
	"self halt."
	"origin := (self bounds center scaleBy: (picture pictureForm extent/self extent))  - 
			(picture pictureForm extent //2 ) asFloatPoint."
	origin := 0@0.
	
	aCanvas fill
		path: (origin extent: picture pictureForm extent);
		paint: bitmap;
		draw.
		
	aScale ~= (1@1) ifTrue: [ 
		aCanvas transform pop ]