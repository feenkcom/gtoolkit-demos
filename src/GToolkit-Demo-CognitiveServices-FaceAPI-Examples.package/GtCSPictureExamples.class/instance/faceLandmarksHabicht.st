example - face
faceLandmarksHabicht
	<gtExample>
	| landmarks |
	landmarks := (GtCSFaceLandmarks fromDictionary: 
		self jsonFaceLandmarksHabicht).
	^ landmarks

