Class {
	#name : #GtTZeroMoney,
	#superclass : #GtTMoney,
	#category : #'GToolkit-Tutorial-Prices-Model'
}

{ #category : #testing }
GtTZeroMoney >> < aMoney [
	^ aMoney isZero not and: [ aMoney > self ]
]

{ #category : #testing }
GtTZeroMoney >> = aMoney [
	^ (aMoney isKindOf: GtTMoney) and: [ aMoney isZero ]
]

{ #category : #testing }
GtTZeroMoney >> > aMoney [
	^ aMoney isZero not and: [ aMoney < self ]
]

{ #category : #operations }
GtTZeroMoney >> add: aMoney [
	^ aMoney
]

{ #category : #operations }
GtTZeroMoney >> addCurrencyMoney: aCurrencyMoney [
	^ aCurrencyMoney
]

{ #category : #operations }
GtTZeroMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag
]

{ #category : #operations }
GtTZeroMoney >> divideBy: aNumber [
	^ self
]

{ #category : #printing }
GtTZeroMoney >> gtDisplayOn: stream [
	stream  nextPutAll: '0'
]

{ #category : #testing }
GtTZeroMoney >> isZero [
	^ true
]

{ #category : #operations }
GtTZeroMoney >> multiplyBy: aNumber [
	^ self
]

{ #category : #operations }
GtTZeroMoney >> negative [
	^ self
]
