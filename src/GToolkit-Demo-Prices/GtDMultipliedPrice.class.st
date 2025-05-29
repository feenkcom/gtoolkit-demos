Class {
	#name : #GtDMultipliedPrice,
	#superclass : #GtDModifiedPrice,
	#instVars : [
		'multiplier'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #ui }
GtDMultipliedPrice >> asOverviewChildrenIn: childrenElement [
	| multiplierElement multiplyElement |
	multiplierElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: self multiplier asString;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ].
	multiplyElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: '*';
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ].
	childrenElement addChild: multiplierElement.
	childrenElement addChild: multiplyElement.
	price asOverviewElementIn: childrenElement
]

{ #category : #printing }
GtDMultipliedPrice >> localDisplayOn: stream [
	self price localWithPossibleParanthesesDisplayOn: stream.
	stream 
		nextPutAll: ' * '; 
		nextPutAll: self multiplier asString
]

{ #category : #accessing }
GtDMultipliedPrice >> money [
	^ self price money * multiplier
]

{ #category : #accessing }
GtDMultipliedPrice >> multiplier [
	^ multiplier
]

{ #category : #accessing }
GtDMultipliedPrice >> multiplier: anObject [
	multiplier := anObject
]
