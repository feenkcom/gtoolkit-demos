Class {
	#name : #GtDZeroMoney,
	#superclass : #GtDMoney,
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #testing }
GtDZeroMoney >> < aMoney [
	^ aMoney isZero not and: [ aMoney > self ]
]

{ #category : #testing }
GtDZeroMoney >> = aMoney [
	^ (aMoney isKindOf: GtDMoney) and: [ aMoney isZero ]
]

{ #category : #testing }
GtDZeroMoney >> > aMoney [
	^ aMoney isZero not and: [ aMoney < self ]
]

{ #category : #operations }
GtDZeroMoney >> add: aMoney [
	^ aMoney
]

{ #category : #operations }
GtDZeroMoney >> addCurrencyMoney: aCurrencyMoney [
	^ aCurrencyMoney
]

{ #category : #operations }
GtDZeroMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag
]

{ #category : #operations }
GtDZeroMoney >> divideBy: aNumber [
	^ self
]

{ #category : #printing }
GtDZeroMoney >> gtDisplayOn: stream [
	stream  nextPutAll: '0'
]

{ #category : #testing }
GtDZeroMoney >> isZero [
	^ true
]

{ #category : #operations }
GtDZeroMoney >> multiplyBy: aNumber [
	^ self
]

{ #category : #operations }
GtDZeroMoney >> negative [
	^ self
]
