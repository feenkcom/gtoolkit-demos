Class {
	#name : #GtDDividedPrice,
	#superclass : #GtDModifiedPrice,
	#instVars : [
		'divisor'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #ui }
GtDDividedPrice >> asOverviewChildrenIn: childrenElement [
	| multiplierElement multiplyElement |
	multiplierElement := BrLabel new look: BrGlamorousLabelAptitude; text: self divisor asString; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	multiplyElement := BrLabel new look: BrGlamorousLabelAptitude; text: '/'; constraintsDo: [:c | 
		c vertical fitContent. 
		c horizontal fitContent. 
		c linear vertical alignCenter ].
	childrenElement addChild: multiplierElement.
	childrenElement addChild: multiplyElement.
	price asOverviewElementIn: childrenElement
]

{ #category : #accessing }
GtDDividedPrice >> divisor [
	^ divisor
]

{ #category : #accessing }
GtDDividedPrice >> divisor: anObject [
	divisor := anObject
]

{ #category : #printing }
GtDDividedPrice >> localDisplayOn: stream [
	self price localWithPossibleParanthesesDisplayOn: stream.
	stream 
		nextPutAll: ' / '; 
		nextPutAll: self divisor asString
]

{ #category : #accessing }
GtDDividedPrice >> money [
	^ self price money / self divisor
]
