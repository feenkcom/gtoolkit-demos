accessing
picturesCache
	^ picturesCache ifNil: [ 
		picturesCache := LRUCache new 
			beThreadSafe;
			maximumWeight: 8 ]