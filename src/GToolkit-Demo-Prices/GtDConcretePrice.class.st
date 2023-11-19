Class {
	#name : #GtDConcretePrice,
	#superclass : #GtDPrice,
	#instVars : [
		'money'
	],
	#category : #'GToolkit-Demo-Prices'
}

{ #category : #ui }
GtDConcretePrice >> asOverviewChildrenIn: containerElement [
	"nothing"
]

{ #category : #operations }
GtDConcretePrice >> dividingPrice: aPrice [
	self assert: [ aPrice isKindOf: GtDPrice ].
	^ self money / aPrice money
]

{ #category : #accessing }
GtDConcretePrice >> money [
	^ money
]

{ #category : #accessing }
GtDConcretePrice >> money: aMoney [
	self assert: [ money isNil ] description: 'Concrete prices are immutable'.
	self assert: [ aMoney isKindOf: GtDMoney ].
	
	money := aMoney
]

{ #category : #printing }
GtDConcretePrice >> printOn: stream [
	money printOn: stream
]
