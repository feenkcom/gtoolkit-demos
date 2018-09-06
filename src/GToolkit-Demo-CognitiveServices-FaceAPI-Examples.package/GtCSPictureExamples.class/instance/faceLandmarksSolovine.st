example - face
faceLandmarksSolovine
	<gtExample>
	| landmarks |
	landmarks := (GtCSFaceLandmarks fromDictionary: self jsonFaceLandmarksSolovine).
	^ landmarks

