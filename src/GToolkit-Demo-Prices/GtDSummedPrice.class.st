Class {
	#name : #GtDSummedPrice,
	#superclass : #GtDModifiedPrice,
	#instVars : [
		'additionalPrice'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #accessing }
GtDSummedPrice >> additionalPrice [
	^ additionalPrice
]

{ #category : #accessing }
GtDSummedPrice >> additionalPrice: anObject [
	additionalPrice := anObject
]

{ #category : #ui }
GtDSummedPrice >> asOverviewChildrenIn: childrenElement [
	| plusElement |
	price asOverviewElementIn: childrenElement.
	plusElement := BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		text: '+';
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal fitContent.
			c linear vertical alignCenter ].
	childrenElement addChild: plusElement.
	self additionalPrice asOverviewElementIn: childrenElement
]

{ #category : #accessing }
GtDSummedPrice >> children [
	^ super children, { self additionalPrice }
]

{ #category : #printing }
GtDSummedPrice >> localDisplayOn: stream [
	self price localWithPossibleParanthesesDisplayOn: stream.
	stream nextPutAll: ' + '.
	self additionalPrice localWithPossibleParanthesesDisplayOn: stream
]

{ #category : #accessing }
GtDSummedPrice >> money [
	^ self price money + self additionalPrice money
]
