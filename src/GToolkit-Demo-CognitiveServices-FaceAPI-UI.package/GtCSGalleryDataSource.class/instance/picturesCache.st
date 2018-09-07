accessing
picturesCache
	^ picturesCache ifNil: [ 
		self picturesCache: LRUCache new 
			beThreadSafe;
			maximumWeight: 8 ]