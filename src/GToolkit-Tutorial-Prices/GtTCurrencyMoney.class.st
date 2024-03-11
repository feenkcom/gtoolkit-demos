"
I am a quantity of money in a specific currency. I am usually instantiated by sending a factory message to a number, eg:
```
42 euros
```

"
Class {
	#name : #GtTCurrencyMoney,
	#superclass : #GtTMoney,
	#instVars : [
		'amount',
		'currency'
	],
	#category : #'GToolkit-Tutorial-Prices-Model'
}

{ #category : #testing }
GtTCurrencyMoney >> < aMoney [
	^ (aMoney isZero and: [self amount < 0]) or: [ 
		self currency = aMoney currency and: [ self amount < aMoney amount ] ]
]

{ #category : #testing }
GtTCurrencyMoney >> = aMoney [
	^ (self isZero and: [ aMoney isZero ]) or: [
		(aMoney class = GtTCurrencyMoney) and: [ 
			 aMoney amount = self amount and: [ 
				aMoney currency = self currency ] ] ]
]

{ #category : #testing }
GtTCurrencyMoney >> > aMoney [
	^ (aMoney isZero and: [self amount > 0]) or: [ 
		self currency = aMoney currency and: [ self amount > aMoney amount ] ]
]

{ #category : #operations }
GtTCurrencyMoney >> add: aMoney [
	"We know that I am a ${class:UCurrencyBag}$, so I dispatch through that method"
	^ aMoney addCurrencyMoney: self
]

{ #category : #operations }
GtTCurrencyMoney >> addCurrencyMoney: aMoney [
	^ self currency = aMoney currency
		ifTrue: [ self class new 	
				amount: self amount + aMoney amount; 
				currency: self currency ]
		ifFalse: [ GtTMoneyBag new addCurrencyMoney: self; addCurrencyMoney: aMoney ]
]

{ #category : #operations }
GtTCurrencyMoney >> addMoneyBag: aMoneyBag [
	^ aMoneyBag addCurrencyMoney: self
]

{ #category : #accessing }
GtTCurrencyMoney >> amount [
	^ amount
]

{ #category : #accessing }
GtTCurrencyMoney >> amount: anObject [
	amount := anObject
]

{ #category : #accessing }
GtTCurrencyMoney >> currency [
	^ currency
]

{ #category : #accessing }
GtTCurrencyMoney >> currency: anObject [
	currency := anObject
]

{ #category : #accessing }
GtTCurrencyMoney >> discountFrom: aPrice [
	^ PriceDiscountedByMoney new
		price: aPrice;
		discountMoney: self
]

{ #category : #operations }
GtTCurrencyMoney >> divideBy: aNumber [
	^ self class new 
		amount: self amount / aNumber;
		currency: self currency
]

{ #category : #ui }
GtTCurrencyMoney >> gtDisplayOn: stream [
	stream 
		nextPutAll: (self amount printShowingDecimalPlaces: 2);
		space;
		nextPutAll: self currency name
]

{ #category : #operations }
GtTCurrencyMoney >> gtDividingMoney: aMoney [
	<return: #Number>
	aMoney isZero ifTrue: [ ^ 0 ].
	self assert: [ aMoney currency = self currency ].
	^ aMoney amount / self amount
]

{ #category : #testing }
GtTCurrencyMoney >> isZero [
	^ self amount isZero
]

{ #category : #operations }
GtTCurrencyMoney >> multiplyBy: aNumber [
	^ self class new 
		amount: self amount * aNumber;
		currency: self currency
]

{ #category : #operations }
GtTCurrencyMoney >> negative [
	^ self class new 
		amount: 0 - self amount;
		currency: self currency
]
