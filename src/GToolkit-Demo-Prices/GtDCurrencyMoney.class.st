Class {
	#name : #GtDCurrencyMoney,
	#superclass : #GtDMoney,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #'GToolkit-Demo-Prices-Model'
}

{ #category : #testing }
GtDCurrencyMoney >> < aMoney [
	^ (aMoney isZero and: [self amount < 0]) or: [ 
		self currency = aMoney currency and: [ self amount < aMoney amount ] ]
]

{ #category : #testing }
GtDCurrencyMoney >> = aMoney [
	^ (self isZero and: [ aMoney isZero ]) or: [
		(aMoney class = GtDCurrencyMoney) and: [ 
			 aMoney amount = self amount and: [ 
				aMoney currency = self currency ] ] ]
]

{ #category : #testing }
GtDCurrencyMoney >> > aMoney [
	^ (aMoney isZero and: [self amount > 0]) or: [ 
		self currency = aMoney currency and: [ self amount > aMoney amount ] ]
]

{ #category : #operations }
GtDCurrencyMoney >> add: aMoney [
	"We know that I am a ${class:UCurrencyBag}$, so I dispatch through that method"
	^ aMoney addCurrencyMoney: self
]

{ #category : #operations }
GtDCurrencyMoney >> addCurrencyMoney: aMoney [
	^ self currency = aMoney currency
		ifTrue: [ self class new 	
				amount: self amount + aMoney amount; 
				currency: self currency ]
		ifFalse: [ GtDMoneyBag new addCurrencyMoney: self; addCurrencyMoney: aMoney ]
]

{ #category : #operations }
GtDCurrencyMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag addCurrencyMoney: self
]

{ #category : #accessing }
GtDCurrencyMoney >> amount [
	^ amount
]

{ #category : #accessing }
GtDCurrencyMoney >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
GtDCurrencyMoney >> currency [
	^ currency
]

{ #category : #accessing }
GtDCurrencyMoney >> currency: anObject [
	currency := anObject
]

{ #category : #operations }
GtDCurrencyMoney >> divideBy: aNumber [
	^ self class new 
		amount: self amount / aNumber;
		currency: self currency
]

{ #category : #ui }
GtDCurrencyMoney >> gtDisplayOn: stream [
	| digits |
	digits := self amount fractionPart > 0 ifTrue: [ 2 ] ifFalse: [ 0 ].
	stream
		nextPutAll: (self amount printShowingDecimalPlaces: digits);
		space;
		nextPutAll: self currency name
]

{ #category : #operations }
GtDCurrencyMoney >> gtDividingMoney: aMoney [
	<return: #Number>
	aMoney isZero ifTrue: [ ^ 0 ].
	self assert: [ aMoney currency = self currency ].
	^ aMoney amount / self amount
]

{ #category : #testing }
GtDCurrencyMoney >> isZero [
	^ self amount isZero
]

{ #category : #operations }
GtDCurrencyMoney >> multiplyBy: aNumber [
	^ self class new 
		amount: self amount * aNumber;
		currency: self currency
]

{ #category : #operations }
GtDCurrencyMoney >> negative [
	^ self class new 
		amount: 0 - self amount;
		currency: self currency
]
