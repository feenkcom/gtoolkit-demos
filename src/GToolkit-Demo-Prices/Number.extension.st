Extension { #name : #Number }

{ #category : #'*GToolkit-Demo-Prices' }
Number >> gtDiscountFrom: aPrice [
	self assert: [ self <= 1 ].
	^ GtDPriceDiscountedByPercentage new price: aPrice; discountPercentage: self
]

{ #category : #'*GToolkit-Demo-Prices' }
Number >> gtDividingMoney: aMoney [
	^ aMoney divideBy: self
]

{ #category : #'*GToolkit-Demo-Prices' }
Number >> gtDividingPrice: aPrice [
	^ GtDDividedPrice new
		price: aPrice;
		divisor: self
]

{ #category : #'*GToolkit-Demo-Prices' }
Number >> gtEUR [
	^ GtDCurrencyMoney new amount: self; currency: GtDCurrency gtEUR
]

{ #category : #'*GToolkit-Demo-Prices' }
Number >> gtUSD [
	^ GtDCurrencyMoney new amount: self; currency: GtDCurrency gtUSD
]
