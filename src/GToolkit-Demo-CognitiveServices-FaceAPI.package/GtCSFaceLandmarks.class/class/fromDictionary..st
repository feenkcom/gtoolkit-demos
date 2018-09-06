instance creation
fromDictionary: aDictionary
	| landmarks |
	landmarks := aDictionary associations
		inject: Dictionary new
		into: [ :currentLandmarks :association | 
			currentLandmarks 
				at: association key put: (Point
					x: (association value at: 'x')
					y: (association value at: 'y'));
				yourself ]. 
	^ self new properties: landmarks