accessing
age
	^ self properties at: 'age' ifAbsent: [ 0 ]