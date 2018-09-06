accessing
gender
	^ self properties at: 'gender' ifAbsent: [ '-' ]