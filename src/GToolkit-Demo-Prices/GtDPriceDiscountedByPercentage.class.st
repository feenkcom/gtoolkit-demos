Class {
	#name : #GtDPriceDiscountedByPercentage,
	#superclass : #GtDModifiedPrice,
	#instVars : [
		'discountPercentage'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #ui }
GtDPriceDiscountedByPercentage >> asOverviewChildrenIn: childrenElement [
	| percentageElement multiplyElement |
	percentageElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: (self discountPercentage * 100) asString , '%';
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ].
	multiplyElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: ' off ';
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ].
	childrenElement addChild: percentageElement.
	childrenElement addChild: multiplyElement.
	price asOverviewElementIn: childrenElement
]

{ #category : #accessing }
GtDPriceDiscountedByPercentage >> discountPercentage [
	^ discountPercentage
]

{ #category : #accessing }
GtDPriceDiscountedByPercentage >> discountPercentage: anObject [
	discountPercentage := anObject
]

{ #category : #ui }
GtDPriceDiscountedByPercentage >> localDisplayOn: stream [
	stream nextPutAll: (self discountPercentage * 100) asString, '% off '.
	self price localWithPossibleParanthesesDisplayOn: stream
]

{ #category : #accessing }
GtDPriceDiscountedByPercentage >> money [
	| originalMoney |
	originalMoney := self price money.
	^ originalMoney - (originalMoney * self discountPercentage)
]
