Class {
	#name : #GtDPriceDiscountedByMoney,
	#superclass : #GtDModifiedPrice,
	#instVars : [
		'discountMoney'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #ui }
GtDPriceDiscountedByMoney >> asOverviewChildrenIn: childrenElement [
	| discountElement minusElement |
	price asOverviewElementIn: childrenElement.
	minusElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: '-';
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ].
	discountElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: self discountMoney gtDisplayString;
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ].
	childrenElement addChild: minusElement.
	childrenElement addChild: discountElement
]

{ #category : #accessing }
GtDPriceDiscountedByMoney >> discountMoney [
	^ discountMoney
]

{ #category : #accessing }
GtDPriceDiscountedByMoney >> discountMoney: anObject [
	discountMoney := anObject
]

{ #category : #accessing }
GtDPriceDiscountedByMoney >> localDisplayOn: stream [
	self discountMoney gtDisplayOn: stream.
	stream nextPutAll: ' off '.
	self price localWithPossibleParanthesesDisplayOn: stream.
	
]

{ #category : #accessing }
GtDPriceDiscountedByMoney >> money [
	^ self price money - self discountMoney
]
