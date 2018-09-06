example - face
faceLandmarksEinstein
	<gtExample>
	| landmarks |
	landmarks := (GtCSFaceLandmarks fromDictionary: self jsonFaceLandmarksEinstein).
	^ landmarks

