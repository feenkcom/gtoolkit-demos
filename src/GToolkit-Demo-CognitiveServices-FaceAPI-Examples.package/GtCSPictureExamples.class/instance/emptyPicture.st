example - picture
emptyPicture
	<gtExample>
	| picture |
	picture := GtCSPicture new
		url: self pictureUrl.
	self assert: picture url equals: self pictureUrl.
	self assert: picture faces isEmpty.
	self assert: picture hasFaceStorage equals: false.
	^ picture